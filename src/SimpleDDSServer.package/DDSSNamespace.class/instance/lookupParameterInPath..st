query
lookupParameterInPath: aParameterPath 
	^ self lookupParameterInPath: aParameterPath ifNone: [ self error: 'There is not parameter setted in the given path' ]
	