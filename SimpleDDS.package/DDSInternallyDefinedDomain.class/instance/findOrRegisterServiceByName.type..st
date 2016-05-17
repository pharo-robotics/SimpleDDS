as yet unclassified
findOrRegisterServiceByName: aServiceName type: aTypeName
	| found typeDesc |
	typeDesc := DDSServiceTypeDescriptor domain: self name: aTypeName.
	found := self
		findServiceByName: aServiceName
		ifNone:
			[ 
			(DDSServiceDescriptor domain: self name: aServiceName type: typeDesc)
				createService ].
	((typeDesc describes: found type) not
		and: [ found type isTypePlaceHolder ])
		ifTrue: [ found type: typeDesc createType ].
	^ found