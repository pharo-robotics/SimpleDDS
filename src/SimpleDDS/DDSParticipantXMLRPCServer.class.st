"
It makes available the Participant server in a XMLRPC format

"
Class {
	#name : #DDSParticipantXMLRPCServer,
	#superclass : #DDSParticipantServer,
	#instVars : [
		'serving'
	],
	#category : 'SimpleDDS-ParticipantServer'
}

{ #category : #initialization }
DDSParticipantXMLRPCServer >> initialize [
	super initialize.
	serving := false.
]

{ #category : #testing }
DDSParticipantXMLRPCServer >> isServing [
	^ serving
]

{ #category : #exposition }
DDSParticipantXMLRPCServer >> serve [
	XMLRPCService
		atPort: port
		serve:
			{(#getBusInfo -> {(self -> #getBusInfo:)}).
			(#getPid -> {(self -> #pid:)}).
			(#requestTopic -> {(self -> #requestTopic:for:availableFor:)}).
			(#getPublications -> {(self -> #getPublications:)}).
			(#paramUpdate -> {(self -> #from:update:with:)}).
			(#publisherUpdate -> {(self -> #informFrom:for:publishers:)})} asXMLRPCHttpModule
		at: '/'.
	serving := true
]

{ #category : #exposition }
DDSParticipantXMLRPCServer >> unserve [
	self isServing
		ifTrue: [ 
			XMLRPCService stop: port.
			serving := false ]
]
