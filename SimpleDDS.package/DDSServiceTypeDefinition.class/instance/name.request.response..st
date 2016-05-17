as yet unclassified
name: aName request: aRequestDefinition response: aResponseDefinition
	name := aName.
	request := MDDSTypeDefinition named: aName , 'Request' defined: aRequestDefinition.
	response := MDDSTypeDefinition named: aName , 'Response' defined: aResponseDefinition