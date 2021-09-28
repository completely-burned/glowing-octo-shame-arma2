/* починка техники
 * TODO: еще не реализована починка башни и турели
 * TODO: нужна анимация
 */


private["_item","_l","_e","_t","_v","_n"];

_v = _this select 0;

if ({alive _x}count crew _v > 0) exitWith {
	hint "[crew > 0] exit";
};

_l  = [];

// если точный type не сработает
{
	if (_v isKindOf _x) exitWith {
		_t = configFile >> "CfgVehicles" >> _x >> "HitPoints";
	};
} forEach ["Wheeled_APC","Tracked_APC","Tank","Car","Helicopter","Plane"];


{
	for "_i" from 0 to (count _x -1) do {
		_item = _x select _i;
		if (isClass _item) then {
			_n = getText (_item >> "name");
			if !(_n in _l) then {
				_l  set [count _l,  _n];
			};
		};
	};
} forEach [configFile >> "CfgVehicles" >> typeOf _v >> "HitPoints",
			configFile >> "CfgVehicles" >> typeOf _v >> "Turrets" >> "MainTurret" >>"HitPoints", _t];


gosa_repair_array = _l;
gosa_repair_vehicle = _v;

_c = "
	gosa_repair_vehicle setHit [gosa_repair_array select %2, 1-0.1];
	if (gosa_repair_vehicle isKindOf 'LandVehicle') then {
		gosa_repair_vehicle setVectorUp [0,0,1];
	};
	hint 'Ok';
";

["repair", "gosa_repair_menu", _l, "", _c] call BIS_FNC_createmenu;

showCommandingMenu "#USER:gosa_repair_menu_0";
