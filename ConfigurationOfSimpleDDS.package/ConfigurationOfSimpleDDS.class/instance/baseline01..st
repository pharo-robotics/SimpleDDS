baselines
baseline01: spec
	<version: '0.1-baseline'>

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
					repository: 'http://smalltalkhub.com/mc/sbragagnolo/MetaDDS/main/' ].
		spec 
			package: #SimpleDDS with: [
				spec requires: #('MetaDDS' 'Ston' ). ];
			package: #SimpleDDSTesting with: [
				spec requires: #(#SimpleDDS ). ].
		spec 
			group: 'default' with: #(#SimpleDDS #SimpleDDSTesting );
			group: 'core' with: #(#SimpleDDS ). ].
