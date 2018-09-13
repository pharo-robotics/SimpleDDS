initialization
initialize
	super initialize.
	backendConnected := false.
	timesChecked := 1.
	hasBeenReconnected := false.
	masterMetaDataHasChanged := false.
	threadshold := (self class routinePassageMaxThreadshold + self class routinePassageMinThreadshold) // 2.
	anyRecoveryMethodHasbeenExecuted := true.
	rate := 10 hz