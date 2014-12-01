as yet unclassified
assertEncodedEqualsExpectedInFirst: netSize ofLastElements: rawSize
	|encoded expected anEncoder stream|
	
	stream := WriteStream on: (ByteArray new).
	anEncoder  := MDDSHeaderEncoder on: stream.

	
	encoded := ((serializer serialize: header into: anEncoder) last: rawSize) first: netSize.
	expected := (self expectedByteArray last:  rawSize) first: netSize.
	self assert: encoded = expected