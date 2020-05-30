"
This version of the service server relies on the participant related server to serve the service
"
Class {
	#name : #DDSExposedServiceServer,
	#superclass : #DDSServiceServer,
	#instVars : [
		'connectionOffer',
		'isRunning'
	],
	#category : 'SimpleDDS-Services'
}

{ #category : #'as yet unclassified' }
DDSExposedServiceServer >> configureConnection: aReadWriteConnection [
	aReadWriteConnection inputMarshaller: service type requestMarshaller.
	aReadWriteConnection outputMarshaller: service type responseMarshaller.
]

{ #category : #accessing }
DDSExposedServiceServer >> connectionOffer [
	^ connectionOffer
		ifNil:
			[ connectionOffer := DDSServiceConnectionOffer
				service: service
				participant: participant
				onNewConnection: [ :conn | self configureConnection: conn.
					self serveAndClose: conn ] ]
]

{ #category : #accessing }
DDSExposedServiceServer >> destroy [
	self stop.
	super destroy
]

{ #category : #initialization }
DDSExposedServiceServer >> initialize [
	super initialize.
	isRunning := false
]

{ #category : #testing }
DDSExposedServiceServer >> isLocalServer [
	^ true
]

{ #category : #accessing }
DDSExposedServiceServer >> isRunning [
	^ isRunning
]

{ #category : #'as yet unclassified' }
DDSExposedServiceServer >> serveAndClose: aConnection [
	| request |
	request := aConnection read.
	aConnection write: (self evaluate: request for: participant).
	aConnection close
]

{ #category : #accessing }
DDSExposedServiceServer >> start [
	participant registerConnectionOffer: self connectionOffer.
	isRunning := true
]

{ #category : #accessing }
DDSExposedServiceServer >> stop [
	connectionOffer
		ifNotNil: [ participant unregisterConnectionOffer: connectionOffer.
			connectionOffer := nil.
			isRunning := false ]
]

{ #category : #accessing }
DDSExposedServiceServer >> tcpUrl [
	^ participant relatedTcpServer url
]

{ #category : #accessing }
DDSExposedServiceServer >> xmlrpcUrl [
	^ participant relatedXmlRpcServerUrl
]
