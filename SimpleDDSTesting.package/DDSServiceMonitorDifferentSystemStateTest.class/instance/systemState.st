as yet unclassified
systemState
	generator ifNil: [ generator := Generator on: [ :g | 1 to: 1000 do: [ :i | g yield: (self generatedState: i) ] ] ].
	^ [ generator next ]