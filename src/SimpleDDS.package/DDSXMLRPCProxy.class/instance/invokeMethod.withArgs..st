invoking
invokeMethod: method withArgs: args
	| returnArray |
	returnArray := super invokeMethod: method withArgs: args.
	^ (DDSXmlRpcResponse elements: returnArray) value