versions
version14: spec
	<version: '1.4' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.4'.
		spec author: 'SantiagoBragagnolo'.
		spec timestamp: '8/3/2015 12:21'.
		spec 
			project: 'Ston' with: '0.14';
			project: 'MetaDDS' with: '0.2-baseline';
			project: 'BabyMock2' with: '2.0';
			project: 'SimpleDDSServer' with: '0.1-baseline'.
		spec 
			package: #SimpleDDS with: 'SimpleDDS-SantiagoBragagnolo.35';
			package: #SimpleDDSTesting with: 'SimpleDDSTesting-SantiagoBragagnolo.13';
			package: #SimpleDDSWithServerExtention with: 'SimpleDDSWithServerExtention-SantiagoBragagnolo.1'. ].
