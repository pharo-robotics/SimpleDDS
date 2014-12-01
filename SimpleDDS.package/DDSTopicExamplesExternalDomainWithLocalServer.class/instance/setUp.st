private
setUp
	server := DDSDomainDescriptorServer xmlrpcServerOn: DDSDomainDescriptor new.
	server domain: DDSDomainDescriptor new.
	server serveAt: 11311