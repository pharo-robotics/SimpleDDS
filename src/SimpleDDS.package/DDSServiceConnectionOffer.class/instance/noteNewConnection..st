as yet unclassified
noteNewConnection: aConnection
	aConnection setAsServerSideConnection.
	onNewConnection ifNotNil: [ onNewConnection value: aConnection ].
	^ aConnection