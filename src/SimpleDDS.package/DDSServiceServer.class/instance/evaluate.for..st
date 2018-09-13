as yet unclassified
evaluate: aRequest for: aParticipant
	| response |
	response := service type responseMarshaller newInstance.
	valuable value: aRequest value: response.
	^ response