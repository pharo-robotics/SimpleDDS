baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'MetaDDS'
					with: [ spec repository: 'github://sbragagnolo/MetaDDS/src' ];
				project: 'BabyMock2'
					with: [ spec
						className: #ConfigurationOfBabyMock2;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ].
			spec
				package: #SimpleDDS with: [ spec requires: #('MetaDDS' 'Ston') ];
				package: #SimpleDDSTesting
					with: [ spec requires: #(#SimpleDDS 'BabyMock2') ].
			spec
				group: 'default' with: #(#SimpleDDS #SimpleDDSTesting);
				group: 'core' with: #(#SimpleDDS) ]