constructor
url: urlString
	|url|
	url := ZnUrl fromString: urlString.
	^self new
		url: url;
		yourself