as yet unclassified
destroy
	monitor destroy.
	createdServices
		valuesDo: #destroy;
		removeAll.
	super destroy