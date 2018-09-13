as yet unclassified
stopPublishing: aParticipant
	publishers remove: aParticipant ifAbsent: [ ^ self ].
	domain note: (MDDSTopicAnnouncement participant: aParticipant isNotPublishingAnymoreOn: self through: self).