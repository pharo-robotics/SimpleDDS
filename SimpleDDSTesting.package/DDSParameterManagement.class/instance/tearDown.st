as yet unclassified
tearDown
	super tearDown.
	[ 
	2
		timesRepeat: [ 
			XMLRPCService stopAll.
			TKTRunner allSubInstances do: #cancel.
			MDDSPublication allInstances do: #stopPublishing.
			DDSPublicationServer allInstances do: #stop.
			DDSParticipantServer allInstances do: #unserve.
			MDDSReadingNetworkConnection allInstances do: #destroy.
			Socket allInstances do: #destroy.
			MDDSEntity allSubInstances do: [ :e | e domain: nil ] ] ]
		on: Error
		do: [  ].
	2 timesRepeat: [ Smalltalk garbageCollect ]