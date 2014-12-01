example
runExample
	"	Even when you can run the publisher and subscriber example once at the time, you may want to do it at once, and see the results in your transcript "

	" 
	DDSTopicExamplesExternalDomainWithLocalServer  new runExample .
	DDSTopicExamplesStrictExternalDomain new runExample .
	DDSTopicExamplesInternalDomain new runExample .
	"

	| publisherProcess subscriberProcess |
	self setUp.
	subscriberProcess := [ 
	[ self subscribingExample ]
		on: Error
		do: [ :err | self halt ] ] shootIt.
	publisherProcess := [ 
	[ self publishingExample ]
		on: Error
		do: [ :err | self halt ] ] shootIt.
	[ 
	subscriberProcess wait.
	publisherProcess wait.
	self tearDown ] shootIt