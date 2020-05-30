"
A parameter is a value holder for adding meta data to a domain. This meta data can be consutled by any one that uses the proper api. 


"
Class {
	#name : #DDSSParameterHolder,
	#superclass : #MDDSEntity,
	#instVars : [
		'value',
		'namespace'
	],
	#category : 'SimpleDDSServer-Parameters'
}

{ #category : #'as yet unclassified' }
DDSSParameterHolder >> delete [
	namespace delete: self.
]

{ #category : #'as yet unclassified' }
DDSSParameterHolder >> namespace: aNamespace [
	namespace := aNamespace
]

{ #category : #'as yet unclassified' }
DDSSParameterHolder >> updated [
	domain note: (DDSParameterAnnouncement hasChanged: self).

]

{ #category : #'as yet unclassified' }
DDSSParameterHolder >> value [
	^ value
]

{ #category : #'as yet unclassified' }
DDSSParameterHolder >> value: aValue [
	value := aValue.
	self updated.
]
