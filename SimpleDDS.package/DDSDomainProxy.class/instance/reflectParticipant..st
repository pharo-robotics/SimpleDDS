accessing
reflectParticipant: aMDDSParticipant
	| mirror |
	mirror := aMDDSParticipant asMirror.
	self serveParticipant: mirror.
	^ mirror