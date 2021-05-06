"
A ROS response is compound of 3 elements described below: statusCode, statusMessage, and value.

    statusCode (Integer): An integer indicating the completion condition of the method. Current values:
        -1: ERROR: Error on the part of the caller, e.g. an invalid parameter. In general, this means that the master/slave did not attempt to execute the action.
        0: FAILURE: Method failed to complete correctly. In general, this means that the master/slave attempted the action and failed, and there may have been side-effects as a result.
        1: SUCCESS: Method completed successfully.
        Individual methods may assign additional meaning/semantics to statusCode. 
    statusMessage (String): a human-readable string describing the return status
    value (Object): return value is further defined by individual API calls. 


Instance Variables
	elements: 		<Array>  

elements
	a 3 elements array that conforms in the format: 
{statusCode. statusMessage. value}. The elements are described above as parts of a retrun value


"
Class {
	#name : #DDSXmlRpcResponse,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : 'SimpleDDS-Proxy'
}

{ #category : #constructor }
DDSXmlRpcResponse class >> elements: aCollection [ 
	^ self new elements: aCollection ; yourself.
]

{ #category : #accessing }
DDSXmlRpcResponse >> elements: a3ElementsArray [
	elements := a3ElementsArray
]

{ #category : #testing }
DDSXmlRpcResponse >> isError [
	^ self statusCode = -1
]

{ #category : #testing }
DDSXmlRpcResponse >> isFailure [
	^self statusCode = 0
	
]

{ #category : #testing }
DDSXmlRpcResponse >> isSuccess [
	^self statusCode = 1
	
]

{ #category : #printing }
DDSXmlRpcResponse >> printOn: aStream [
	elements printOn: aStream
]

{ #category : #accessing }
DDSXmlRpcResponse >> statusCode [
	^elements first
]

{ #category : #accessing }
DDSXmlRpcResponse >> statusMessage [
	^elements second
]

{ #category : #evaluating }
DDSXmlRpcResponse >> value [
	self isSuccess
		ifFalse: [ self error: self statusMessage ].
	^ elements last
]
