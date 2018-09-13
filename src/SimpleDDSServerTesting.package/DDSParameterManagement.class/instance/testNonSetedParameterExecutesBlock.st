as yet unclassified
testNonSetedParameterExecutesBlock
	| blockExecuted |
	blockExecuted := false.
	self getParameterNamed: '/non_setted_parameter' or: [ blockExecuted := true ].
	self assert: blockExecuted