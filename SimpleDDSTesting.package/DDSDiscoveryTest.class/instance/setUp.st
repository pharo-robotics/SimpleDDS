as yet unclassified
setUp
	super setUp.
	discovery := DDSDiscovery new.
	urlSet := { 'http://127.0.0.1:3021' }.
	
	domain := MDDSDomain new.
	
	participantMirror := protocol mock:'participantmirror'.
	participant := protocol mock:'participant'.
	protocol describe allow: participantMirror recv: #participant; => participant.
	protocol describe allow: participantMirror recv: #protocols; => Set new.

	subscriber := protocol mock:'subscriber'.
	subscription := protocol mock:'subscription'.
	topic := protocol mock:'topic'.
	protocol describe allow: subscriber recv:#subscriptionFor:ifNone:; => subscription.	
	protocol describe allow: subscription recv:#connections; => Set new.
	protocol describe allow: subscriber recv:#topic; => topic.		



