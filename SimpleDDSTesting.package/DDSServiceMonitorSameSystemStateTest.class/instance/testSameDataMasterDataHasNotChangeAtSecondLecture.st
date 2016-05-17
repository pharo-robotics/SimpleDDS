as yet unclassified
testSameDataMasterDataHasNotChangeAtSecondLecture
	monitor analyzeCurrentState.
	self assert: monitor masterMetaDataHasChanged.
	monitor analyzeCurrentState.
	self deny: monitor masterMetaDataHasChanged