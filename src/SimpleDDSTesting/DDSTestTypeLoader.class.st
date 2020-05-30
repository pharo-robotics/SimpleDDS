"
Type loader for testing proposes
"
Class {
	#name : #DDSTestTypeLoader,
	#superclass : #DDSTypeLoader,
	#category : 'SimpleDDSTesting-Services'
}

{ #category : #'as yet unclassified' }
DDSTestTypeLoader >> installRegistry [
	registry := Dictionary new
]

{ #category : #'as yet unclassified' }
DDSTestTypeLoader >> privateRegisterTypeDefinition: aMDDSTypeDefinition [
	registry at: aMDDSTypeDefinition name put: (self encodeTypeDefinition: aMDDSTypeDefinition).
	^ aMDDSTypeDefinition
]

{ #category : #'as yet unclassified' }
DDSTestTypeLoader >> serve [

]

{ #category : #'as yet unclassified' }
DDSTestTypeLoader >> unserve [

]

{ #category : #'as yet unclassified' }
DDSTestTypeLoader >> uri [
	^ 'http://127.0.0.1:3021'
]
