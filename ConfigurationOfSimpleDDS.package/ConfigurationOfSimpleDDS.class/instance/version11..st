versions
version11: spec
	<version: '1.1' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.1'.
		spec author: 'SantiagoBragagnolo'.
		spec timestamp: '2/9/2015 11:33'.
		spec 
			project: 'Ston' with: '0.10';
			project: 'MetaDDS' with: '1.0';
			project: 'BabyMock2' with: '2.0';
			project: 'SimpleDDSServer' with: '0.1-baseline'.
		spec 
			package: #SimpleDDS with: 'SimpleDDS-SantiagoBragagnolo.19';
			package: #SimpleDDSTesting with: 'SimpleDDSTesting-SantiagoBragagnolo.10';
			package: #SimpleDDSWithServerExtention with: 'SimpleDDSWithServerExtention-SantiagoBragagnolo.1'. ].
