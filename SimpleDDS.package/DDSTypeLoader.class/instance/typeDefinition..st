as yet unclassified
typeDefinition: aTypeId
	^ self typeDefinition: aTypeId ifAbsent: [ self error: ' There is no type named ' , aTypeId]