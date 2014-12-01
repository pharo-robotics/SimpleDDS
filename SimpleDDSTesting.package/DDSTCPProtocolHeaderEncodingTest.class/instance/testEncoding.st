testing
testEncoding
	
	self assert: (tcpProtocol headerProtocol dump: header with: tcpProtocol header )= (self  expectedByteArray first: 180) 
	"In our approach we dont use the body space of the message in order to use the specific tcp/messages in just one way"