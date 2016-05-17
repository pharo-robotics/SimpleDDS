as yet unclassified
testEmptyStateMasterDataHasNotChange
	monitor analyzeCurrentState.
	self deny: monitor masterMetaDataHasChanged 