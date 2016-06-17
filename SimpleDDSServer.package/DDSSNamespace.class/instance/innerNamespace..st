accessing
innerNamespace: aName
	^ namespaces at: aName ifAbsentPut: [  self class domain: domain name: aName parent: self ].
	
