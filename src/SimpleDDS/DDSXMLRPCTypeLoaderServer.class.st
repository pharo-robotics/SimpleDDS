"
A DDSXMLRPCTypeLoaderServer for this flavor of callback parameter, it expose all the basic services through xmlrpc. 
"
Class {
	#name : #DDSXMLRPCTypeLoaderServer,
	#superclass : #DDSTypeLoader,
	#instVars : [
		'ip',
		'port',
		'serving'
	],
	#category : #'SimpleDDS-Discovery'
}

{ #category : #'as yet unclassified' }
DDSXMLRPCTypeLoaderServer class >> on: aTypeLoader at: aPort [
	^ self new typeLoader: aTypeLoader; port: aPort; yourself.
]

{ #category : #'publishing metadata' }
DDSXMLRPCTypeLoaderServer >> from: aCallerID update: aParameterName with: aValue [
	super from: aCallerID update: aParameterName with: aValue.
	^ {1 . false . false}
]

{ #category : #'publishing metadata' }
DDSXMLRPCTypeLoaderServer >> informFrom: aCallerID for: aTopic publishers: aSetOfPublishers [
	^ {1 . false . false}
]

{ #category : #initialization }
DDSXMLRPCTypeLoaderServer >> initializeWith: aDomainProxy [
	serving := false.
	ip := aDomainProxy ip.
	port := aDomainProxy obtainPort.
	super initializeWith: aDomainProxy
]

{ #category : #exposition }
DDSXMLRPCTypeLoaderServer >> serve [
	serving
		ifFalse: [ 
			XMLRPCService
				atPort: port
				serve:
					{(#paramUpdate -> {(self -> #from:update:with:)}).
					(#publisherUpdate -> {(self -> #informFrom:for:publishers:)})} asXMLRPCHttpModule
				at: '/'.
			serving := true ]
]

{ #category : #exposition }
DDSXMLRPCTypeLoaderServer >> unserve [
	serving
		ifTrue: [ 
			XMLRPCService stop: port.
			serving := false ]
]

{ #category : #accessing }
DDSXMLRPCTypeLoaderServer >> uri [
	^ 'http://{1}:{2}/'
		format:
			{ip.
			port}
]
