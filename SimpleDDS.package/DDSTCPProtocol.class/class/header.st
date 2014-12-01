as yet unclassified
header
	^ header ifNil: [
		 header := self headerDefinition typeBuilder buildTypeMarshaller.
	]