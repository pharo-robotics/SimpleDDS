initialization
initialize
	super initialize.
	self when: DDSParameterHasChanged send: #noteParameterChanged: to: self