accessing
name
	^( super name beginsWith:'/' ) ifTrue: [ super name ] ifFalse: [ '/', super name ].