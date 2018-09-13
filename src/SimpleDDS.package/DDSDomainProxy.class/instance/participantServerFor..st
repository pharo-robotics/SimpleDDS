abstract
participantServerFor: aParticipantMirror
	^ participantServers detect: [ :e | e itServes: aParticipantMirror ]