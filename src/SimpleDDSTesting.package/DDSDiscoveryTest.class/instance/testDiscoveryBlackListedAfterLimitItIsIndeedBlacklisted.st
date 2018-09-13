as yet unclassified
testDiscoveryBlackListedAfterLimitItIsIndeedBlacklisted
	"After being blacklisted, an url is not tried to be connected, then the blacklist counter is not updated anymore "
	self testDiscoveryBlackListedAfterLimit.
	1 to: discovery tries + 1 do: [ :idx | 
		discovery
			manage: urlSet
			for: subscriber
			with: participantMirror
			in: domain.
		self assert: (discovery blackList at: urlSet anyOne) = (discovery tries + 1) ]