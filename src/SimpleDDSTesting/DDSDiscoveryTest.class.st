Class {
	#name : #DDSDiscoveryTest,
	#superclass : #BabyMock2TestCase,
	#instVars : [
		'tcpProtocol',
		'discovery',
		'urlSet',
		'participantMirror',
		'domain',
		'topic',
		'participant',
		'subscription',
		'subscriber',
		'subcriber'
	],
	#category : 'SimpleDDSTesting-Discovery'
}

{ #category : #'as yet unclassified' }
DDSDiscoveryTest >> setUp [
	super setUp.
	discovery := DDSDiscovery new.
	urlSet := { 'http://127.0.0.1:3021' }.
	
	domain := MDDSDomain new.
	
	participantMirror := protocol mock:'participantmirror'.
	participant := protocol mock:'participant'.
	protocol describe allow: participantMirror recv: #participant; => participant.
	protocol describe allow: participantMirror recv: #protocols; => Set new.

	subscriber := protocol mock:'subscriber'.
	subscription := protocol mock:'subscription'.
	topic := protocol mock:'topic'.
	protocol describe allow: subscriber recv:#subscriptionFor:ifNone:; => subscription.	
	protocol describe allow: subscription recv:#connections; => Set new.
	protocol describe allow: subscriber recv:#topic; => topic.		




]

{ #category : #'as yet unclassified' }
DDSDiscoveryTest >> testDiscoveryBlackListCounterUps [
	discovery
		manage: urlSet
		for: subscriber
		with: participantMirror
		in: domain.
	self assert: (discovery blackList at: urlSet anyOne) = 1.
	self deny: (discovery isBlacklistedUrl: urlSet anyOne).
]

{ #category : #'as yet unclassified' }
DDSDiscoveryTest >> testDiscoveryBlackListedAfterLimit [
	1 to: discovery tries + 1 do: [ :idx | 
		discovery
			manage: urlSet
			for: subscriber
			with: participantMirror
			in: domain.
		self assert: (discovery blackList at: urlSet anyOne) = idx ].
	
	self assert: (discovery isBlacklistedUrl: urlSet anyOne)
]

{ #category : #'as yet unclassified' }
DDSDiscoveryTest >> testDiscoveryBlackListedAfterLimitItIsIndeedBlacklisted [
	"After being blacklisted, an url is not tried to be connected, then the blacklist counter is not updated anymore "
	self testDiscoveryBlackListedAfterLimit.
	1 to: discovery tries + 1 do: [ :idx | 
		discovery
			manage: urlSet
			for: subscriber
			with: participantMirror
			in: domain.
		self assert: (discovery blackList at: urlSet anyOne) = (discovery tries + 1) ]
]
