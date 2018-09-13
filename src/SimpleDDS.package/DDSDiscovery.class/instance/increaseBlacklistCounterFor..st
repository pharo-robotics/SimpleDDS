manage list
increaseBlacklistCounterFor: anUrl 
	blackList at: anUrl put: (blackList at: anUrl ifAbsentPut: 0) + 1