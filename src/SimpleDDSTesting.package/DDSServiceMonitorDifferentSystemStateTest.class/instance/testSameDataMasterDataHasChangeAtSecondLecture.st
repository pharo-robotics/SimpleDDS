as yet unclassified
testSameDataMasterDataHasChangeAtSecondLecture
	monitor analyzeCurrentState.
	self assert: monitor masterMetaDataHasChanged.
	monitor analyzeCurrentState.
	self assert: monitor masterMetaDataHasChanged