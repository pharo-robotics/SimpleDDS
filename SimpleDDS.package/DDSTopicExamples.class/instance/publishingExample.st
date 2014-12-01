example pieces
publishingExample
" 
DDSTopicExamplesExternalDomainWithLocalServer new publishingExample

You may want to run this example from #runExample "
" Publisher side "
" Create the domain reification "
| domain participant topic publishing |
domain := self createExampleDomain.

" Create a participant for the publisher"
participant := MDDSDomainParticipant domain: domain name: 'publisher-participant' ip: '127.0.0.1'.

" Register the type definition needed for the comunication "
domain registerTypeDefinition: self termometerTypeDefinition.
			
topic := domain findOrRegisterTopicByName: 'termometer' type: 'TermometerMeasure'.

publishing := topic publisher publishing: participant.


1 to: 100 do: [: idx | publishing publish: [ : termometerMeasure |  
		termometerMeasure measure: idx * 1.3.
		termometerMeasure position x: idx; y: idx; z: idx.
	] .
	500 milliSeconds asDuration wait.	
].

topic publisher stopPublishing: publishing.

domain destroy.
10 timesRepeat: [Smalltalk garbageCollect ].





