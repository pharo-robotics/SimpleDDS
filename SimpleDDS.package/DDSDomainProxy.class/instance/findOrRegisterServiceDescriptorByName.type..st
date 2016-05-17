query
findOrRegisterServiceDescriptorByName: aServiceName type: aTypeName
	^ self registeredServices
		detect: [ :s | s name = aServiceName ]
		ifNone:
			[ 
			self
				registerService:
					(DDSServiceDescriptor
						name: aServiceName
						type: (DDSServiceTypeDescriptor named: aTypeName)) ]