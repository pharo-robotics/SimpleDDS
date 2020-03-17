synchronization
synchronizePublisherOf: aTopic connectionsTo: aSetOfSubscribers
	| join |
	aTopic publisher publications
		do: [ :publication | 
			join := aSetOfSubscribers
				differenceTableWith:
					(publication connections
						select: #isRemote
						thenCollect: #relatedParticipantName).
			join associations
				do: [ :association | 
					" if the value is true means that is in the master but not in local. 
					  if it is false means that is locally defined but not known by the master  "
					association value
						ifTrue: [ self
								traceCr:
									(''
										join:
											{'WARN: The subscriber '.
											association key.
											' is not actually connected with '.
											publication participant name}) ]
						ifFalse: [ self
								logCr:
									(''
										join:
											{'WARN: The subscriber '.
											association key.
											' for: '.
											publication participant name.
											' is not registered in master. '}) ] ] ]