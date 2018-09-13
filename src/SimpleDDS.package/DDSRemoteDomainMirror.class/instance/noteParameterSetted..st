parameters
noteParameterSetted: aParameterAnnouncement
	(parameters includes: aParameterAnnouncement parameter)
		ifTrue: [ proxy noteParameterSetted: aParameterAnnouncement ]