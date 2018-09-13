accessing
set: aValue
	self basicSet: aValue.
	domain note: (DDSParameterAnnouncement hasBeenSetted: self).