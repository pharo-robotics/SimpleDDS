baselines
baseline03: spec
	<version: '0.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/sbragagnolo/SimpleDDS/main/'.
		spec 
			project: 'Ston' with: [
				spec
					className: #ConfigurationOfSton;
					versionString: #'stable';
					repository: 'http://ss3.gemstone.com/ss/STON' ];
			project: 'MetaDDS' with: [
				spec
					className: #ConfigurationOfMetaDDS;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/sbragagnolo/MetaDDS/main/' ];
			project: 'BabyMock2' with: [
				spec
					className: #ConfigurationOfBabyMock2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
			project: 'SimpleDDSServer' with: [
				spec
					className: #ConfigurationOfSimpleDDSServer;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/sbragagnolo/SimpleDDSServer/main/' ].
		spec 
			package: #SimpleDDS with: [
				spec requires: #('MetaDDS' 'Ston' ). ];
			package: #SimpleDDSTesting with: [
				spec requires: #(#SimpleDDS 'BabyMock2' ). ];
			package: #SimpleDDSWithServerExtention with: [
				spec requires: #('SimpleDDSServer' ). ].
		spec 
			group: 'default' with: #(#SimpleDDS #SimpleDDSTesting );
			group: 'core' with: #(#SimpleDDS );
			group: 'server-extention' with: #(#SimpleDDSWithServerExtention). ].
