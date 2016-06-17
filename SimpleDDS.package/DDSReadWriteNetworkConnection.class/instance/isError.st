testing
isError
	" Mind that is error does not consumes data "

	^ (stream peek: 4) = #[0 0 0 0]