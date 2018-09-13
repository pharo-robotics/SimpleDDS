as yet unclassified
setUp
	super setUp.
	service := domain findOrRegisterServiceByName: '/service' type: #'service_type/Adhoc'.
	participant := self participant.
	service serve: [ :rq :rp | rp data: rq data ] for: participant