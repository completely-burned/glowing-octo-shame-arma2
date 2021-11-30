/*---------------------------------------------------------------------------
выбор типа роли в отряде
TODO: командир / подчиненный
одиночка / группа
---------------------------------------------------------------------------*/

private["_p","_z","_item","_n","_name","_id"];


// loner одиночка, all группа
_p = ["loner","all","reset"];


//--- _n названия gui
_n = ["loner (not completed)","all","reset eq. all"];


//--- игроки
_z = call BIS_fnc_listPlayers;
for "_i" from 0 to (count _z -1) do {
	_item = _z select _i;

	_name = name _item;
	_id = getPlayerUID _item;

	_p set [3+_i, [_name, _id]];
	_n set [3+_i, _name + " " + str _id];
};


gosa_SquadRole_array = _p;

_p = nil; _item = nil; _name = nil; _id =nil;


//--- код
_z = "
	private ['_z'];

	_z = gosa_SquadRole_array select %2;

	diag_log format ['Log: [fnc_setSquadRole] select %1', _z];

	if (typeName _z == typeName '') then {
		if (_z == 'reset') then {
			gosa_SquadRole = 'reset';
		}else{
			gosa_SquadRole = _z;
		};
	}else{
		gosa_SquadRole = _z select 1;
	};

	gosa_SquadRole_array = nil;

	diag_log format ['Log: [fnc_setSquadRole] global variable is set to %1', gosa_SquadRole];

";

["setSquadRole", "gosa_z", _n, "", _z] call BIS_FNC_createmenu;

showCommandingMenu "#USER:gosa_z_0";
