entry point
whenReconnectionOrRoutine: aBlock
	| asRoutine |
	anyRecoveryMethodHasbeenExecuted := false.
	asRoutine := false.
	(self masterHasBeenReconnected
		or: [ 
			self masterMetaDataHasChanged
				or: [ 
					asRoutine := self shouldScanDeepAsRoutine.
					asRoutine ] ])
		ifTrue: [ 
			aBlock value.
			asRoutine
				ifTrue: [ 
					anyRecoveryMethodHasbeenExecuted
						ifTrue: [ self shiftDownCurrentThreadshold ]
						ifFalse: [ self shiftUpCurrentThreadshold ] ] ]