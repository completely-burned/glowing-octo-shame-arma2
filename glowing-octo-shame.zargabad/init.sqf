if !(requiredVersion "1.60") then {
	failMission "LOSER";
}else{
	debug=false;
	if (!IsDedicated) then {
		[] spawn {
			waitUntil {alive player};
			private ["_pos"];
			switch (playerSide) do {
				case (resistance):
				{
					_pos = getMarkerPos "respawn_guerrila";
				};
				case (west):
				{
					_pos = getMarkerPos "respawn_west";
				};
				case (east):
				{
					_pos = getMarkerPos "respawn_east";
				};
				case (civilian):
				{
					_pos = getMarkerPos "respawn_civilian";
				};
				default {
					_pos = getMarkerPos format["respawn_%1", playerSide];
				};
			};
			if(count _pos > 0)then{
				player setPos _pos;
			};
		};
	};
	[] Call Compile preprocessFileLineNumbers "m\init_common.sqf";
	if (isServer) then {
		[] spawn Compile preprocessFileLineNumbers "m\server\init_server.sqf";
	};
	if (!IsDedicated) then {
		[] Call Compile preprocessFileLineNumbers "m\client\init_client.sqf";
	};
};
