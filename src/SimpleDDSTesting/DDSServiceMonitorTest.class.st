Class {
	#name : #DDSServiceMonitorTest,
	#superclass : #TestCase,
	#instVars : [
		'monitor'
	],
	#category : 'SimpleDDSTesting-ServiceMonitor'
}

{ #category : #'as yet unclassified' }
DDSServiceMonitorTest >> buildDomainForTest [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorTest >> setUp [
	monitor := DDSServiceMonitor new
		domain: self buildDomainForTest;
		yourself.
	
]

{ #category : #'as yet unclassified' }
DDSServiceMonitorTest >> tearDown [
	monitor destroy.
	monitor := nil.
	super tearDown
]
