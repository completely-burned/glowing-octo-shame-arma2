if ([[_this], ["StaticWeapon"]] call m_fnc_CheckIsKindOfArray) then {
	if (alive _this) then {
		// установка не разрушена

		private["_side"];
		_side = getNumber(LIB_cfgVeh >> typeOf _this >> "side") call m_fnc_getSide;
		if (_side in m_friendlySide) then {
			// работает только в pve m_friendlySide
			if ({alive _x} count (nearestObjects [_this, draga_objectsReammo, draga_distanceReammo]) > 0) then {
				// рядом есть база
				if ([getPos vehicle _this, 5] call m_fnc_CheckPlayersDistance)then{
					// установка близко от игроков
					private["_crew"];
					_crew = _this getVariable "_crew";
					// _gunner = assignedGunner _this;
					// if (isPlayer _gunner) then {_gunner = nil};
					if (!isNil {_crew}) then {

						if (currentCommand (_crew select 0) != "GET OUT") then {
							private["_draga_fnc_StaticWeapon_commandGetOut"];
							_draga_fnc_StaticWeapon_commandGetOut = (_crew select 0) getVariable "_draga_fnc_StaticWeapon_commandGetOut";
							if (isNil {_draga_fnc_StaticWeapon_commandGetOut}) then {
								_draga_fnc_StaticWeapon_commandGetOut = time;
								diag_log format ["draga_fnc_StaticWeapon.sqf GET OUT, %1 _draga_fnc_StaticWeapon_commandGetOut = time", (_crew select 0)];
								(_crew select 0) setVariable ["_draga_fnc_StaticWeapon_commandGetOut", _draga_fnc_StaticWeapon_commandGetOut];
								[_crew, _draga_fnc_StaticWeapon_commandGetOut] spawn {
									private["_crew", "_time"];
									_crew = _this select 0;
									_time = _this select 1;
									_time = _time + 120;
									diag_log format ["draga_fnc_StaticWeapon.sqf spawn GET OUT, doStop %1", _crew];
									doStop _crew;
									waitUntil {sleep 0.01; _time > time or currentCommand (_crew select 0) == "STOP"};
									diag_log format ["draga_fnc_StaticWeapon.sqf spawn GET OUT, %1 orderGetIn false", _crew];
									_crew orderGetIn false;
									waitUntil {sleep 0.01; _time > time or currentCommand (_crew select 0) == "GET OUT"};
									diag_log format ["draga_fnc_StaticWeapon.sqf spawn GET OUT, %1 _draga_fnc_StaticWeapon_commandGetOut = nil", (_crew select 0)];
									(_crew select 0) setVariable ["_draga_fnc_StaticWeapon_commandGetOut", nil];
								};
							};
						};


						if !(stopped (_crew select 0)) then {
							if ( (_crew select 0) distance _this > 5 ) then {
								// diag_log format ["draga_fnc_StaticWeapon.sqf %1 stop true", (_crew select 0)];
								// (_crew select 0) stop true;
								diag_log format ["draga_fnc_StaticWeapon.sqf doStop %1", _crew];
								doStop _crew;
							};
						};

					};

				}else{
					// установка на расстоянии от игроков

					// чтение закрепленного ии
					private["_crew"];
					_crew = _this getVariable "_crew";
					// _gunner = assignedGunner _this;
					// if (isPlayer _gunner) then {_gunner = nil};

					scopeName "alive_gunner";
					// проверка живого ии в установке
					if (!alive gunner _this) then {
						// живой ии в установке отсутствует

						if (!isNil {_crew}) then {
							 // есть закрепленный ии
							if (alive (_crew select 0) && ((_crew select 0) == vehicle (_crew select 0))) then {
								// закрепленный ии живой

								if (stopped (_crew select 0)) then {
									if (currentCommand (_crew select 0) in ["GET IN"]) then {
										// diag_log format ["draga_fnc_StaticWeapon.sqf GET IN, %1 stop false", (_crew select 0)];
										// (_crew select 0) stop false;
									};
								};

								if (assignedGunner _this != (_crew select 0)) then {
									diag_log format ["draga_fnc_StaticWeapon.sqf GET IN, %1 assignAsGunner %2", currentCommand (_crew select 0), _this];
									_crew select 0 assignAsGunner _this;
								};

								if (currentCommand (_crew select 0) != "GET IN") then {
									private["_draga_fnc_StaticWeapon_commandGetIn"];
									_draga_fnc_StaticWeapon_commandGetIn = (_crew select 0) getVariable "_draga_fnc_StaticWeapon_commandGetIn";
									if (isNil {_draga_fnc_StaticWeapon_commandGetIn}) then {
										_draga_fnc_StaticWeapon_commandGetIn = time;
										diag_log format ["draga_fnc_StaticWeapon.sqf GET IN, %1 draga_fnc_StaticWeapon_commandGetIn = time", (_crew select 0)];
										(_crew select 0) setVariable ["_draga_fnc_StaticWeapon_commandGetIn", _draga_fnc_StaticWeapon_commandGetIn];
										[_crew, _draga_fnc_StaticWeapon_commandGetIn] spawn {
											private["_crew", "_time"];
											_crew = _this select 0;
											_time = _this select 1;
											_time = _time + 120;
											// diag_log format ["draga_fnc_StaticWeapon.sqf spawn GET IN, %1 stop false", (_crew select 0)];
											// (_crew select 0) stop false;
											diag_log format ["draga_fnc_StaticWeapon.sqf spawn GET IN, %1 orderGetIn true", _crew];
											_crew orderGetIn true;
											waitUntil {sleep 1; _time > time or currentCommand (_crew select 0) == "GET IN"};
											diag_log format ["draga_fnc_StaticWeapon.sqf spawn GET IN, %1 _draga_fnc_StaticWeapon_commandGetIn = nil", (_crew select 0)];
											(_crew select 0) setVariable ["_draga_fnc_StaticWeapon_commandGetIn", nil];
										};
									};
								};

								breakTo "alive_gunner";
							}else{
								// закрепленный ии убит
								{
									_x spawn {
										moveOut _this; // bugfix выходит без анимации
										private["_time"]; // bugfix
										_time = time + 60; // bugfix
										waitUntil {vehicle _this == _this or _time > time}; // bugfix
										deleteVehicle _this; // удаляется
									};
								} forEach _crew;
								_this setVariable ["_crew", nil];
							};
						};

						// список других ии в установках рядом
						private["_list","_grp"];
						_list = _this nearEntities ["StaticWeapon", (draga_distanceReammo*2+10) max 300];
						scopeName "scopeName_list";
						private["_obj"];
						{
							_obj = _x;
						    if (({isPlayer _x} count units group _obj) == 0 && (_side == side _obj)) then {
								// использовать группу другого ии в установках рядом
								// ! группа может удалится в другом скрипте до подключения к ней ии
						        _grp = group _obj;
								breakTo "scopeName_list";
						    };
						} forEach _list;
						if (isNil {_grp}) then {
							// создать группу при отсутствии
						   _grp = createGroup _side;
						};
						// создать ии и поместить в установку
						_crew = [_this, _grp] call m_fnc_spawnCrew;
						_this setVariable ["_crew", _crew];
			    	};
				};
			};
		};
	};
};
