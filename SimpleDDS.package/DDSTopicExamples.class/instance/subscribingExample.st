example pieces
subscribingExample
	
" You may want to run this example from #runExample
 "
" Subscriber side "

" Create the domain reification "
| domain participant topic subcription subscription |
domain := self createExampleDomain.

" Add the protocol support "
domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder  decoding: MDDSDecoder).

" Create a participant for the publisher"
participant := MDDSDomainParticipant domain: domain name: 'subscriber-participant' ip: '127.0.0.1'.


" Meanwhile for the publisher to have a type is meaningful, the subscriber can avoid the specification. And there are a part of type discovery in the protocol that allows to get the definition on the fly "

topic := domain findOrRegisterTopicByName: 'termometer'.



subscription := topic subscriber forParticipant: participant onRead: [ : termometerMeasure | 
	Transcript show:termometerMeasure; cr.
	termometerMeasure position x = 50 ifTrue: [ 
		Transcript show: ' Unsubscribing '; cr.
		topic subscriber unsubscribe: participant. 	
		domain destroy.
		10 timesRepeat: [Smalltalk garbageCollect ].
	]	
   ].

" We will use transcript for showing the reading "
Transcript open. 