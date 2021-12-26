/*---------------------------------------------------------------------------
ремонт техники
TODO: нужна анимация
TODO: нужно закрытие меню от багоюзеров
---------------------------------------------------------------------------*/

private["_item","_l","_e","_v","_n"];

_v = _this select 0;

if ({alive _x && group _x != group player}count crew _v > 0 or _v == vehicle player) exitWith {
	hint "[crew > 0] exit";
};

_l  = [];
_e  = [];

// точный type не работает должным образом, если добавить не действительные даже веселее
{
	_e set [count _e, configFile >> "CfgVehicles" >> _x >> "HitPoints"];
	_e set [count _e, configFile >> "CfgVehicles" >> _x >> "Turrets" >> "MainTurret" >>"HitPoints"];
} forEach ["Wheeled_APC","Tracked_APC","Tank","Car","Helicopter","Plane","BTR90","2S6M_Tunguska","AH64D"];


{
	for "_i" from 0 to (count _x -1) do {
		_item = _x select _i;
		if (isClass _item) then {
			_n = getText (_item >> "name");
			if !(_n in _l) then {
				if (random 10 > 5) then { // перемешать порядок
					_l  set [count _l,  _n];
				}else{
					_l = [_n]+_l;
				};
			};
		};
	};
} forEach [configFile >> "CfgVehicles" >> typeOf _v >> "HitPoints",
			configFile >> "CfgVehicles" >> typeOf _v >> "Turrets" >> "MainTurret" >>"HitPoints"] + _e;


gosa_repair_array = _l;
gosa_repair_vehicle = _v;

_c = "
	gosa_repair_vehicle setHit [gosa_repair_array select %2, 1-0.1-(random 0.2)];
	hint 'Ok';
	gosa_repair_array = nil; gosa_repair_vehicle = nil;
";

["repair", "gosa_z", _l, "", _c] call BIS_FNC_createmenu;

showCommandingMenu "#USER:gosa_z_0";

// форс-мажор закрытие меню
[_v] spawn {
	private ["_v"];
	_v = _this select 0;

	waitUntil {
		sleep 0.1;
		{alive _x && group _x != group player}count crew _v > 0 or
		_v == vehicle player or
		commandingMenu == "" or
		!alive player or
		vehicle player distance _v > 15
	};

	if (commandingMenu != "") then {
		showCommandingMenu "";
	};

	gosa_repair_array = nil; gosa_repair_vehicle = nil;
};
