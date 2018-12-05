if ([[_this], ["StaticWeapon"]] call m_fnc_CheckIsKindOfArray) then {
	if (alive _this) then {
		private["_side"];
		_side = getNumber(LIB_cfgVeh >> typeOf _this >> "side") call m_fnc_getSide;
		if (_side in m_friendlySide) then {
			if ({alive _x} count (nearestObjects [_this, draga_objectsReammo, draga_distanceReammo]) > 0) then {
				if ([getPos _this, 3.5] call m_fnc_CheckPlayersDistance)then{
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
						private["_list","_grp"];
						_list = _this nearEntities ["StaticWeapon", (draga_distanceReammo*2+10) max 300];
						scopeName "scopeName_list";
						private["_obj"];
						{
							_obj = _x;
						    if (({isPlayer _x} count units group _obj) == 0 && (_side == side _obj)) then {
						        _grp = group _obj;
										breakTo "scopeName_list";
						    };
						} forEach _list;
						if (isNil {_grp}) then {
						   _grp = createGroup _side;
						};
						_crew = [_this, _grp] call m_fnc_spawnCrew;
						_this setVariable ["_crew", _crew];
			    };
				};
			};
		};
	};
};
