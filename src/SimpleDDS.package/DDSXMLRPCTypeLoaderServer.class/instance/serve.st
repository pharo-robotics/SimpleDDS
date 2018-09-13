exposition
serve
	serving
		ifFalse: [ 
			XMLRPCService
				atPort: port
				serve:
					{(#paramUpdate -> {(self -> #from:update:with:)}).
					(#publisherUpdate -> {(self -> #informFrom:for:publishers:)})} asXMLRPCHttpModule
				at: '/'.
			serving := true ]