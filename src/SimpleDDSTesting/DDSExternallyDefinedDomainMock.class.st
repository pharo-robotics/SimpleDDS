"
This external domain acts as an object mock that returns that what is expected/ configured by each test's setup
"
Class {
	#name : #DDSExternallyDefinedDomainMock,
	#superclass : #Object,
	#instVars : [
		'mirror',
		'systemState',
		'disconnectedMirror'
	],
	#category : 'SimpleDDSTesting-ServiceMonitor'
}

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomainMock >> disconnectedMirror [

	disconnectedMirror := true.
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomainMock >> initialize [
	super initialize.
	disconnectedMirror := false
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomainMock >> mirror [
	^ mirror.
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomainMock >> selfMirror [
	mirror := self
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomainMock >> systemState [
	disconnectedMirror ifTrue: [ ConnectionTimedOut new signal ].
	^ systemState value
]

{ #category : #'as yet unclassified' }
DDSExternallyDefinedDomainMock >> systemState: aSystemState [
	systemState := aSystemState
]
