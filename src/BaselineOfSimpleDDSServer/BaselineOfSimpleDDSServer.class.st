Class {
	#name : #BaselineOfSimpleDDSServer,
	#superclass : #BaselineOf,
	#category : 'BaselineOfSimpleDDSServer'
}

{ #category : #'development support' }
BaselineOfSimpleDDSServer class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
BaselineOfSimpleDDSServer class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
BaselineOfSimpleDDSServer class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
BaselineOfSimpleDDSServer class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
BaselineOfSimpleDDSServer class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
BaselineOfSimpleDDSServer class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
BaselineOfSimpleDDSServer class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
BaselineOfSimpleDDSServer class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
BaselineOfSimpleDDSServer class >> project [

	^self new project
]

{ #category : #'development support' }
BaselineOfSimpleDDSServer class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
BaselineOfSimpleDDSServer >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec baseline: 'SimpleDDS' with: [ spec repository: 'github://sbragagnolo/SimpleDDS/src' ].
			spec
				package: #SimpleDDSServer with: [ spec requires: #(#SimpleDDS) ];
				package: #SimpleDDSServerTesting with: [ spec requires: #(#SimpleDDSServer) ].
			spec
				group: 'core' with: #(#SimpleDDSServer);
				group: 'default' with: #(#core #SimpleDDSServerTesting) ]

]
