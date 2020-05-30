"
In the publisher/subscriber world, there is a concept called Domain. The Domain concept is the realm where everything is happening, as the court yard is to a football match, the domain is to the publishers and subscribers.
    The domain is based in a master/slave IDEA, where there is a place for registering and quering information about the Domain it self. 

     With this restrictions and knowledge, there are many conceptualizations of Domain:

            - A domain description for tracking down all the domain facts
            - A domain reification for the participants for being able to relate with the domain descriptor as the object way.
		- A domain facade for exposing the mechanisms as a service.
		- A server for serving the facade to the different participants
		- A proxy for accessing the domain as a service.
		
	

      This many aspects are many kinds of domains or services of domain. 

        MDDSProtoDomain  				
				"" Proto domain defines some common behavior and defines the meta concept""

			MDDSDomain 				
				"" Domain represents the object that the participant deal with. (So, it exist in the participant image)""
				MDDSInternallyDefinedDomain  
				 "" This domain reification have not contact with any other domain, is fully defined in the image. Is for experiments and testing mainly and for ilustrate the concept ""
				MDDSExternallyDefinedDomain  
				"" This domain reification defines a similar behavior as the internal one, but delegating in a domain mirror. Its main reason of
					 existance is to transform mirrored objects into local objects""
					DDSExternallyDefinedDomain 
				"" This domain is the same as the MDDS version, but it also supports parameters and type registering""

			MDDSAbstractDomainMirror 		
				"" This domain mirror defines the basic expected API for a domain mirror ""
				MDDSRemoteDomainMirror       
				"" This Domain mirror defines a mirror accesable through a proxy object. It uses a domain proxy for accessing services, but it acts as a mirror""
					DDSRemoteDomainMirror 
				"" This domain mirror is the same as the MDDS version, but it also supports parameters and type registering""
				
			MDDSAbstractDomainDescriptor    
				"" This domain descriptor defines the basic expected API for a domain descriptor ""
				DDSDomainDescriptor          
				"" This domain descriptor defines the way to create a participant and manages some extra events. Is a usable class of Domain descriptor""
				


	All these listed classes of the MDDSProtoDomain hierarchy are only for domain reification. No class of this hierarchy has anything to do with the connections to outsideimage.  For that the construction may variate in each case. 
	
==	Local defined Domain
	
	If the domain is entirely local, the definition cannot go out of the image. In this case then publishers and subscribers will be local to image, and since the domain is not being served it information will not be reachable for any kind of network discovery. 
	
	This case was developed as a concept and for testing improvements. It makes not much sense to have all this architecture for local messages.

	Since there is not much to configure in this kind of domain, the way to create a new one is: 
	
	
	localDomain := MDDSInternallyDefinedDomain new.
	
== External & mirror domain 		
	
	If the domain is described in a remote entity, accesible through network then we have several objects to instanciate, and two flavors
	
	MDDS Flavor
	
		This flavor is based strictly in making available the publisher subscriber  feature, nothing else.  The type registration is local, each participant should know the type definition.
		
		
	realProxy := DDSXMLRPCDomainProxy url: 'http://ip:port'.
	proxy := DDSDomainProxy onProxy: realProxy.
	mirror := MDDSRemoteDomainMirror on: proxy.
	externallyDefinedDomain := MDDSExternallyDefinedDomain on: mirror.
	
	
	In this case, the realProxy is an instance that connects directly with the remote domain. Is a reification of the remote service. In this case the proxy is based on XMLRPC technology, but it can be what ever it is needed. It just need to respect the interface, and it must be synchronous.
	
	The DDSDomainProxy is a generic proxy that transforms the real proxy answers, that are usually basic values into objects.  The Type loader / registry is configured in this objects. By default is used an instance of MDDSTypeLoader lazily created. This class relies on a dictionary for registring and loading type definitions.
	
	
	The MDDSRemoteDomainMirror take meaningful objects that it got from DDSDomainProxy and tie them to the domain mechanisms, relating them and caching them if needed. 
	
	Finally the externally defined domain, by default it delegates all to the mirror. 
	
	In any case, MDDSRemoteDomainMirror do not expose any other thing of the real domain but topics and subscription and publishing of topics.
	
	
	
	DDS Flavor
	
		This flavor is directly based on MDDS, but it ads support for bindable parameters in the remote domain, and throught that, remote type registration.
	
	        There are two ways to create this kind of domain, one is similar to the MetaDDS one
	
	realProxy := DDSXMLRPCDomainProxy url: 'http://ip:port'.
	proxy := DDSDomainProxy onProxy: realProxy.
	mirror := DDSRemoteDomainMirror on: proxy.
	externallyDefinedDomain := DDSExternallyDefinedDomain on: mirror.
		
	
             The other one is easier, taking in care several defaults


	externallyDefinedDomain  := DDSExternallyDefinedDomain onSimpleDDS: 'http://ip:port'.

== Domain descriptor

	Finally the domain descriptor is what can be used as backend of the externally defined domain. 
	Since this object is in charge for tracking events and not much more else, the creation is quite simple
	
	domainDescriptor := DDSDomainDescriptor new.
	
	After this, the only thing left is to expose this domain	served some how. For doing this we have a class and it super BasicBehaviorClassMetaclassTest 
	
	DDSDomainDescriptorServer 
	"" This class has to have the same or a superset of the public API used by the proxies detailed before. In any case, this is an abstract server, it should be subclassed and define the #serveAt: aPort  method ""
		DDSDomainDescriptorXMLRPCServer
	 "" This class implements the #serveAt: aPort method, by creating a XMLRPC service and delegating the expected service names to the correspondant methods defined in the super class  ""


	Finally then, for creating a domain descriptor server and serve the domain descriptor we have created, we just need to 
	
	server := DDSDomainDescriptorServer xmlrpcServerOn: domainDescriptor.
	server serveAt: 11311.
	
	
	As expected, in order to reset the domain, for our clients, we can set a new empty descriptor
	
	server domain: DDSDomainDescriptor new.

	
== Mixing things up

	Finally, if you had read carefully, you should get the fact that the  real proxy in between client and remote domain public API is a subset of the  domain descriptor server public API. And actually the responses are exactly the same. 
	
	Then if we want to serve a domain descriptor and define one of the several domain clients in the same image, without needing to go out-inside the network, and need to deal with frustrating io locks, we must create our domain like following
	
	server := DDSDomainDescriptorServer xmlrpcServerOn: DDSDomainDescriptor new.
	server domain: DDSDomainDescriptor new.
	server serveAt: 11311. 

	domain := DDSExternallyDefinedDomain onLocalSimpleDDS: server.
	
	
	Or, for having a better idea of what is happening in the construction time
	
	proxy := DDSDomainProxy onProxy: server.
	mirror := DDSRemoteDomainMirror on: proxy.
	externallyDefinedDomain := DDSExternallyDefinedDomain on: mirror.
	
	
	
	Finally, in for all the domains it is needed to define the supported protocols. Since protocols are something that has nothing to do with the over all structure, and since each participan may have different needs, protocols are defined as pluggable.
	
	No one of the domains have any default protocol, because each distribution has its own definitions. 
	
	
	For SimpleDDS, after defining the wanted domain
	
	domain addProtocol: (DDSTCPProtocol encoding: MDDSEncoder  decoding: MDDSDecoder)
	
	
	
	
	
	
	

	
	
	






"
Class {
	#name : #DDSSettingUpDomainExamples,
	#superclass : #Object,
	#category : 'SimpleDDS-Examples'
}

{ #category : #'as yet unclassified' }
DDSSettingUpDomainExamples >> exampleCreateExternallyDefinedDomainDDSFlavor [
" self new exampleCreateExternallyDefinedDomainDDSFlavor "
	| externallyDefinedDomain |
	" For using the domain object you may want to ensure in the endpoint, by executing the server example or starting a ros master"
	externallyDefinedDomain := DDSExternallyDefinedDomain onSimpleDDS: 'http://127.0.0.1:11311/'.
	externallyDefinedDomain explore.
	self halt: 'Proceed to destroy domain.'.
	externallyDefinedDomain  destroy.
]

{ #category : #'as yet unclassified' }
DDSSettingUpDomainExamples >> exampleCreateExternallyDefinedDomainMDDSFlavor [
	" self new exampleCreateExternallyDefinedDomainMDDSFlavor "
	| realProxy proxy mirror externallyDefinedDomain |
	" For using the domain object you may want to ensure in the endpoint, by executing the server example or starting a ros master"
	realProxy := DDSXMLRPCDomainProxy url: 'http://127.0.0.1:11311/'.
	proxy := DDSDomainProxy onProxy: realProxy.
	mirror := MDDSRemoteDomainMirror on: proxy.
	externallyDefinedDomain := MDDSExternallyDefinedDomain on: mirror.
	externallyDefinedDomain explore.
	self halt: 'Proceed to destroy domain.'.
	externallyDefinedDomain  destroy.
]

{ #category : #'as yet unclassified' }
DDSSettingUpDomainExamples >> exampleCreateInternallyDefinedDomain [
" self new exampleCreateInternallyDefinedDomain "
	| localDomain |
	localDomain := MDDSInternallyDefinedDomain new.
	localDomain explore.
	self halt: 'Proceed to destroy domain.'.
	localDomain  destroy.
]
