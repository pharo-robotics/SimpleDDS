"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSimpleDDSServer,
	#superclass : #PackageManifest,
	#category : 'SimpleDDSServer'
}

{ #category : #'code-critics' }
ManifestSimpleDDSServer class >> ruleAbstractClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSSDomainDescriptorServer #getPid: #false)) #'2015-09-09T12:34:29.833062+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDSServer class >> ruleImplementedNotSentRuleV1TODO [
	^ #(#(#(#RGMethodDefinition #(#DDSSDomainDescriptorServer #unsubscribeParam:callingBack:for: #false)) #'2015-09-09T14:18:15.543271+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDSServer class >> ruleSentNotImplementedRuleV1TODO [
	^ #(#(#(#RGMethodDefinition #(#DDSSNamespace #lookupParameterInPath:ifNone: #false)) #'2015-09-09T12:34:29.872284+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDSServer class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSSDomainDescriptorServer #unregisterSubscriber:from:andCallerUri: #false)) #'2015-09-09T12:41:39.949035+02:00') #(#(#RGMethodDefinition #(#DDSDomainDescriptorXMLRPCServer #perform:withArguments: #false)) #'2015-09-09T12:41:39.949009+02:00') #(#(#RGMethodDefinition #(#DDSSDomainDescriptorServer #unregisterPublisher:from:andCallerUri: #false)) #'2015-09-09T12:41:39.949046+02:00') )
]
