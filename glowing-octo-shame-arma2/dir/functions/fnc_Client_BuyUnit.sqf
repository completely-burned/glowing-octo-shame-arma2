#define __A2OA__
/*
TODO: Рефакторинг.
*/
diag_log format ["Log: [fnc_Client_BuyUnit]: _this %1", _this];
private ["_type","_HQ","_fnc_1","_isUAV","_z","_player_dir","_obj",
	"_str","_type_Lower",
	"_factory","_pos","_logic","_typesHQ","_arr","_status"];

_type = _this Select 0;
_player_dir = getDir vehicle player;
_pos = vehicle player;

_type_Lower = toLower _type;

// _factory = [_logic, _class, _status, [_obj,_obj,objNull], _side, _str]
if !(isNil "gosa_menu") then {
	_factory = gosa_menu;
	diag_log format ["Log: [fnc_Client_BuyUnit]: _factory %1", _factory];
	if (_factory select 1 in [0]) then {
		_logic = _factory select 0;
		_pos = getPos _logic;
		_player_dir = getDir _logic;
	};
};

_pos = ([_pos, 0, 1 max sizeOf _type] call gosa_fnc_getSafePos);

_typesHQ = gosa_typesHQ;
if ([_type_Lower, 0] call gosa_fnc_isHQ) exitWith {
	_status = 2;
	_str = _type_Lower call gosa_fnc_fixType;
	_arr = [_pos, _type_Lower, _status, playerSide, player, _player_dir, _str];
	#ifdef __ARMA3__
		_arr remoteExec ["gosa_fnc_createHQ", 2];
	#else
		[nil, _arr, rgosa_fnc_createHQ] call RE;
	#endif
};

_HQ = listMHQ + HQ;

_isUAV=false;
if(_type isKindOf "UAV")then{
	_isUAV=true;
}else{
	if(getNumber (LIB_cfgVeh >> _type >> "isUav") == 1)then{
		_isUAV=true;
	};
};

_fnc_1={
	_obj = _this;
	_obj setDir _player_dir;
	#ifdef __ARMA3__
		[_obj, "fnc_Client_BuyUnit"] remoteExec ["gosa_fnc_vehInit2"];
	#else
		[nil, _obj, rvehInit] call RE;
	#endif
	// Синхронизация.
	if (isMultiplayer) then {
		_obj setPos getPos _obj;
	};
	_obj setVectorUp [0,0,1];
	group player addVehicle _obj;
	player reveal _obj;
	#ifndef __ARMA3__
		[[_obj], true] call gosa_fnc_reweapon;
	#endif
};

private ["_respawn_pos"];
_respawn_pos = [vehicle player, 101] call gosa_fnc_CheckRespawnDistance;

if (true) then {
	if (_type == "gosa_megaAmmoBox") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBBarracks"]+_HQ+["WarfareBDepot","WarfareBCamp"], gosa_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos or (missionNamespace getVariable "gosa_shop" == 2)) then {
				Private["_pos"];
				_pos = position vehicle player;
				_pos = [_pos, 1.5, getDir vehicle player] call BIS_fnc_relPos;
				Private["_veh"];
				_veh = ("USBasicAmmunitionBox_EP1" createVehicleLocal _pos);
				_veh setPos _pos;
				player reveal _veh;
				_veh setVariable ["gosa_megaAmmoBox",true];
				hint format["%1: %2", localize "str_support_done", "USBasicAmmunitionBox_EP1"];
		};
	};
	if ((_type isKindOf "ReammoBox") or (getText(configFile >> "CfgVehicles" >> _type >> "vehicleclass") in ["Ammo","ACE_Ammunition"])) then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBBarracks"]+_HQ+["WarfareBDepot","WarfareBCamp"], gosa_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos or (missionNamespace getVariable "gosa_shop" == 2)) then {
				Private["_pos"];
				_pos = position vehicle player;
				_pos = [_pos, 1.5, getDir vehicle player] call BIS_fnc_relPos;
				Private["_veh"];
				_veh = (_type createVehicle _pos);
				_veh setPos _pos;
				player reveal _veh;
				hint format["%1: %2", localize "str_support_done", _type];
		};
	};
	if (_type isKindOf "Man") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBBarracks"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], gosa_distanceCoinBase]);
		if ( (count _Objects > 0 ) or _respawn_pos or (missionNamespace getVariable "gosa_shop" == 2)) then {
			if ((count units player) < 10 or true)then{
				Private["_pos"];
				_pos = position vehicle player;
				// _pos = ([_pos, (sizeOf typeOf (_Objects select 0)) / 2 + (sizeOf _type) / 2, random 360] call BIS_fnc_relPos);
					Private["_veh"];
					_veh = (group player createUnit [_type, _pos, [], 0.2, "FORM"]);
					if(!isMultiplayer)then{
						addSwitchableUnit _veh;

						Private["_cost","_rank"];
						_cost = getNumber (configFile >> "CfgVehicles" >> _type >> "cost");
						_rank="PRIVATE";
						if(_cost>=50000)then{_rank="CORPORAL"};
						if(_cost>=150000)then{_rank="SERGEANT"};
						if(_cost>=250000)then{_rank="LIEUTENANT"};
						if(_cost>=350000)then{_rank="CAPTAIN"};
						if(_cost>=500000)then{_rank="MAJOR"};
						if(_cost>=750000)then{_rank="COLONEL"};
						if (toUpper _rank != "PRIVATE") then {
							#ifdef __ARMA3__
								_veh setRank _rank;
							#else
								// До A3 движок не синхронизирует ранги самостоятельно.
								[nil, _veh, rsetRank, _rank] call RE;
							#endif
						};
					};

					// Для __ARMA3__ нужно тоже отключить.
					#ifndef __A2OA__
					if (isServer) then {
						_veh addEventHandler ["killed",{[_this select 0] call BIS_GC_trashItFunc}];
						if ((!alive _veh) or (isNil "BIS_GC_trashItFunc")) then {
							deleteVehicle _veh;
						};
					};
					#endif

					_veh call _fnc_1;
					hint format["%1: %2", localize "str_support_done", _type];
			}else{
				hint "10 max";
			};
		};
	};
	if ([[_type],["Car","Motorcycle","Tank"]] call gosa_fnc_CheckIsKindOfArray) then
	{
			_pos = ([_pos, 0, 1 max sizeOf _type] call gosa_fnc_getSafePos);
			_veh = (createVehicle [_type, _pos, [], 20, "FORM"]);
			_veh call _fnc_1;
			hint format["%1: %2", localize "str_support_done", _type];
	};
	if (_type isKindOf "Helicopter") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBAircraftFactory"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], gosa_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos or (missionNamespace getVariable "gosa_shop" == 2)) then {
			if(_isUAV)then{
				_pos = player;
				Private["_veh"];
				_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
				_veh setPos ([_pos,0, 1 max sizeOf _type] call gosa_fnc_getSafePos);
				_veh call _fnc_1;
				[_veh, createGroup playerSide] call gosa_fnc_spawnCrew;
				hint format["%1: %2", localize "str_support_done", _type];
			}else{
				Private["_veh"];
				_z = ([player,0, 1 max sizeOf _type] call gosa_fnc_getSafePos);
				_veh = (createVehicle [_type, _z, [], 20, "FORM"]);
				_veh call _fnc_1;
				hint format["%1: %2", localize "str_support_done", _type];
			};
		};
	};
	if (_type isKindOf "Plane") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, _HQ+Airport+["WarfareBDepot","WarfareBCamp"], gosa_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos or (missionNamespace getVariable "gosa_shop" == 2)) then {
			Private["_veh"];
			if(_type isKindOf "UAV")then{
				if (count _Objects > 0) then {
					Private["_pos"];
					_pos = position (_Objects select 0);
					Private["_side","_grp","_wp"];
					_side = playerSide;
					_grp = createGroup _side;
					_pos = ([_pos]+([[_type]] call gosa_fnc_SafePosParams)+[_side] call gosa_fnc_findSafePos) select 0;
					_veh = [_pos, random 360, _type, _grp] call gosa_fnc_spawnVehicle;
					_veh = _veh select 0;
					_veh call _fnc_1;
					_wp = _grp addWaypoint [getPos player, 100];
					_wp setWaypointType "MOVE";
					hint format["%1: %2", localize "str_support_done", _type];
				}else{
					Private["_pos"];
					_pos = position vehicle player;
					Private["_dir"];
					_dir = direction vehicle player;
					_pos = ([_pos, sizeOf _type, _dir] call BIS_fnc_relPos);
					_veh = createVehicle [_type, _pos, [], 20, "FORM"];
					_veh setDir _dir;
				};
				_veh call _fnc_1;
			}else{
				_z = ([player,0, 1 max sizeOf _type] call gosa_fnc_getSafePos);
				_veh = (createVehicle [_type, _z, [], 20, "FORM"]);
				_veh call _fnc_1;
			};
			hint format["%1: %2", localize "str_support_done", _type];
		}else{
			if (_type isKindOf "MV22") then {
				_Objects = (nearestObjects [vehicle player, ["Base_WarfareBAircraftFactory"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], gosa_distanceCoinBase]);
				if ( (count _Objects > 0) or _respawn_pos or (missionNamespace getVariable "gosa_shop" == 2)) then {
					Private["_veh"];
					_z = ([player,0, 1 max sizeOf _type] call gosa_fnc_getSafePos);
					_veh = (createVehicle [_type, _z, [], 20, "FORM"]);
					_veh call _fnc_1;
					hint format["%1: %2", localize "str_support_done", _type];
				};
			};
		};
	};
	if ((_type isKindOf "Ship")) then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, pier, gosa_distanceCoinBase]);
		if ( count _Objects > 0 ) then {
			Private["_Object","_dir","_pos","_veh","_vel","_speed"];
			_Object = (_Objects select 0);
			_dir = direction _Object;
			_pos = position _Object;
			_pos = _pos findEmptyPosition [0,100,_type];
			_veh = createVehicle[_type, [0,0], [], 5, "FORM"];
			// _pos = ([_pos, (sizeOf typeOf _Object) / 2 + (sizeOf _type) / 2, (180 + _dir)] call BIS_fnc_relPos);
			_dir = [_veh, _Object] call BIS_fnc_dirTo;
			_veh setDir (_dir+180);
			_vel = velocity _veh;
			_dir = direction _veh;
			_veh setPos ([_pos,0, 1 max sizeOf _type, true] call gosa_fnc_getSafePos);
			_speed = -3;
			_veh call _fnc_1;
			hint format["%1: %2", localize "str_support_done", _type];
		};
	};
	if (_type isKindOf "StaticWeapon") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBBarracks"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], gosa_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos or (missionNamespace getVariable "gosa_shop" == 2)) then {
			Private["_veh"];
			_z = ([player,0, 1 max sizeOf _type] call gosa_fnc_getSafePos);
			_veh = (createVehicle [_type, _z, [], 20, "FORM"]);
			_veh call _fnc_1;
			hint format["%1: %2", localize "str_support_done", _type];
		};
	};
	// [_type] call gosa_fnc_setTimeAvailableVehiclesBuyMenu;
}else{
	hint format ["respawn safe distance %1m",safeDistance];
};

// FIXME: Возможно игроку предпочтительно вернутся в меню найма.
gosa_menu = nil;
