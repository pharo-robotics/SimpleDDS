as yet unclassified
exampleCreateInternallyDefinedDomain
" self new exampleCreateInternallyDefinedDomain "
	| localDomain |
	localDomain := MDDSInternallyDefinedDomain new.
	localDomain explore.
	self halt: 'Proceed to destroy domain.'.
	localDomain  destroy.