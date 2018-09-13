baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec baseline: 'SimpleDDS' with: [ spec repository: 'github://sbragagnolo/SimpleDDS/src' ].
			spec
				package: #SimpleDDSServer with: [ spec requires: #(#SimpleDDS) ];
				package: #SimpleDDSServerTesting with: [ spec requires: #(#SimpleDDSServer) ].
			spec
				group: 'core' with: #(#SimpleDDSServer);
				group: 'default' with: #(#core #SimpleDDSServerTesting) ]
