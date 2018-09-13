implemented
lookupNode: aCallerId named: aName
	^ (domain participants detect: [ :p | p name = aName ]) url