as yet unclassified
testDiscoveryBlackListedAfterLimit
	1 to: discovery tries + 1 do: [ :idx | 
		discovery
			manage: urlSet
			for: subscriber
			with: participantMirror
			in: domain.
		self assert: (discovery blackList at: urlSet anyOne) = idx ].
	
	self assert: (discovery isBlacklistedUrl: urlSet anyOne)