as yet unclassified
testNilStateMasterDataHasNotChange
	monitor analyzeCurrentState.
	self deny: monitor masterMetaDataHasChanged 