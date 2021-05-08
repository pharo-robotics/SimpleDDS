"
A publication server manages a listener or access point into the publication realm. 
Each publication server works for one publication and for one protocol
"
Class {
	#name : #DDSParticipantProtocolServer,
	#superclass : #Object,
	#instVars : [
		'protocol',
		'port',
		'ip',
		'process',
		'listener',
		'participant'
	],
	#category : #'SimpleDDS-Publishing'
}

{ #category : #constructor }
DDSParticipantProtocolServer class >> startOn: anIP at: aPort for: aProtocol participant: aParticipant [
	^ self new
		ip: anIP;
		port: aPort;
		protocol: aProtocol;
		participant: aParticipant;
		start;
		yourself
]

{ #category : #'error handling' }
DDSParticipantProtocolServer >> handleError: anError [
	(anError isKindOf: OutOfMemory)
		ifFalse: [ self error: anError messageText ]
]

{ #category : #accessing }
DDSParticipantProtocolServer >> ip [
	^ ip
]

{ #category : #accessing }
DDSParticipantProtocolServer >> ip: anIp [	
	ip := anIp.
]

{ #category : #accessing }
DDSParticipantProtocolServer >> isRunning [

	^ process isNotNil and: [ process isRunning ]
]

{ #category : #testing }
DDSParticipantProtocolServer >> isTCP [
	^ protocol isTCP
]

{ #category : #accessing }
DDSParticipantProtocolServer >> participant: aParticipant [
	participant := aParticipant
]

{ #category : #accessing }
DDSParticipantProtocolServer >> port [
	^ port
]

{ #category : #accessing }
DDSParticipantProtocolServer >> port: anObject [
	port := anObject
]

{ #category : #accessing }
DDSParticipantProtocolServer >> protocol [
	^ protocol
]

{ #category : #accessing }
DDSParticipantProtocolServer >> protocol: anObject [
	protocol := anObject
]

{ #category : #run }
DDSParticipantProtocolServer >> spinOnce [
	listener isValid
		ifFalse: [ listener destroy.
			process kill ].
	protocol acceptConnectionFrom: listener with: participant offersOfConnection
]

{ #category : #accessing }
DDSParticipantProtocolServer >> start [
	listener
		ifNil: [ listener := protocol createSocketForlistenAt: ip on: port.
			process := TKTParameterizableService new.
			process onSetUpDo: (MessageSend receiver: self selector: #traceCr: argument: 'Participant protocol server started').
			process
				onTearDownDo: [ self traceCr: 'Participant protocol server finished'.
					self halt ].
			process step: (MessageSend receiver: self selector: #spinOnce).
			process name: participant name, ' ', protocol name ,  ' protocol server ', UUID new asString.
			process start ]
]

{ #category : #accessing }
DDSParticipantProtocolServer >> stop [

		
	listener destroy.
	process kill. 
	process := nil.
	participant := nil.
	^ self
]

{ #category : #testing }
DDSParticipantProtocolServer >> supports: aProtocolName [
	^ protocol name = aProtocolName.
]

{ #category : #accessing }
DDSParticipantProtocolServer >> url [
	^ ('http://' , (NetNameResolver stringFromAddress: ip) , ':' , port asString) asZnUrl
]
