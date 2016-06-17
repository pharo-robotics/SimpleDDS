as yet unclassified
fromRos: aCallerId and: aParameterName
	| tokens |
	tokens := '/' split: aCallerId , '/' , aParameterName.
	^ self new
		steps: tokens allButLast;
		parameterName: tokens last;
		yourself