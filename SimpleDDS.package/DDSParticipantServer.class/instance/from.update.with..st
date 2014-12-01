ros-xml-reponses
from: aCallerID update: aParameterName with: aValue
	| domain parameter parameterName |
	domain := participantMirror participant domain.
	parameterName := aParameterName last = $/
		ifTrue: [ aParameterName copyFrom: 1 to: aParameterName size - 1 ]
		ifFalse: [ aParameterName ].
	parameter := domain
		parameterNamed: aParameterName
		for: participantMirror participant
		ifNone: [ self error: 'The parameter updated is not being watched ' , aParameterName ].
	parameter basicSet: aValue.
	domain note: (DDSParameterAnnouncement hasChanged: parameter)