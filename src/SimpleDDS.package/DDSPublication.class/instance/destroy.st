accessing
destroy
	| rt |
	rt := self stopPublishing.
	super destroy.
	^ rt