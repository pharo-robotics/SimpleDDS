constructor
name: aName participant: aParticipant initialized: anInitialValue
	^ self new
		name: aName;
		participant: aParticipant;
		basicSet: anInitialValue;
		yourself