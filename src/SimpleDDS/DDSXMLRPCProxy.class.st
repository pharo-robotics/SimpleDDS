"
A RoStProxy is an XML RPC proxy that wraps retrun values of method invokations into instances of RoStReturnValue
"
Class {
	#name : #DDSXMLRPCProxy,
	#superclass : #XMLRPCProxy,
	#category : 'SimpleDDS-Proxy'
}

{ #category : #constructor }
DDSXMLRPCProxy class >> url: urlString [
	|url|
	url := ZnUrl fromString: urlString.
	^self new
		url: url;
		yourself
]

{ #category : #converting }
DDSXMLRPCProxy >> asString [
	^ ' XMLRPC at: ', url asString.
]

{ #category : #invoking }
DDSXMLRPCProxy >> invokeMethod: method withArgs: args [
	| returnArray |
	returnArray := super invokeMethod: method withArgs: args.
	^ (DDSXmlRpcResponse elements: returnArray) value
]

{ #category : #printing }
DDSXMLRPCProxy >> printOn: aStream [
	^ self asString printOn: aStream.
]

{ #category : #invoking }
DDSXMLRPCProxy >> setUrl: urlString [
	self url: (ZnUrl fromString: urlString).

]
