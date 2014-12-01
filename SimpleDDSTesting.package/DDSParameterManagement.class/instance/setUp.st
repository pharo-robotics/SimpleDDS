as yet unclassified
setUp
	super setUp.
	domain := DDSExternallyDefinedDomain onSimpleDDS: 'http://127.0.0.1:11311/'.
	mirror := domain mirror.
	participant := MDDSDomainParticipant domain: domain name: 'adhoc-participant' ip: '127.0.0.1'.
	participant2 := MDDSDomainParticipant domain: domain name: 'other-participant' ip: '127.0.0.1'