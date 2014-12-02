#Topics

The  topics are probably the most important thing in a publisher / subscriber domain. 

For a software as participant of a DDS network, the key objects are the topic with its type, and the related participant. 

A topic is a concept that represents what we can call topic in a chat room. All people interested in something be name, for talking or listenin about, should register them selves and start to share. 

We can say then that topics are like named channels. You can ask for them and use them

In any case, for using this channels you need to choose a role you will play, this channels are note interactive, you listen OR you talk. For doing both, you should regiter as both roles, using different mechanisms. 

Here is where the words participant publisher and subscriber appear. 

> * A participant can register it self into a topic for publishing
> * A participant can register it self into a topic for subscribing

### Lifecycle

> 1. The participant **P1** have the need of publishing some information under the name of **Topic1** typed as **Type1** inside the given domain: **domain1**. 

> 2. **P1** register him self into the domain as a publisher of the topic **Topic1** with type **Type1**. (In this moment if the topic does not exist it will be created)

> 3. **P1** start its own processing tasks informing to the topic what ever news it has. 

> 4. The participant **P2** needs, for processing its own tasks, the information that it will be or is being published in the topic **Topic1** typed as **Type1** inside the given domain:**domain1**.

> 5. **P2** register him self into the domain as a subscriber of the topic **Topic1** with type **Type1**. (In this moment if the topic does not exist it will be created). 

> 6. **P2** register a callback to be executed each time that any participant shares anything into the topic.


> 7. **P1** ends it processing time, it unregister it self from the domain and close topic connections
> 8. **P2** closes all the connections of the topic related with **P1**.
> 9. **P2** ends it processing time, it unregister it self from the domain and close all topic connections
 

Following is described how to do it: 

It doesn't matter the way of client domain you had choose (external, internal or mixed) - *for more info about domains check the domain part* -, all of them are polimorphic in the scope of topic access. 



### Complete example

For our examples we have several subclasses with different domains. 

>" Publisher side "
" Create the domain reification "
domain := DDSExternallyDefinedDomain onSimpleDDS: 'http://127.0.0.1:11311'.

>" Add the protocol support "
domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder  decoding: MDDSDecoder).

>" Create a participant for the publisher"
participant := MDDSDomainParticipant domain: domain name: 'publisher-participant' ip: '127.0.0.1'.


>" Register the type definition needed for the comunication "
domain registerTypeDefinition: (MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
				MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				MDDSFieldDefinition name: #position type: (MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				})
			}).
			
>topic := domain findOrRegisterTopicByName: 'termometer' type: 'TermometerMeasure'.

>publishing := topic publisher publishing: participant.


>1 to: 100 do: [: idx | publishing publish: [ : termometerMeasure |  
		termometerMeasure measure: idx * 1.3.
		termometerMeasure position x: idx; y: idx; z: idx.
		500 milliSeconds asDuration wait.
	]  
].

>topic publisher stopPublishing: publishing.

After, we have the subscriber example: 


>" Subscriber side "

>" Create the domain reification "
domain := DDSExternallyDefinedDomain onSimpleDDS: 'http://127.0.0.1:11311'.

>" Add the protocol support "
domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder  decoding: MDDSDecoder).

>" Create a participant for the publisher"
participant := MDDSDomainParticipant domain: domain name: 'subscriber-participant' ip: '127.0.0.1'.

>" Meanwhile for the publisher to have a type is meaningful, the subscriber can avoid the specification. And there are a part of type discovery in the protocol that allows to get the definition on the fly "

>topic := domain findOrRegisterTopicByName: 'termometer'.

>" We will use transcript for showing the reading "
Transcript open. 

>subscription := topic forParticipant: participant onRead: [ : termometerMeasure | 
	Transcript show:termometerMeasure; cr.
	termometerMeasure position x = 50 ifTrue: [ 
		Transcript show: ' Unsubscribing '; cr.
		topic subscriber unregister: subcription. 	
	]	
   ].

### Syntax in a nutshell

#### Setup
	domain := self createDomain.
	participant := self createParticipant.
	topic := domain findOrRegisterTopicByName: 'topic' type: 'typeName'.
	
#### Publication
	publication := topic publisher publishing: participant.
	publication publish: [ : message | " do something" ].
    topic publisher stopPublishing: publication.

#### Subscription
	subscription := topic forParticipant: participant onRead: [ : message |  " do something " ]
    
    topic subscriber unregister: subcription. 

    
    
    
