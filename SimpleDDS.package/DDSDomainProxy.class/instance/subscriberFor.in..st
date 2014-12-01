abstract
subscriberFor: aTopic in: aDomain
	^ MDDSSubscriber domain: aDomain named: aTopic name , '-subscriber' on: aTopic