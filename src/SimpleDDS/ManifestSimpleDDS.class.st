"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSimpleDDS,
	#superclass : #PackageManifest,
	#category : 'SimpleDDS'
}

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleAbstractClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSSettingUpDomainExamples #exampleCreateExternallyDefinedDomainMDDSFlavor #false)) #'2015-09-09T12:34:29.825459+02:00') #(#(#RGMethodDefinition #(#DDSTypeLoader #encodeTypeDefinition: #false)) #'2015-09-09T12:34:29.825492+02:00') #(#(#RGMethodDefinition #(#DDSParticipantServer #getPid: #false)) #'2015-09-09T12:34:29.82533+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSParticipantProtocolServer #handleError: #false)) #'2015-09-09T14:18:15.509733+02:00') #(#(#RGMethodDefinition #(#MDDSCollectionType #stonOn: #false)) #'2015-09-09T14:18:15.509598+02:00') #(#(#RGMethodDefinition #(#DDSParameterExamples #runExample #false)) #'2015-09-09T14:18:15.509684+02:00') #(#(#RGMethodDefinition #(#DDSTopicExamples #runExample #false)) #'2015-09-09T14:18:15.50975+02:00') #(#(#RGMethodDefinition #(#DDSParticipantProtocolServer #start #false)) #'2015-09-09T14:18:15.509717+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleCascadedNextPutAllsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSParameterExamples #exampleParameter #false)) #'2015-09-09T14:18:15.497328+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#DDSTypeExamples)) #'2015-09-09T13:56:32.123851+02:00') #(#(#RGClassDefinition #(#DDSParameterExamplesStrictExternalDomain)) #'2015-09-09T13:56:32.12328+02:00') #(#(#RGClassDefinition #(#DDSParameterExamplesExternalDomainWithLocalServer)) #'2015-09-09T13:56:32.122806+02:00') #(#(#RGClassDefinition #(#DDSTopicExamplesStrictExternalDomain)) #'2015-09-09T13:56:32.123112+02:00') #(#(#RGClassDefinition #(#DDSSettingUpDomainExamples)) #'2015-09-09T13:56:32.124348+02:00') #(#(#RGClassDefinition #(#DDSTopicExamplesInternalDomain)) #'2015-09-09T13:56:32.123433+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSSettingUpDomainExamples #exampleCreateInternallyDefinedDomain #false)) #'2015-09-09T10:18:31.507472+02:00') #(#(#RGMethodDefinition #(#DDSSettingUpDomainExamples #exampleCreateExternallyDefinedDomainMDDSFlavor #false)) #'2015-09-09T10:18:31.507482+02:00') #(#(#RGMethodDefinition #(#DDSSettingUpDomainExamples #exampleCreateExternallyDefinedDomainDDSFlavor #false)) #'2015-09-09T10:18:31.507335+02:00') #(#(#RGMethodDefinition #(#DDSTopicExamples #runExample #false)) #'2015-09-09T10:18:31.507495+02:00') #(#(#RGMethodDefinition #(#DDSTopicExamples #subscribingExample #false)) #'2015-09-09T10:18:31.5074+02:00') #(#(#RGMethodDefinition #(#DDSParameterExamples #runExample #false)) #'2015-09-09T10:18:31.507454+02:00') #(#(#RGMethodDefinition #(#DDSTCPProtocol #acceptConnectionFrom:with: #false)) #'2016-05-31T11:34:13.732516+02:00') #(#(#RGMethodDefinition #(#DDSParticipantProtocolServer #start #false)) #'2016-05-31T11:34:13.732535+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleCodeCruftLeftInMethodsRuleV1TODO [
	^ #(#(#(#RGMethodDefinition #(#DDSParticipantProtocolServer #start #false)) #'2016-05-31T11:43:25.281592+02:00') #(#(#RGMethodDefinition #(#DDSTCPProtocol #acceptConnectionFrom:with: #false)) #'2016-05-31T11:43:25.28167+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleExcessiveVariablesRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#DDSServiceMonitor)) #'2016-05-31T11:09:42.518364+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleImplementedNotSentRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSTypeExamples #exampleRegisterAndRetrieveTypeDefinition #false)) #'2015-09-09T13:56:32.112316+02:00') #(#(#RGMethodDefinition #(#DDSTypeExamples #exampleExploreAllTypeDefinitions #false)) #'2015-09-09T13:56:32.112335+02:00') #(#(#RGMethodDefinition #(#DDSTopicExamples #tearDown: #false)) #'2015-09-09T13:56:32.112296+02:00') #(#(#RGMethodDefinition #(#DDSTypeExamples #exampleCreateTypeWithGivenTypeDefinition #false)) #'2015-09-09T13:56:32.112327+02:00') #(#(#RGMethodDefinition #(#DDSTypeExamples #exampleExploreATypeDefinition #false)) #'2015-09-09T13:56:32.112345+02:00') #(#(#RGMethodDefinition #(#DDSTypeExamples #exampleCreateTypeWithRegisteredTypeDefinitionFromTypeDescription #false)) #'2015-09-09T13:56:32.11225+02:00') #(#(#RGMethodDefinition #(#DDSParticipantProxy #busInfo #false)) #'2015-09-09T14:18:15.527003+02:00') #(#(#RGMethodDefinition #(#DDSExternallyDefinedDomain #parameterNamed:for: #false)) #'2015-09-09T14:18:15.528527+02:00') #(#(#RGMethodDefinition #(#DDSParticipantProxy #shutdown: #false)) #'2015-09-09T14:18:15.528671+02:00') #(#(#RGMethodDefinition #(#DDSParticipantServer #getSubscriptions: #false)) #'2015-09-09T14:18:15.52877+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleMissingSubclassResponsibilityRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSXMLRPCTypeLoaderServer #uri #false)) #'2015-09-09T13:56:32.08462+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleOnlyReadOrWrittenTemporaryRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSParameterExamples #runExample #false)) #'2015-09-09T12:34:29.848539+02:00') #(#(#RGMethodDefinition #(#DDSTopicExamples #subscribingExample #false)) #'2015-09-09T12:34:29.848568+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleRBClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#DDSParameterExamplesExternalDomainWithLocalServer)) #'2016-05-31T10:40:56.085943+02:00') #(#(#RGClassDefinition #(#DDSParameterExamplesStrictExternalDomain)) #'2016-05-31T10:40:58.757452+02:00') #(#(#RGClassDefinition #(#DDSSettingUpDomainExamples)) #'2016-05-31T10:41:00.884054+02:00') #(#(#RGClassDefinition #(#DDSTopicExamplesInternalDomain)) #'2016-05-31T10:41:06.348087+02:00') #(#(#RGClassDefinition #(#DDSTopicExamplesStrictExternalDomain)) #'2016-05-31T10:41:10.524884+02:00') #(#(#RGClassDefinition #(#DDSTypeExamples)) #'2016-05-31T10:41:13.127118+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleRBExcessiveVariablesRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#DDSServiceMonitor)) #'2016-05-31T10:40:43.519397+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleRBInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSExternallyDefinedDomain #participants #false)) #'2016-05-31T11:09:11.916986+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleRBMissingSubclassResponsibilityRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#DDSTypeLoader)) #'2016-05-31T10:40:30.144993+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSTopicExamples #publishingExample #false)) #'2015-09-09T12:34:29.854639+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleSentNotImplementedRuleV1TODO [
	^ #(#(#(#RGMethodDefinition #(#DDSInternallyDefinedDomain #createAndRegisterServiceNamed: #false)) #'2015-09-09T12:34:29.866646+02:00') )
]

{ #category : #'code-critics' }
ManifestSimpleDDS class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSDomainProxy #createOrObtainTypeContainer:for: #false)) #'2015-09-09T12:41:39.940567+02:00') #(#(#RGMethodDefinition #(#DDSDomainProxy #topics #false)) #'2015-09-09T12:41:39.940635+02:00') #(#(#RGMethodDefinition #(#DDSServiceMonitor #analyzeCurrentState #false)) #'2015-09-09T12:41:39.940412+02:00') )
]
