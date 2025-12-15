private ["_units","_names","_leader","_str"];

_units = _this select 0;

_names = [
	
	getText(configfile >> "CfgVehicles" >> "B_officer_F" >> "displayName"),
	getText(configfile >> "CfgVehicles" >> "B_Soldier_SL_F" >> "displayName"),
	getText(configfile >> "CfgVehicles" >> "B_Soldier_TL_F" >> "displayName")
];

_leader = -1;
scopeName "root";
//_arr = configfile >> "CfgVehicles";
for "_i" from 0 to (count _units -1) do {
	for "_n" from 0 to (count _names -1) do {
		if (_names select _n != "") then {
			if (typeName (_units select _i) == typeName objNull) then {
				_str = getText(configfile >> "CfgVehicles" >> typeOf (_units select _i) >> "displayName");
			}else{
				_str = getText(configfile >> "CfgVehicles" >> (_units select _i) >> "displayName");
			};
			if (toLower (_names select _n) == toLower _str) then {
				_leader = _i;
				breakTo "root";
			};
		};
	};
};

_leader;
