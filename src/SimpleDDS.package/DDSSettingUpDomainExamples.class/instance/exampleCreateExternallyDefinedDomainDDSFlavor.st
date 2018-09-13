as yet unclassified
exampleCreateExternallyDefinedDomainDDSFlavor
" self new exampleCreateExternallyDefinedDomainDDSFlavor "
	| externallyDefinedDomain |
	" For using the domain object you may want to ensure in the endpoint, by executing the server example or starting a ros master"
	externallyDefinedDomain := DDSExternallyDefinedDomain onSimpleDDS: 'http://127.0.0.1:11311/'.
	externallyDefinedDomain explore.
	self halt: 'Proceed to destroy domain.'.
	externallyDefinedDomain  destroy.