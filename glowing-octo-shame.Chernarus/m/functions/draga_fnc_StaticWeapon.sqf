if ([[_this], ["StaticWeapon"]] call m_fnc_CheckIsKindOfArray) then {
	if (alive _this) then {
		if ({alive _x} count (nearestObjects [_this, listMHQ + HQ + ["Base_WarfareBBarracks","Base_WarfareBLightFactory"], 150]) > 0) then {
			if ([getPos _this, 10] call m_fnc_CheckPlayersDistance)then{
				private["_crew"];
				_crew = _this getVariable "_crew";
				if (!isNil {_crew}) then {
					{
				    moveOut _x;
						deleteVehicle _x;
					} forEach _crew;
					_this setVariable ["_crew", nil];
				};
			}else{
				private["_side"];
				_side = getNumber(LIB_cfgVeh >> typeOf _this >> "side") call m_fnc_getSide;
				if (_side in m_friendlySide) then {
					if (!alive gunner _this) then {
						private["_crew"];
						_crew = _this getVariable "_crew";
						if (!isNil {_crew}) then {
							{
						    moveOut _x;
								deleteVehicle _x;
							} forEach _crew;
							_this setVariable ["_crew", nil];
						};
						_crew = [_this, createGroup _side] call m_fnc_spawnCrew;
						_this setVariable ["_crew", _crew];
			    };
				};
			};
  	};
	}else{
		private["_crew"];
		_crew = _this getVariable "_crew";
		if (!isNil {_crew}) then {
			{
				moveOut _x;
				deleteVehicle _x;
			} forEach _crew;
			_this setVariable ["_crew", nil];
		};
	};
};
