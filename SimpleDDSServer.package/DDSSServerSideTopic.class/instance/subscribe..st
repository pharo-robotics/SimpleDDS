as yet unclassified
subscribe: aParticipant
	subscribed
		like: aParticipant
		ifAbsent: [ 
			subscribed add: aParticipant.
			domain note: (MDDSTopicAnnouncement participant: aParticipant isNowSubscribedTo: self with: self) ]