as yet unclassified
on: aStringUrl with: aService at: aDomain
	^ self new
		serverUrl: aStringUrl asUrl;
		service: aService;
		domain: aDomain;
		yourself