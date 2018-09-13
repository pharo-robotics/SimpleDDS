as yet unclassified
publishing: aParticipant
	publishers
		like: aParticipant
		ifAbsent: [ 
			publishers add: aParticipant.
			domain note: (MDDSTopicAnnouncement participant: aParticipant isNowPublishingOn: self through: self) ]