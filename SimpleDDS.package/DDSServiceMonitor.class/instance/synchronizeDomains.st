synchronization
synchronizeDomains
	"
[publishers, subscribers, services]
publishers is of the form
[ [topic1, [topic1Publisher1...topic1PublisherN]] ... ]
subscribers is of the form
[ [topic1, [topic1Subscriber1...topic1SubscriberN]] ... ]
services is of the form
[ [service1, [service1Provider1...service1ProviderN]] ... ]
"

	lastReadedState
		ifNotNil:
			[ self synchronizeLocalPublishersWith: (lastReadedState at: 1).
			self synchronizeLocalSubscribersWith: (lastReadedState at: 2).
			self synchronizeLocalServiceServersWith: (lastReadedState at: 3) ]