switch (_this select 0) do {
	case east:		{"ModuleRespawnPositionEast_F"};
	case west:		{"ModuleRespawnPositionWest_F"};
	case resistance: {"ModuleRespawnPositionGuer_F"};
	case civilian:	{"ModuleRespawnPositionCiv_F"};
	default			{"LocationRespawnPoint_F"};
};
