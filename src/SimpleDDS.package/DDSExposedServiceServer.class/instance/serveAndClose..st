as yet unclassified
serveAndClose: aConnection
	| request |
	request := aConnection read.
	aConnection write: (self evaluate: request for: participant).
	aConnection close