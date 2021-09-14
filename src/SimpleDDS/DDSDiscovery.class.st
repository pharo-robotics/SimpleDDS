"
This class is in charge of managing the all what goes to discovering of the network in a ROS 1.0 environment
"
Class {
	#name : #DDSDiscovery,
	#superclass : #Object,
	#instVars : [
		'blackList'
	],
	#category : 'SimpleDDS-Discovery'
}

{ #category : #accessing }
DDSDiscovery >> blackList [
	^ blackList
]

{ #category : #connection }
DDSDiscovery >> connect: anUrl to: aSubscriber for: aParticipantMirror in: aDomain [
	| proxy |
	proxy := DDSParticipantProxy on: anUrl.
	[ | protocol petition connection |
	petition := proxy possibleConnectionsFor: aSubscriber for: aParticipantMirror in: aDomain.
	protocol := aDomain protocols
		detect: [ :prtcl | petition itIsSupportedBy: prtcl ]
		ifNone: [ DDSError
				signal:
					(''
						join:
							{'There is no support for '.
							petition protocolName}) ].
	connection := protocol connect: petition.
	connection urlrpc: anUrl.
	connection marshaller: aSubscriber topic type marshaller.
	(aSubscriber subscriptionFor: aParticipantMirror participant) registerConnection: connection ]
		on: ConnectionTimedOut
		do: [ :e | self traceCr: e messageText.
			self increaseBlacklistCounterFor: anUrl ]
]

{ #category : #'manage list' }
DDSDiscovery >> increaseBlacklistCounterFor: anUrl [ 
	blackList at: anUrl put: (blackList at: anUrl ifAbsentPut: 0) + 1
]

{ #category : #initialization }
DDSDiscovery >> initialize [
	super initialize.
	blackList := Dictionary new.
]

{ #category : #testing }
DDSDiscovery >> isBlacklistedUrl: anUrl [
	^ (blackList at: anUrl ifAbsentPut: 0) > self tries.
]

{ #category : #'manage list' }
DDSDiscovery >> manage: anURLSet for: aSubscriber with: aParticipantMirror in: aDomain [
	anURLSet
		reject: [ :url | 
			(self isBlacklistedUrl: url)
				or: [ 
					(aSubscriber
						subscriptionFor: aParticipantMirror participant
						ifNone: [ self error: 'There Is not subscription for the related topic' ]) connections
						anySatisfy: [ :con | con urlrpc = url ] ] ]
		thenDo: [ :url | 
			self
				connect: url
				to: aSubscriber
				for: aParticipantMirror
				in: aDomain ]
]

{ #category : #'manage list' }
DDSDiscovery >> tries [
	^ 5.
]
