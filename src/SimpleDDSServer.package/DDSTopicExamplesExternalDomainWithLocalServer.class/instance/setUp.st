private
setUp
	server := DDSDomainDescriptorXMLRPCServer serve: DDSSDomainDescriptor new.
	server domain: DDSSDomainDescriptor new.
	server serveAt: 11311