as yet unclassified
getTopicTypes: aCallerId
	^ (domain topics
		collect: [ :t | 
			{(t name).
			(t type name)} ]) asArray