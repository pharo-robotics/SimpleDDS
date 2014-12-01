as yet unclassified
testDiscoveryBlackListCounterUps
	discovery
		manage: urlSet
		for: subscriber
		with: participantMirror
		in: domain.
	self assert: (discovery blackList at: urlSet anyOne) = 1.
	self deny: (discovery isBlacklistedUrl: urlSet anyOne).