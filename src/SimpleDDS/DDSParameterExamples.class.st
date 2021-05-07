"
Parameters have nothing to do with strict publisher / subcsriber domain. But they are indeed useful. A parameter is an extra support that the domain master can have. 

A parameter then is a name for a value holded by the domain master.  This means that i may need to have a named value, shared with several participants of the domain.

By example, in this implementation, the registration of types, ends up as a parameter, meaning that any participant can have access to it, by name.

This feature is specific of SimpleDDS, for being ROS-compatible. It is not implemented in MetaDDS, meaning that no one of the domains defined in MetaDDS will work with this examples. For this reason, we will have examples just for External domain

domain := DDSExternallyDefinedDomain onSimpleDDS: 'http://127.0.0.1:11311'.
participant := MDDSDomainParticipant domain: domain name: 'publisher-participant' ip: '127.0.0.1'.

parameter := domain createParameterNamed: 'parameter' for: participant.
parameter set: 2.
self assert: parameter get = 2.

The funny thing with this object parameter (From the class DDSBindedParameter) is that each time #set: is sent, the domain object will be noticed, and with that, each parameter holder of each participant that is using this parameter. 


"
Class {
	#name : #DDSParameterExamples,
	#superclass : #Object,
	#category : 'SimpleDDS-Examples'
}

{ #category : #private }
DDSParameterExamples >> createExampleDomain [
	
	self subclassResponsibility 
]

{ #category : #'example pieces' }
DDSParameterExamples >> exampleParameter [
	" You may want to run this example from #runExample "

	| domain participant parameter |
	domain := self createExampleDomain.
	participant := MDDSDomainParticipant domain: domain name: 'participant' , UUID new asString ip: '127.0.0.1'.
	parameter := domain createParameterNamed: 'parameter' for: participant.
	parameter set: 10.
	Transcript show:' Starting loop with ', parameter get asString; cr.
	parameter get
		timesRepeat: [ 
			Transcript show:'Value', participant name, ' ' , parameter get asString  ; cr.
			parameter set: parameter get + 1.
			500 milliSeconds wait.
			
	].

	domain destroy.
]

{ #category : #example }
DDSParameterExamples >> runExample [
	" 
	DDSParameterExamplesExternalDomainWithLocalServer  new runExample .
	DDSParameterExamplesStrictExternalDomain new runExample .
	"

	| participant1Process participant2Process join |
	Transcript open.
	self setUp.
	self halt.
	participant1Process := [ self exampleParameter ] future .
	1 second wait.
	participant2Process := [ self exampleParameter ] future.
	join := [ 
	participant1Process wait.
	participant2Process wait.
	self tearDown ] run
]

{ #category : #running }
DDSParameterExamples >> setUp [
]

{ #category : #running }
DDSParameterExamples >> tearDown [
	
]
