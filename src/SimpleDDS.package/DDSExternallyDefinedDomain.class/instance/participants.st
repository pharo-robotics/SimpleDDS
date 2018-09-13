accessing
participants
	| freshParticipants toRemove |
	freshParticipants := super participants.
	toRemove := Set new.
	" Does a first pass through the cached participants to check removed and updated participants "
	participants
		do:
			[ :participant | freshParticipants
				detect: [ :fresh | fresh name = participant name ]
				ifFound: [ :relative | participant proxy url = relative proxy url
						ifFalse: [ participant proxy setUrl: relative proxy url ] ]
				ifNone: [ toRemove add: participant ] ].
	" Remove the removed participants "
	participants removeAll: toRemove.

	"Add all the participants in freshParticipants that have not relative "
	participants
		addAll:
			(freshParticipants reject: [ :fresh | participants detect: [ :p | p name = fresh name ] ifFound: [ true ] ifNone: [ false ] ]).
	^ participants