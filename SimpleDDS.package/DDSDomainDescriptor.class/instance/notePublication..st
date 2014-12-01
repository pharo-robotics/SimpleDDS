as yet unclassified
notePublication: aMDDSIsPublishingAnnouncement
	aMDDSIsPublishingAnnouncement topic subscribed
		do: [ :participantDescriptor | 
			participantDescriptor participant
				informFrom: '/master'
				for: aMDDSIsPublishingAnnouncement topic
				publishers: aMDDSIsPublishingAnnouncement topic publishers ]