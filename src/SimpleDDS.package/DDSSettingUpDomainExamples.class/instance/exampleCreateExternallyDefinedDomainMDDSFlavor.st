as yet unclassified
exampleCreateExternallyDefinedDomainMDDSFlavor
	" self new exampleCreateExternallyDefinedDomainMDDSFlavor "
	| realProxy proxy mirror externallyDefinedDomain |
	" For using the domain object you may want to ensure in the endpoint, by executing the server example or starting a ros master"
	realProxy := DDSXMLRPCDomainProxy url: 'http://127.0.0.1:11311/'.
	proxy := DDSDomainProxy onProxy: realProxy.
	mirror := MDDSRemoteDomainMirror on: proxy.
	externallyDefinedDomain := MDDSExternallyDefinedDomain on: mirror.
	externallyDefinedDomain explore.
	self halt: 'Proceed to destroy domain.'.
	externallyDefinedDomain  destroy.