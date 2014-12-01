as yet unclassified
fetchFrom: aNamespace ifAbsent: aBlock
	| namespace |
	namespace := self fetchNamespaceFrom: aNamespace.
	^ parameterName ifEmpty: [ namespace ] ifNotEmpty: [ namespace detectParameter: parameterName ifNone: aBlock ]