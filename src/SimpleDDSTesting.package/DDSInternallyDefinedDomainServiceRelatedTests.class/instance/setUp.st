as yet unclassified
setUp
	super setUp.
	domain := self createDomain.
	loader := DDSTestTypeLoader new.
	loader installRegistry.
	domain installTypeLoader: loader.
	domain registerTypeDefinition: self adhocServiceType