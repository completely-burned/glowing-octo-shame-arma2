/*
 * TODO: Постройки для стройки.
 */

private["_friendly_vehicles_only","_vehicleClass","_list","_true",
	"_hiddenSelectionsTextures_deny",
	"_str","_sim","_arr","_cfgVeh","_entry"];
_friendly_vehicles_only = missionNamespace getVariable "gosa_vehicles_lock";
_cfgVeh = LIB_cfgVeh;

_hiddenSelectionsTextures_deny = [
	"\ca\misc3\data\select_green_ca.paa"];

_list = [];
for "_i" from 0 to ((count _cfgVeh) - 1) do {
	_entry = (_cfgVeh select _i);
	if (isClass _entry) then {
		if ((getNumber(_entry >> "scope")) in [1,2]) then {
			if (
					!(((getNumber(_entry >> "side")) call gosa_fnc_getSide) in [west,east,resistance])
				or
					(_friendly_vehicles_only != 1)
			) then {
				_libEnabled = [_entry] call gosa_fnc_libEnabled;
				if (_libEnabled) then {
					_vehicleClass = getText(_entry >> "vehicleclass");
					if (_vehicleClass in ["MenStory"]) exitWith {};
					_true = false;
					if (_vehicleClass in ["Ammo","ACE_Ammunition"]) then {
						_true = true;
					};
					_sim = toLower getText(_entry >> "simulation");
					if ((_sim == "soldier") && (getNumber(_entry >> "isMan") == 1)) then {
						_true = true;
					};
					if !(_sim in ["invisible", "house", "thing", "flagcarrier", "fire", "breakablehouseproxy", "breakablehouse", "parachute"]) then {
						if!(configname _entry isKindOf "Chukar")then{
							_true = true;
						};
					};

					_str = getText (_entry >> "GhostPreview");
					if (_sim == "house" && _str != "" && toLower _str != toLower configname _entry) then {
						_true = true;
						_arr = getArray (_entry >> "hiddenSelectionsTextures");
						if ({toLower _x in _hiddenSelectionsTextures_deny} count _arr > 0) then {_true = false};
					};

					if (_true) then {
						_list set [count _list, configname _entry];
					};
				};
			};
		};
	};
};
_list;
