"
For starting up this examples you should have one remote domain descriptor. SimpleDDS is ROS master compatible then the options you have are: 
	
	- Start a ros master (roscore command)  and modify the example according your configuration (ip:port) 
	- Open a new image and execute a Domain descriptor example from the DDSSettingUpDomainExamples
	- Use the subclass example for using the hybrid domain definition 
"
Class {
	#name : #DDSParameterExamplesStrictExternalDomain,
	#superclass : #DDSParameterExamples,
	#category : 'SimpleDDS-Examples'
}

{ #category : #private }
DDSParameterExamplesStrictExternalDomain >> createExampleDomain [
	| domain |
	domain := DDSExternallyDefinedDomain onSimpleDDS: 'http://127.0.0.1:11311'.	" Add the protocol support "
	domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder decoding: MDDSDecoder).
	^ domain
]

{ #category : #running }
DDSParameterExamplesStrictExternalDomain >> tearDown [
	DDSExternallyDefinedDomain allInstancesDo: #destroy
]
