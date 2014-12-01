as yet unclassified
encodeTypeDefinition: aTypeDefinition
	^ String
		streamContents: [ :stream | 
			STON writer
				on: stream;
				nextPut: aTypeDefinition ]