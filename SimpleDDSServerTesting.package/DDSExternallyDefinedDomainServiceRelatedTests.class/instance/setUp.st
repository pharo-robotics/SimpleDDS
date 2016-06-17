as yet unclassified
setUp
	super setUp.
	domain := self createDomain.
	domain registerTypeDefinition: self adhocServiceType