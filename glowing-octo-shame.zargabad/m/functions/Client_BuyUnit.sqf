private ["_type","_HQ","_fnc_1","_isUAV"];
_type = _this Select 0;

_HQ = ["BRDM2_HQ_Base","BTR90_HQ","LAV25_HQ","BMP2_HQ_Base","M1130_CV_EP1","Warfare_HQ_base_unfolded"];

_isUAV=false;
if(_type isKindOf "UAV")then{
	_isUAV=true;
}else{
	if(getNumber (LIB_cfgVeh >> _type >> "isUav") == 1)then{
		_isUAV=true;
	};
};

_fnc_1={
	_this setVectorUp [0,0,1];
	_this setVehicleLock "UNLOCKED";
	group player addVehicle _this;
	player reveal _this;
	_veh call m_fnc_vehInit;
	[[_veh], true] call m_fnc_reweapon;
};

private ["_respawn_pos"];
switch (playerSide) do {
	case (resistance):
	{
		_respawn_pos = getMarkerPos "respawn_guerrila";
	};
	case (civilian):
	{
		_respawn_pos = getMarkerPos "respawn_civilian";
	};
	case (west):
	{
		_respawn_pos = getMarkerPos "respawn_west";
	};
	case (east):
	{
		_respawn_pos = getMarkerPos "respawn_east";
	};
	default {
		_respawn_pos = getMarkerPos format["respawn_%1", playerSide];
	};
};

if ((_type isKindOf "ReammoBox") or (getText(configFile >> "CfgVehicles" >> _type >> "vehicleclass") in ["Ammo","ACE_Ammunition"])) then {
	Private["_Objects"];
	_Objects = (nearestObjects [player, ["Base_WarfareBBarracks"]+_HQ, 100]);
	if ( (count _Objects > 0) or ((player distance _respawn_pos) < 100 )) then {
			Private["_pos"];
			_pos = position player;
			Private["_veh"];
			_veh = (createVehicle [_type, _pos, [], 0.2, "FORM"]);
			player reveal _veh;
	};
};
if (_type isKindOf "Man") then {
	Private["_Objects"];
	_Objects = (nearestObjects [player, ["Base_WarfareBBarracks","Land_SS_hangar","WarfareBAirport","Land_Mil_hangar_EP1","Land_Hangar_F"]+_HQ, 100]);
	if ( (count _Objects > 0 ) or ((player distance _respawn_pos) < 100 )) then {
		if ((count units player) < 10 or true)then{
			Private["_pos"];
			_pos = position player;
			// _pos = ([_pos, (sizeOf typeOf (_Objects select 0)) / 2 + (sizeOf _type) / 2, random 360] call BIS_fnc_relPos);
			if (LIB_ahAvail or !isMultiplayer) then {
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
					_veh setRank _rank;
				};
				_veh call _fnc_1;
			}else{
				// _type createUnit [_pos, group player,"
								// if (isServer) then {
									// this addEventHandler ['killed',{[_this select 0] call BIS_GC_trashItFunc}];
									// if ((!alive this) or (isNil 'BIS_GC_trashItFunc')) then {
										// deleteVehicle this;
									// };
								// };
				// "];
			};
		}else{
			hint "10 max";
		};
	};
};
if (_type isKindOf "Car") then {
	Private["_Objects"];
	_Objects = (nearestObjects [player, ["Base_WarfareBLightFactory"]+_HQ, 100]);
	if ( (count _Objects > 0)  or ((player distance _respawn_pos) < 100 )) then {
		Private["_veh"];
		_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
		_veh setDir getDir player;
		Private["_pos"];
		_pos = position player;
		_pos resize 2;
		player moveInDriver _veh;
		_veh setPos _pos;
		_veh call _fnc_1;
	};
};
if (_type isKindOf "Motorcycle") then {
	Private["_Objects"];
	_Objects = (nearestObjects [player, ["Base_WarfareBLightFactory"]+_HQ, 100]);
	if ( (count _Objects > 0) or ((player distance _respawn_pos) < 100 )) then {
		Private["_veh"];
		_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
		_veh setDir getDir player;
		Private["_pos"];
		_pos = position player;
		_pos resize 2;
		player moveInDriver _veh;
		_veh setPos _pos;
		_veh call _fnc_1;
	};
};
if (_type isKindOf "Tank") then {
	Private["_Objects"];
	_Objects = (nearestObjects [player, ["Base_WarfareBHeavyFactory"]+_HQ, 100]);
	if ( (count _Objects > 0) or ((player distance _respawn_pos) < 100 )) then {
		Private["_veh"];
		_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
		_veh setDir getDir player;
		Private["_pos"];
		_pos = position player;
		_pos resize 2;
		player moveInDriver _veh;
		_veh setPos _pos;
		_veh call _fnc_1;
	};
};
if (_type isKindOf "Helicopter") then {
	Private["_Objects"];
	_Objects = (nearestObjects [player, ["Base_WarfareBAircraftFactory"]+_HQ, 100]);
	if ( (count _Objects > 0) or ((player distance _respawn_pos) < 100 )) then {
		Private["_veh"];
		_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
		_veh setDir getDir player;
		Private["_pos"];
		_pos = position player;
		_pos resize 2;
		player moveInDriver _veh;
		_veh setPos _pos;
		_veh call _fnc_1;
	};
};
if (_type isKindOf "Plane") then {
	Private["_Objects"];
	_Objects = (nearestObjects [player, ["Land_SS_hangar","WarfareBAirport","Land_Mil_hangar_EP1","Land_Hangar_F"], 100]);
	if ( (count _Objects > 0) or ((player distance _respawn_pos) < 100 )) then {
		if(_type isKindOf "UAV")then{
			Private["_Object"];
			_Object = (_Objects select 0);
			Private["_dir"];
			_dir = direction _Object;
			Private["_pos"];
			_pos = position (_Objects select 0);
			_pos = ([_pos, (sizeOf typeOf _Object) / 2 + (sizeOf _type) / 2, (180 + _dir)] call BIS_fnc_relPos);
			Private["_veh"];
			_veh = createVehicle [_type, _pos, [], 20, "FORM"];
			_veh setDir (180 + _dir);
			_veh call _fnc_1;
			[_veh, createGroup playerSide] call m_fnc_spawnCrew;
		}else{
			Private["_veh"];
			_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
			_veh setDir getDir player;
			Private["_pos"];
			_pos = position player;
			_pos resize 2;
			player moveInDriver _veh;
			_veh setPos _pos;
			_veh call _fnc_1;
		};
	}else{
		if (_type isKindOf "MV22") then {
			_Objects = (nearestObjects [player, ["Base_WarfareBAircraftFactory"]+_HQ, 100]);
			if ( (count _Objects > 0) or ((player distance _respawn_pos) < 100 )) then {
				Private["_veh"];
				_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
				_veh setDir getDir player;
				Private["_pos"];
				_pos = position player;
				_pos resize 2;
				player moveInDriver _veh;
				_veh setPos _pos;
				_veh call _fnc_1;
			};
		};
	};
};
if ((_type isKindOf "Ship")) then {
	Private["_Objects"];
	_Objects = (nearestObjects [player, ["Land_nav_pier_m_2","Land_nav_pier_m_F"], 100]);
	if ( count _Objects > 0 ) then {
		Private["_Object","_dir","_pos","_veh","_vel","_speed"];
		_Object = (_Objects select 0);
		_dir = direction _Object;
		_pos = position _Object;
		_pos = _pos findEmptyPosition [0,100,_type];
		_veh = createVehicle[_type, _pos, [], 5, "FORM"];
		// _pos = ([_pos, (sizeOf typeOf _Object) / 2 + (sizeOf _type) / 2, (180 + _dir)] call BIS_fnc_relPos);
		_dir = [_veh, _Object] call BIS_fnc_dirTo;
		_veh setDir (_dir+180);
		_vel = velocity _veh;
		_dir = direction _veh;
		_speed = -3;
		_veh setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),0];
		player moveInDriver _veh;
		_veh call _fnc_1;
	};
};
