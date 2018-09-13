example
runExample
	" 
	DDSParameterExamplesExternalDomainWithLocalServer  new runExample .
	DDSParameterExamplesStrictExternalDomain new runExample .
	"

	| participant1Process participant2Process join |
	Transcript open.
	self setUp.
	self halt.
	participant1Process := [ self exampleParameter ] future .
	1 second wait.
	participant2Process := [ self exampleParameter ] future.
	join := [ 
	participant1Process wait.
	participant2Process wait.
	self tearDown ] run