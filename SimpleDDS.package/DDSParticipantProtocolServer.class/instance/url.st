accessing
url
	^ ('http://' , (NetNameResolver stringFromAddress: ip) , ':' , port asString) asZnUrl