"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSimpleDDSWithServerExtention,
	#superclass : #PackageManifest,
	#category : 'SimpleDDSWithServerExtention'
}

{ #category : #'code-critics' }
ManifestSimpleDDSWithServerExtention class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#DDSTopicExamplesExternalDomainWithLocalServer)) #'2015-09-09T13:56:32.130498+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDSWithServerExtention class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSSettingUpDomainExamples #exampleCreateAndServeDomainDescriptorAndCreateLocalDomain #false)) #'2015-09-09T10:18:31.515347+02:00') #(#(#RGMethodDefinition #(#DDSSettingUpDomainExamples #exampleCreateAndServeDomainDescriptor #false)) #'2015-09-09T10:18:31.5153+02:00') #(#(#RGMethodDefinition #(#DDSSettingUpDomainExamples #exampleCreateAndServeDomainDescriptor #false)) #'2015-09-09T12:34:29.841402+02:00') #(#(#RGMethodDefinition #(#DDSSettingUpDomainExamples #exampleCreateAndServeDomainDescriptor #false)) #'2015-09-09T12:41:39.957967+02:00') #(#(#RGMethodDefinition #(#DDSSettingUpDomainExamples #exampleCreateAndServeDomainDescriptor #false)) #'2015-09-09T13:56:32.100614+02:00') )
]
