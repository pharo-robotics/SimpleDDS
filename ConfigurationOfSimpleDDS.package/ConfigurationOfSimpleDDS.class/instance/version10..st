versions
version10: spec
	<version: '1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'SantiagoBragagnolo'.
		spec timestamp: '12/1/2014 17:02'.
		spec 
			project: 'Ston' with: '0.9';
			project: 'MetaDDS' with: '1.0'.
		spec 
			package: #SimpleDDS with: 'SimpleDDS-SantiagoBragagnolo.13';
			package: #SimpleDDSTesting with: 'SimpleDDSTesting-SantiagoBragagnolo.7'. ].
