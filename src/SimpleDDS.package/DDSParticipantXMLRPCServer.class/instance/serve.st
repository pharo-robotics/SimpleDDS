exposition
serve
	XMLRPCService
		atPort: port
		serve:
			{(#getBusInfo -> {(self -> #getBusInfo:)}).
			(#getPid -> {(self -> #pid:)}).
			(#requestTopic -> {(self -> #requestTopic:for:availableFor:)}).
			(#getPublications -> {(self -> #getPublications:)}).
			(#paramUpdate -> {(self -> #from:update:with:)}).
			(#publisherUpdate -> {(self -> #informFrom:for:publishers:)})} asXMLRPCHttpModule
		at: '/'.
	serving := true