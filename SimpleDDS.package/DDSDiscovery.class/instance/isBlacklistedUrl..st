testing
isBlacklistedUrl: anUrl
	^ (blackList at: anUrl ifAbsentPut: 0) > self tries.