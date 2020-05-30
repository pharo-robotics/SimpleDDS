"
Since a parameter maybe stored in different namespaces there is a path to reach a particualr parameter. 

The parameter path is defined by a collection of strings, AKA the chains of namespaces to follow in order to reach the parameter. And finally a parameter name. 

This object is meant to fetch information from a namespace, diving on it and fetch the needed parameter. 

all the public methods are mean to be executed with the root namespace in order to reach the goal. 
"
Class {
	#name : #DDSSParameterPath,
	#superclass : #Object,
	#instVars : [
		'steps',
		'parameterName'
	],
	#category : 'SimpleDDSServer-Parameters'
}

{ #category : #'as yet unclassified' }
DDSSParameterPath class >> fromRos: aCallerId [
	| tokens |
	tokens := '/' split: aCallerId.
	^ self new
		steps: tokens;
		parameterName: '';
		yourself
]

{ #category : #'as yet unclassified' }
DDSSParameterPath class >> fromRos: aCallerId and: aParameterName [
	| tokens |
	tokens := '/' split: aCallerId , '/' , aParameterName.
	^ self new
		steps: tokens allButLast;
		parameterName: tokens last;
		yourself
]

{ #category : #'as yet unclassified' }
DDSSParameterPath >> createParameterOn: aNamespace [
	| parameter |
	parameter := DDSSParameterHolder domain: aNamespace domain name: parameterName. 
	(self fetchNamespaceFrom: aNamespace) addParameter: parameter.
	
	^ parameter 
]

{ #category : #'as yet unclassified' }
DDSSParameterPath >> fetchFrom: aNamespace ifAbsent: aBlock [
	| namespace |
	namespace := self fetchNamespaceFrom: aNamespace.
	^ parameterName ifEmpty: [ namespace ] ifNotEmpty: [ namespace detectParameter: parameterName ifNone: aBlock ]
]

{ #category : #'as yet unclassified' }
DDSSParameterPath >> fetchNamespaceFrom: aNamespace [
	^ steps inject: aNamespace into: [ :ns :step | step ifEmpty: [ ns compact. aNamespace ] ifNotEmpty: [ ns innerNamespace: step ] ]
]

{ #category : #'as yet unclassified' }
DDSSParameterPath >> parameterName: aParameterName [
	parameterName := aParameterName
]

{ #category : #'as yet unclassified' }
DDSSParameterPath >> steps: anOrderedCollectionOfNamespaceNames [
	steps := anOrderedCollectionOfNamespaceNames.
]
