serve
serveAt: aPort
	port := aPort.
	XMLRPCService
		atPort: aPort
		serve:
			{(#getPid -> {(self -> #getPid:)}).
			(#deleteParam -> {(self -> #deleteParam:named:)}).
			(#getParam -> {(self -> #getParam:named:)}).
			(#getParamNames -> {(self -> #getParamNames:)}).
			(#getSystemState -> {(self -> #getSystemState:)}).
			(#getTopicTypes -> {(self -> #getTopicTypes:)}).
			(#getUri -> {(self -> #getUri:)}).
			(#hasParam -> {(self -> #hasParam:named:)}).
			(#lookupNode -> {(self -> #lookupNode:named:)}).
			(#lookupService -> {(self -> #lookupService:named:)}).
			(#registerPublisher
				-> {(self -> #registerPublisher:to:with:andCallerUri:)}).
			(#registerService -> {(self -> #registerServiceFor:named:at:for:)}).
			(#unregisterService -> {(self -> #unregisterService:at:for:)}).
			(#registerSubscriber
				-> {(self -> #registerSubscriber:to:with:andCallerUri:)}).
			(#setParam -> {(self -> #setParam:named:with:)}).
			(#subscribeParam
				-> {(self -> #subscribeParam:callingBack:forParameter:)}).
			(#unregisterPublisher
				-> {(self -> #unregisterPublisher:from:andCallerUri:)}).
			(#unregisterSubscriber
				-> {(self -> #unregisterSubscriber:from:andCallerUri:)}).
			(#unsubscribeParam
				-> {(self -> #unsubscribeParam:callingBack:forParameter:)})}
				asXMLRPCHttpModule
		at: '/'