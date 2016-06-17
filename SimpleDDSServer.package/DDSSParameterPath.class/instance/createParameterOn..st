as yet unclassified
createParameterOn: aNamespace
	| parameter |
	parameter := DDSSParameterHolder domain: aNamespace domain name: parameterName. 
	(self fetchNamespaceFrom: aNamespace) addParameter: parameter.
	
	^ parameter 