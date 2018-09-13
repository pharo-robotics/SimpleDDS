as yet unclassified
testSameDataMasterDataHasChange
	monitor analyzeCurrentState.
	self assert: monitor masterMetaDataHasChanged 