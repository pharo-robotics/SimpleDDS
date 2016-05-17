as yet unclassified
name
	^( super name beginsWith:'/' ) ifTrue: [ super name ] ifFalse: [ '/', super name ].