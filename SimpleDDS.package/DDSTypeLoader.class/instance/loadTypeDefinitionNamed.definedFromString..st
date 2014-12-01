as yet unclassified
loadTypeDefinitionNamed: aName definedFromString: aStringDefinition
	| definition |
	definition := STON reader
		on: aStringDefinition readStream;
		next.
	^ definition