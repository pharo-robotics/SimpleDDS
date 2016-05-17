query
analyzeCurrentState
	| state isCurrentlyConnected |
	isCurrentlyConnected := true.
	hasBeenReconnected := false.
	masterMetaDataHasChanged := false.
	[ 
	state := domain mirror systemState.
	isCurrentlyConnected := state isEmptyOrNil not.
	masterMetaDataHasChanged := state ~= lastReadedState
		and: [ state isEmptyOrNil not ] ]
		on: Error
		do: [ isCurrentlyConnected := false ].
	hasBeenReconnected := backendConnected not and: isCurrentlyConnected.
	lastReadedState := state.
	backendConnected := isCurrentlyConnected.
	^ hasBeenReconnected