
/*
*/
//_logic = bis_alice_mainscope;
_movein = false;

diag_log Format ["Log: [fnc_civilianSet] _this %1",_this];

_unit = _this select 0;
if (typename _unit == typename "") then {
	if (count _this > 3) then{
		_grp = _this select 3;
	} else {
		_grp = if (count _this > 1) then {(_this select 1) getvariable "ALICE_group"};
		if (isNil "_grp") then {
			createcenter civilian;
			_grp = creategroup civilian;
		};
	};
	diag_log Format ["Log: [fnc_civilianSet] _grp %1",_grp];
	_class = _unit;
	_pos = 	if (count _this > 2) then {position (_this select 2)} else {
		if (count _this > 1) then {position (_this select 1)} else {[1,1,1]};
	};
	diag_log Format ["Log: [fnc_civilianSet] _pos %1",_pos];
	_unit = _grp createUnit [_class, _pos, [], 0, "NONE"];
	_movein = true;
};
diag_log Format ["Log: [fnc_civilianSet] _unit %1",_unit];

_twn = if (count _this > 1) then {_this select 1} else {
	diag_log Format ["Log: [fnc_civilianSet] _twn %1",_twn];
	_twns = position _unit nearEntities ["LocationLogicCityCenter",100000];
	if (count _twns > 0) then{
		_twns select 0;
	} else {
		diag_log Format ["Log: [fnc_civilianSet] Cannot add %1 - no towns available!",_x];
	};
};
if (typename _twn == "BOOL") exitwith {};
_door = if (count _this > 2) then {_this select 2} else {
	_doors = position _twn nearentities ["bis_alice_emptydoor",500];
	if (count _doors > 0) then {
		_doors call BIS_fnc_selectRandom;
	} else {
		diag_log Format ["Log: [fnc_civilianSet] Cannot add %1 - no doors available in %2!",_x,_twn];
	};
};
if (typename _door == "BOOL") exitwith {};
//_id = _logic getvariable "id";
//[_logic,"id",1,true] call bis_fnc_variablespaceadd;

sleep 0.01;

//--- Set values
if (_movein) then {
	//--- In da house
	doStop _unit;
	_unit setpos position _door;
	//_unit assignascargo _door;
	//_unit moveincargo _door;
	_unit setskill (random 1);

};
//[_unit] join (_twn getvariable "ALICE_group");
_unit setbehaviour "safe";
//_unit setvariable ["ALICE_id",_id,true];
_unit setvariable ["ALICE_twn",_twn,true];
_unit setvariable ["ALICE_door",_door,true];
_unit setvariable ["ALICE_randomValue",random 1,true];
_unit setvariable ["ALICE_type",getnumber(configfile >> "cfgvehicles" >> typeof _unit >> "characterID")];
_moves = gettext(configfile >> "cfgvehicles" >> typeof _unit >> "moves");
_unit setvariable ["ALICE_moves",_moves];

#ifdef __ARMA3__
	[_veh] call gosa_fnc_vehInit2;
#else
	[nil, _veh, rvehInit] call RE;
#endif

_unit;
