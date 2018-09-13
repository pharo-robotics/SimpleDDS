as yet unclassified
initialize
	super initialize.
	topics := Set new.
	participants := Set new.
	announcer := Announcer new.
	
	self when: MDDSIsPublishingAnnouncement send: #notePublication: to: self. 
	self when: MDDSIsNotPublishingAnnouncement send: #notePublicationFinished: to: self. 
	self when: MDDSIsSubscribedAnnouncement send: #noteSubscription: to: self. 
	self when: MDDSIsNotSubscribedAnnouncement send: #noteSubscriptionFinished: to: self. 
