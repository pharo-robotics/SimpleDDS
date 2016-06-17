service
findServiceByName: aServiceName
	^ self findServiceByName: aServiceName ifNone: [ MDDSError signal: 'There is not service called ' , aServiceName ]