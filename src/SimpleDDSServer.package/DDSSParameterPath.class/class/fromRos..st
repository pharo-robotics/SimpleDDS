as yet unclassified
fromRos: aCallerId
	| tokens |
	tokens := '/' split: aCallerId.
	^ self new
		steps: tokens;
		parameterName: '';
		yourself