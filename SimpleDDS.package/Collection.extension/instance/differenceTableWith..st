*SimpleDDS
differenceTableWith: anOtherCollection
	" It returns a dictionary of item -> { true | false }. True means it belongs to self, false it does not "

	| table |
	table := Dictionary new.
	self do: [ :item | table at: item put: true ].
	anOtherCollection
		do: [ :item | table at: item ifPresent: [ :tuple | table removeKey: item ] ifAbsent: [ table at: item put: false ] ].
	^ table