as yet unclassified
register: anArrayOfPublishers for: relatedSubscriber
	[ 
	discovery
		manage: anArrayOfPublishers
		for: relatedSubscriber
		with: participantMirror
		in: participantMirror domain ]
		on: Error
		do: [ :err | 
			Transcript
				show: err messageText;
				cr.
			self halt ]