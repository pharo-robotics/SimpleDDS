construction
domain: aDomain name: aServiceTypeName responseMarshaller: aResponseMarshaller requestMarshaller: aRequestMarshaller md5sum: aStringMd5Code
	^ self new
		domain: aDomain;
		name: aServiceTypeName;
		responseMarshaller: aResponseMarshaller;
		requestMarshaller: aRequestMarshaller;
		md5sum: aStringMd5Code;
		yourself