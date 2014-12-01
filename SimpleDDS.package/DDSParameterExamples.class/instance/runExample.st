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
	participant1Process := [ self exampleParameter ] shootIt.
	1 second wait.
	participant2Process := [ self exampleParameter ] shootIt.
	join := [ 
	participant1Process wait.
	participant2Process wait.
	self tearDown ] shootIt