as yet unclassified
testCreateParameterModifyDomain
	| createdParameter gettedParameter |
	createdParameter := self createNewParameterNamed: '/parameter'.
	createdParameter set: 'Value'.
	self removeParameterBindingNamed: createdParameter name.
	gettedParameter := self getParameterNamed: '/parameter'.
	self assert: gettedParameter get = createdParameter get.
	self deny: gettedParameter = createdParameter.