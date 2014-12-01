as yet unclassified
manage: anURLSet for: aSubscriber with: aParticipantMirror in: aDomain
	anURLSet
		reject: [ :url | 
			(self isBlacklistedUrl: url)
				or: [ 
					(aSubscriber
						subscriptionFor: aParticipantMirror participant
						ifNone: [ self error: 'There Is not subscription for the related topic' ]) connections
						anySatisfy: [ :con | con urlrpc = url ] ] ]
		thenDo: [ :url | 
			self
				connect: url
				to: aSubscriber
				for: aParticipantMirror
				in: aDomain ]