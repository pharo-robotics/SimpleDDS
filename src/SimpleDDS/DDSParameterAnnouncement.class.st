"
A DDSParameterAnnouncement Announcement related with parameter management
"
Class {
	#name : #DDSParameterAnnouncement,
	#superclass : #MDDSAnnouncement,
	#instVars : [
		'parameter'
	],
	#category : 'SimpleDDS-Parameter'
}

{ #category : #constructor }
DDSParameterAnnouncement class >> hasBeenSetted: aDDSBindedParameter [ 
	^ DDSParameterHasBeenSetted parameter: aDDSBindedParameter 
]

{ #category : #constructor }
DDSParameterAnnouncement class >> hasChanged: aDDSBindedParameter [ 
	^ DDSParameterHasChanged parameter: aDDSBindedParameter 
]

{ #category : #constructr }
DDSParameterAnnouncement class >> parameter: aDDSBindedParameter [
	^ self new
		parameter: aDDSBindedParameter;
		yourself
]

{ #category : #accessing }
DDSParameterAnnouncement >> parameter [
	^ parameter
]

{ #category : #accessing }
DDSParameterAnnouncement >> parameter: aParameter [
	parameter := aParameter
]
