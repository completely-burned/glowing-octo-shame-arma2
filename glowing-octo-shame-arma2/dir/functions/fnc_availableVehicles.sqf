private["_friendly_vehicles_only","_vehicleClass","_list","_true"];
_friendly_vehicles_only = missionNamespace getVariable "gosa_vehicles_lock";

_list = [];
for "_i" from 0 to ((count (configFile >> "CfgVehicles")) - 1) do {
	private ["_entry"];
	_entry = ((configFile >> "CfgVehicles") select _i);
	if (isClass _entry) then {
		if ((getNumber(_entry >> "scope")) in [1,2]) then {
			if (
					!(((getNumber(_entry >> "side")) call gosa_fnc_getSide) in [west,east,resistance])
				or
					(_friendly_vehicles_only != 1)
				//or
					//!isMultiplayer
				or
					((getNumber(_entry >> "side")) call gosa_fnc_getSide) in gosa_friendlyside
			) then {
				_libEnabled = [_entry] call gosa_fnc_libEnabled;
				if (_libEnabled) then {
					_vehicleClass = getText(_entry >> "vehicleclass")
					_true = false;
					if (_vehicleClass in ["Ammo","ACE_Ammunition"]) then {
						_true = true;
					};
					if (((getText(_entry >> "simulation")) == "soldier") && (getNumber(_entry >> "isMan") == 1)) then {
						_true = true;
					};
					if !(getText(_entry >> "simulation") in ["invisible", "house", "thing", "flagcarrier", "fire", "breakablehouseproxy", "breakablehouse", "parachute"]) then {
						if!(configname _entry isKindOf "Chukar")then{
							_true = true;
						};
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
