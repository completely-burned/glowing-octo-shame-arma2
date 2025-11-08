/*---------------------------------------------------------------------------
выбор типа роли в отряде
TODO: командир / подчиненный
одиночка / группа.

Основное меню.
---------------------------------------------------------------------------*/

private["_p","_z","_item","_n","_name","_id"];

_p = [];
//--- _n названия gui
_n = [];


//--- тип оружия
_z = [
	"Subordinate",
	1001,
	"Rifles",
	7, // Rifles
	"Sidearms",
	6, // Sidearms
	"Machineguns",
	8, // Machineguns
	"Sniper rifle",
	9, // Probably a heavy sniper rifle
	"Launchers",
	10, // Launchers
	"Medic",
	103, // Medic
	"Engineer",
	104, // Engineer
	"vVehicles",
	500, // all vehicles
	"vAir pilot (not completed)",
	605, // Air
	"vAir (not completed)",
	600, // Air
	"v" + getText(LIB_cfgVeh >> "Car" >> "displayName"),
	516,
	"vWheeled_APC",
	515,
	"v" + getText(LIB_cfgVeh >> "Tank" >> "displayName"),
	526,
	"vTracked_APC",
	525,
	// TODO: нужно запретить присоединение с другой стороны
	"vCrew: multiplayer prio.",
	// присоединяться к экипажу с другими игроками
	505,
	"vCrew: let others join",
	506,
	"weapons reset (not completed)",
	9999 // w reset
];

for "_i" from 0 to (count _z -2) step 2 do {
	_name = _z select _i;
	_item = _z select (_i+1);
	if (_item in gosa_squadOnW) then {
		_name = "[+] " + _name;
	};
	if (_item in gosa_squadOffW) then {
		_name = "[-] " + _name;
	};
	_p set [count _p, [_name, _item]];
	_n set [count _n, _name];
};



//--- игроки
_z = call gosa_fnc_listPlayers;
for "_i" from 0 to (count _z -1) do {
	_item = _z select _i;

	_name = name _item;
	_id = getPlayerUID _item;

	_p set [count _p, [_name, _id]];

	if (_id in gosa_squadOn) then {
		_name = "[+] " + _name;
	};
	if (_id in gosa_squadOff) then {
		_name = "[-] " + _name + " (not completed)";
	};

	_n set [count _n, _name + " " + str _id];
};


//--- -1 одиночка, -2 группа
_p = _p + [-1,-2,-2];
_n = _n + ["grpRole loner (not completed)","grpRole all","grpRole reset eq. all"];

gosa_SquadRole_array = _p;

_p = nil; _item = nil; _name = nil; _id =nil;


//--- код
gosa_TMP = {
	diag_log format ['Log: [gosa_TMP] %1', _this];
	private ['_z','_b'];

	_z = (gosa_SquadRole_array select _this);

	diag_log format ['Log: [fnc_setSquadRole] select %1', _z];

	_b = call {typeName _z == typeName 0};
	if (_b) then {
		if (_z >= 0) then {
			_b = false;
		};
	};
	if (_b) then {
			gosa_SquadRole = _z;
			diag_log format ['Log: [fnc_setSquadRole] global variable is set to %1', gosa_SquadRole];
			gosa_SquadRole_array = nil;
	}else{
		gosa_SquadRole_array = _z;
		[gosa_SquadRole_array] execVM 'dir\functions\fnc_setSquad.sqf';
	};

};

["setSquadRole", "gosa_z", _n, "", "%2 call gosa_TMP"] call BIS_FNC_createmenu;

showCommandingMenu "#USER:gosa_z_0";
