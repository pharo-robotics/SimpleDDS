unimplemented
getSystemState: aCallerId
	^ {((domain topics
		collect: [ :t | 
			{(t name).
			((t subscribed collect: #name) asArray)} ]) asArray).
	((domain topics
		collect: [ :t | 
			{(t name).
			((t publishers collect: #name) asArray)} ]) asArray).
	{}}