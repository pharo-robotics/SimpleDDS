constructor
startOn: anIP at: aPort for: aProtocol offering: aConnectionOffer onNewClient: aBlock 
	^ self new ip: anIP; port: aPort; protocol: aProtocol; connectionOffer: aConnectionOffer; onNewClient: aBlock; start; yourself.