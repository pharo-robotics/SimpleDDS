"
Types are the shape of the topics connections.
Each publisher and subscriber in our domain will comunicate using a specific type for transference. 

This types may be defined dynamically and/or discovered by the different participants as far as they need them. 

Then the lifecycle of the types is:

1 -  A need of the domain where the DDS is used needs to transmit a certain kind of information
2 - The participant that will publish this information defines the shape of this type by composing already defined types
3 - The participant registries the defined type under a name in the domain.
4 - Other participants may fetch the type from the handshake tier of the connection or query it by its name.
5 - The publisher user will fill up a DTO object defined as the type definition demands
6 - The publisher will push this DTO into the topic, where it will be marshalled with a marshaller constructed as the type definition demands
7 - The subscriber process will receive the marshaled data and unmarshall it into a DTO with a marshaller constructed as the type definition demands
8 - The subscriber will execute a defined callback with  a DTO object defined as the type definition demands, equivalent to the sent one. 

	In what comes to this set of examples we are concerned about how to build a type definition, and from there, how to have a type, with it marshaller and DTO.

1 -  Recognice a need
	Lets picture we need to send the temperature of a big room. This room has several termometers in different positions of this room. 
	Then each measure of temperature should be related with a three dimensions position.
	We should then define several types:
	RoomTemperature = { TermometerMeasure1 .TermometerMeasure2 ... TermometerMeasureN }.
	TermometerMeasure = { #measure -> Float . #position -> Position3D }.
	Position3D = { #x ->  Float . #y -> Float . #z -> Float }.
	As usual, the complex types are defined in terms of other types.
	
2-	Define the type 
	MetaDDS allows us to define types as following:
	
	All together
	
	typeDefinition :=
	MDDSTypeDefinition named: 'RoomTermometer' defined: { 
		MDDSFieldDefinition name: #stamp type: (MDDSBasicTypeDefinition for: MDDSTimeType new) .
		MDDSFieldDefinition name: #measures type: (
			MDDSCollectionTypeDefinition for: MDDSArrayType new storing: 
			(MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
				MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				MDDSFieldDefinition name: #position type: (MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				})
			}))
	}.
	
	Also, for easing the lecture 
	
	position3D := 
			MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
			}.	
	termometerMeasure := 
			MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
					MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #position type: position3D
			}.
	typeDefinition :=
			MDDSTypeDefinition named: 'RoomTermometer' defined: { 
					MDDSFieldDefinition name: #stamp type: (MDDSBasicTypeDefinition for: MDDSTimeType new) .
					MDDSFieldDefinition name: #measures type: (
					MDDSCollectionTypeDefinition for: MDDSArrayType new storing: termometerMeasure)
			}
	
	
	
	As you can read in the code, each type definition is defined by field definitions. Each field definition is composed by a name and a type definition.
	Besides the MDDSTypeDefinition class, used for define custom type definitions, we have also two others:
	MDDSBasicTypeDefinition, used for basic types.
	MDDSCollectionTypeDefinition, used for collections of types.
	
3 - Registering a type definition

   Since all what is to share is meta information, and since part of the type mechanism involves to generate needed classes, what we register in the domain is not the type it self, but the type definition. Then each system is able to read the definition and load it as it please.

   For registering this information we just need to do
    domain := MDDSInternallyDefinedDomain new. "" For different domains and how to build them, address the domain examples "" 
    domain registerTypeDefinition: typeDefinition.

    After this line, you may be able to execute without any kind of fear to have an error the following line

    domain typeDefinition: 'RoomTemperature'.

       If you still fearful you may want to execute 

    domain typeDefinition: 'Position3D' ifAbsent: [  "" Do something "" ].

     

4- Create type 
	There are two ways to create a type for a user. One is doing it by hand, and the other one with a type descriptor.
	a- By hand
	For creating a type we need basiclly three things: 
		- A domain where the type will live
		- A type definition
		- A type name
	
	domain := MDDSInternallyDefinedDomain new. "" For different domains and how to build them, address the domain examples "" 
	type := domain createTypeNamed: 'RoomTemperature' definedBy: typeDefinition.
	
	
	Once we create the type like this, there will be available a class called as each type created (Position3D, TermometerMeasure and RoomTemperature) and there will be a graph of objects for marshalling each of them. 
	Meanwhile the class is generated in case of need (If you have defined already the Position3D class by example, it will not replace it nor modificate it), the marshaller is created each time the domain es recreated.
	
	The way to force the creation of the related classes and to obtain a marshaller is
	
	marshaller := typeDefinition typeBuilder buildTypeMarshaller.

      b- By type descriptor 
  
	domain registerTypeDefinition: typeDefinition.
	
	typeDescriptor := MDDSTypeDescriptor domain: domain name: 'TermometerMeasure'.
      type := typeDescriptor createType.

       This version will try to fetch the type definition from the domain. If is not registered, it will fail. 
	
      After the types are collected by the garbage collector, the only things that remains is the generated DTO class.









"
Class {
	#name : #DDSTypeExamples,
	#superclass : #Object,
	#category : 'SimpleDDS-Examples'
}

{ #category : #'as yet unclassified' }
DDSTypeExamples >> exampleCreateTypeWithGivenTypeDefinition [
" self new exampleCreateTypeWithGivenTypeDefinition "
	| typeDefinition domain type |
	domain := MDDSInternallyDefinedDomain new. " For different domains and how to build them, address the domain examples " 
	typeDefinition := MDDSTypeDefinition named: 'RoomTermometer' defined: { 
		MDDSFieldDefinition name: #stamp type: (MDDSBasicTypeDefinition for: MDDSTimeType new) .
		MDDSFieldDefinition name: #measures type: (
			MDDSCollectionTypeDefinition for: MDDSArrayType new storing: 
			(MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
				MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				MDDSFieldDefinition name: #position type: (MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				})
			}))
	}.

	type := domain createTypeNamed: 'RoomTemperature' definedBy: typeDefinition.
	type explore.
]

{ #category : #'as yet unclassified' }
DDSTypeExamples >> exampleCreateTypeWithRegisteredTypeDefinitionFromTypeDescription [
	"self new exampleCreateTypeWithRegisteredTypeDefinitionFromTypeDescription"
	| typeDefinition domain typeDescriptor type |
	domain := MDDSInternallyDefinedDomain new. " For different domains and how to build them, address the domain examples " 
	typeDefinition := MDDSTypeDefinition named: 'RoomTermometer' defined: { 
		MDDSFieldDefinition name: #stamp type: (MDDSBasicTypeDefinition for: MDDSTimeType new) .
		MDDSFieldDefinition name: #measures type: (
			MDDSCollectionTypeDefinition for: MDDSArrayType new storing: 
			(MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
				MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				MDDSFieldDefinition name: #position type: (MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				})
			}))
	}.
	domain registerTypeDefinition: typeDefinition.
	
	typeDescriptor := MDDSTypeDescriptor domain: domain name: 'TermometerMeasure'.
	type := typeDescriptor createType.
	type explore
]

{ #category : #'as yet unclassified' }
DDSTypeExamples >> exampleExploreATypeDefinition [
" self new exampleExploreATypeDefinition"
	| typeDefinition |
	typeDefinition := MDDSTypeDefinition named: 'RoomTermometer' defined: { 
		MDDSFieldDefinition name: #stamp type: (MDDSBasicTypeDefinition for: MDDSTimeType new) .
		MDDSFieldDefinition name: #measures type: (
			MDDSCollectionTypeDefinition for: MDDSArrayType new storing: 
			(MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
				MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				MDDSFieldDefinition name: #position type: (MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				})
			}))
	}.
	typeDefinition explore
]

{ #category : #'as yet unclassified' }
DDSTypeExamples >> exampleExploreAllTypeDefinitions [
" self new exampleExploreAllTypeDefinitions "
	| typeDefinition position3D termometerMeasure |
	
	position3D := 
			MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
			}.	
	termometerMeasure := 
			MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
					MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #position type: position3D
			}.
	typeDefinition :=
			MDDSTypeDefinition named: 'RoomTermometer' defined: { 
					MDDSFieldDefinition name: #stamp type: (MDDSBasicTypeDefinition for: MDDSTimeType new) .
					MDDSFieldDefinition name: #measures type: (
					MDDSCollectionTypeDefinition for: MDDSArrayType new storing: termometerMeasure)
			}.
	{typeDefinition . position3D  . termometerMeasure} explore.
]

{ #category : #'as yet unclassified' }
DDSTypeExamples >> exampleRegisterAndRetrieveTypeDefinition [
"self new exampleRegisterAndRetrieveTypeDefinition "
	| typeDefinition domain |
	domain := MDDSInternallyDefinedDomain new. " For different domains and how to build them, address the domain examples " 
	typeDefinition := MDDSTypeDefinition named: 'RoomTermometer' defined: { 
		MDDSFieldDefinition name: #stamp type: (MDDSBasicTypeDefinition for: MDDSTimeType new) .
		MDDSFieldDefinition name: #measures type: (
			MDDSCollectionTypeDefinition for: MDDSArrayType new storing: 
			(MDDSTypeDefinition named: 'TermometerMeasure' defined: { 
				MDDSFieldDefinition name: #measure type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				MDDSFieldDefinition name: #position type: (MDDSTypeDefinition named: 'Position3D' defined: { 
					MDDSFieldDefinition name: #x type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #y type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
					MDDSFieldDefinition name: #z type: (MDDSBasicTypeDefinition for: MDDSFloat32Type new) .
				})
			}))
	}.
	domain registerTypeDefinition: typeDefinition.
	{(domain typeDefinition: 'RoomTermometer') . (domain typeDefinition: 'TermometerMeasure') . (domain typeDefinition: 'Position3D')} explore.
	domain typeDefinition:'NonExistant' ifAbsent: [ self error: 'This error is supposed to happen :) '].
]
