as yet unclassified
setUp

	super setUp.
	header := tcpProtocol header newInstance.
	serializer := tcpProtocol header.
	header message_definition: 'string data', String lf, String lf;	
		callerId: '/rostopic_4767_1316912741557';
		latching: '1';
		md5sum: '992ce8a1687cec8c8bd883ec73ca41d1'; 
		topic: '/chatter';
		type: 'std_msgs/String'.
		
	