versions
version13: spec
	<version: '1.3' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.3'.
		spec author: 'SantiagoBragagnolo'.
		spec timestamp: '7/2/2015 17:06'.
		spec 
			project: 'Ston' with: '0.10';
			project: 'MetaDDS' with: '0.1-baseline';
			project: 'BabyMock2' with: '2.0';
			project: 'SimpleDDSServer' with: '0.1-baseline'.
		spec 
			package: #SimpleDDS with: 'SimpleDDS-SantiagoBragagnolo.30';
			package: #SimpleDDSTesting with: 'SimpleDDSTesting-SantiagoBragagnolo.12';
			package: #SimpleDDSWithServerExtention with: 'SimpleDDSWithServerExtention-SantiagoBragagnolo.1'. ].
