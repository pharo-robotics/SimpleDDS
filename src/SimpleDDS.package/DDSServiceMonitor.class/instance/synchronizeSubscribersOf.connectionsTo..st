synchronization
synchronizeSubscribersOf: aTopic connectionsTo: aSetOfPublishers
	| join |
	aTopic subscriber subscriptions
		do:
			[ :subscription | join := aSetOfPublishers differenceTableWith: (subscription connections select: #isRemote thenCollect: #relatedParticipantName).
			join associations
				do:
					[ :association | association value
						ifTrue:
							[ self
								traceCr:
									(''
										join:
											{'WARN: The publisher '.
											association key.
											' is not actually connected with '.
											subscription participant name.
											' trying to connect'}).
							[ self ensureConnectionsOf: subscription participant at: aTopic subscriber to: (domain mirror remoteUriFor: association key).
							self traceCr: 'INFO: publisher connection successfully restored' ]
								on: Error
								do: [ :err | self
										traceCr:
											(''
												join:
													{'ERROR: error during publisher reconnection '.
													err messageText}) ] ]
						ifFalse:
							[ self
								traceCr:
									(''
										join:
											{' WARN: The publisher '.
											association key.
											' for: '.
											subscription participant name.
											' is not registered in master. '}) ] ]
			" if the value is true means that is in the master but not in local. 
					  if it is false means that is locally defined but not known by the master  " ]