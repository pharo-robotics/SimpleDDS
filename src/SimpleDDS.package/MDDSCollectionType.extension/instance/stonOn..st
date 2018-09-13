*SimpleDDS
stonOn: stonWriter
	| instanceVariableNames |
	(instanceVariableNames := self class allInstVarNames) isEmpty
		ifTrue: [ stonWriter writeObject: self do: [ self encodeMap: #() ] ]
		ifFalse: [ 
			stonWriter
				writeObject: self
				streamMap: [ :dictionary | 
					instanceVariableNames
						reject: [ :each | each = 'relatedClass' ]
						thenDo: [ :each | 
							(self instVarNamed: each)
								ifNotNil: [ :value | dictionary at: each asSymbol put: value ]
								ifNil: [ 
									self stonShouldWriteNilInstVars
										ifTrue: [ dictionary at: each asSymbol put: nil ] ] ] ] ]