as yet unclassified
fetchNamespaceFrom: aNamespace
	^ steps inject: aNamespace into: [ :ns :step | step ifEmpty: [ ns compact. aNamespace ] ifNotEmpty: [ ns innerNamespace: step ] ]