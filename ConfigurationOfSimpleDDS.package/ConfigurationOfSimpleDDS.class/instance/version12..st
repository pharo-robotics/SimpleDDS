versions
version12: spec
	<version: '1.2' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.2'.
		spec author: 'SantiagoBragagnolo'.
		spec timestamp: '4/30/2015 14:27'.
		spec 
			project: 'Ston' with: '0.10';
			project: 'MetaDDS' with: '1.2';
			project: 'BabyMock2' with: '2.0';
			project: 'SimpleDDSServer' with: '0.1-baseline'.
		spec 
			package: #SimpleDDS with: 'SimpleDDS-SantiagoBragagnolo.27';
			package: #SimpleDDSTesting with: 'SimpleDDSTesting-SantiagoBragagnolo.10';
			package: #SimpleDDSWithServerExtention with: 'SimpleDDSWithServerExtention-SantiagoBragagnolo.1'. ].
