as yet unclassified
createParameterOn: aNamespace
	| parameter |
	parameter := DDSParameterHolder domain: aNamespace domain name: parameterName. 
	(self fetchNamespaceFrom: aNamespace) addParameter: parameter.
	
	^ parameter 