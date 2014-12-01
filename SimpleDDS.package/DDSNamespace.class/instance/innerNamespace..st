accessing
innerNamespace: aName
	^ namespaces at: aName ifAbsentPut: [  DDSNamespace domain: domain name: aName parent: self ].
	
