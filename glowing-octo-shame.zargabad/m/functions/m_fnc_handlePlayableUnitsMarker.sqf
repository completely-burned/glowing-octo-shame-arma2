if(isMultiplayer)then{

	private ["_markers","_units"];
	_markers = [];
	_units = [];

	while {true} do {
		{
			if(!(_x in _units) && (side _x == playerSide))then{
				_units set [count _units, _x];
				_markers set [count _markers, createMarkerLocal [str _x,position _x]];
			};
		}forEach playableUnits;

		for "_i" from 0 to (count _units - 1) do {
			private ["_unit","_marker"];
			_unit = (_units select _i);
			_marker = (_markers select _i);
			if (!isNull _unit && alive _unit) then {
				private ["_veh"];
				_veh = vehicle _unit;							
				if ((_veh == _unit) || (_unit == (effectiveCommander _veh))) then {	
					_marker setMarkerPosLocal (position _veh);
					_marker setMarkerTypeLocal "vehicle";
					// _marker setMarkerDirLocal getDir _veh;
					_marker setMarkerSizeLocal [3,3];
					private ["_text"];
					_text = name _unit;
					if (lifeState _unit == "UNCONSCIOUS") then {
						_text = _text + (" " + "{" + Localize "str_reply_injured" + "}");
					};
					_text = (_text + " " + "[" + getText(configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'displayName') + "]");
					_marker setMarkerTextLocal _text;
				}else{
					//set marker to invisible area on the map
					_marker setMarkerPosLocal [35000,35000];
				};
			}else{
				deleteMarkerLocal _marker;
				_units set [_i,-1];
				_markers set [_i,-1];
			};
		};

		_units = (_units - [-1]);
		_markers = (_markers - [-1]);
		
		sleep 0.5
	};
};