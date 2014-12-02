baselines
baseline02: spec
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/sbragagnolo/SimpleDDS/main/'.
		spec 
			project: 'Ston' with: [
				spec
					className: #ConfigurationOfSton;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'MetaDDS' with: [
				spec
					className: #ConfigurationOfMetaDDS;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/sbragagnolo/MetaDDS/main/' ];
			project: 'BabyMock2' with: [
				spec
					className: #ConfigurationOfBabyMock2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ].
		spec 
			package: #SimpleDDS with: [
				spec requires: #('MetaDDS' 'Ston' ). ];
			package: #SimpleDDSTesting with: [
				spec requires: #(#SimpleDDS 'BabyMock2' ). ].
		spec 
			group: 'default' with: #(#SimpleDDS #SimpleDDSTesting );
			group: 'core' with: #(#SimpleDDS ). ].
