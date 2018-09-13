as yet unclassified
testBrokenMasterDataHasNotChange
	monitor analyzeCurrentState.
	self deny: monitor masterMetaDataHasChanged 