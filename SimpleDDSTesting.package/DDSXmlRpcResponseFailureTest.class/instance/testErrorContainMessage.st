as yet unclassified
testErrorContainMessage
	| message |
	[ response value ]
		on: Error
		do: [ :err | message := err messageText ].
	self assert: message equals: response statusMessage.
	self assert: message equals: self messageValue