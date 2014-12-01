as yet unclassified
informFrom: aCallerID for: aTopic publishers: aSetOfPublishers
	proxy informFrom: aCallerID for: aTopic name publishers: (aSetOfPublishers collect: #uri) asArray.
	