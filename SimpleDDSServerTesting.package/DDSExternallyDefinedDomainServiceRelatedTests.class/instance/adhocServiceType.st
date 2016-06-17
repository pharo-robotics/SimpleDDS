as yet unclassified
adhocServiceType
	" The name is just to show that we can use the same name specification as in ROS but in Pharo. For Pharo it self it does not make much sense, since there is not a concept of installed packages or related namespace "

	^ DDSServiceTypeDefinition
		named: 'service_type/Adhoc'
		request: {(MDDSFieldDefinition name: #data type: (MDDSBasicTypeDefinition for: MDDSInt16Type new))}
		response: {(MDDSFieldDefinition name: #data type: (MDDSBasicTypeDefinition for: MDDSInt16Type new))}