as yet unclassified
testLookupServiceRegistersWithTypeHasMarshallers
	service := domain findOrRegisterServiceByName: '/service' type: #'service_type/Adhoc'.
	self assert: (service type requestMarshaller isKindOf: MDDSCompositeType).
	self assert: (service type responseMarshaller isKindOf: MDDSCompositeType)