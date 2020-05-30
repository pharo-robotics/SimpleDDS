"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSimpleDDSTesting,
	#superclass : #PackageManifest,
	#category : 'SimpleDDSTesting'
}

{ #category : #'code-critics' }
ManifestSimpleDDSTesting class >> ruleMissingSubclassResponsibilityRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#DDSTestTypeLoader #uri #false)) #'2015-09-09T13:56:32.075406+02:00') )
]
