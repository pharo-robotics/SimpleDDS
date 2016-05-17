as yet unclassified
testLookupServiceGivesAService
	service := domain findOrRegisterServiceByName: '/service'.
	self assert: (service isKindOf: DDSService).