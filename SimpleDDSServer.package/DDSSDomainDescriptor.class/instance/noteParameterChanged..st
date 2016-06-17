accessing
noteParameterChanged: aParameterChangedAnnouncement
	participants select: [ : p | p isSubscribedTo: aParameterChangedAnnouncement parameter ] thenDo: [: p | p noteParameterChanged: aParameterChangedAnnouncement ]