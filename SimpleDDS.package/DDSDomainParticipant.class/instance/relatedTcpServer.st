accessing
relatedTcpServer
	^ servers detect: [ :s | s isTCP ]