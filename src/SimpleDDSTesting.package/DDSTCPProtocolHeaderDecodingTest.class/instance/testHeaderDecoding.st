as yet unclassified
testHeaderDecoding
	| decodedMessage |
	decodedMessage := tcpProtocol headerProtocol load: self messageByteArray with: tcpProtocol header.
	self assert:  header = decodedMessage 