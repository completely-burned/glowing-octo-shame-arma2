/*
	TODO: Оптимизация.
*/
waitUntil {!isNil "civilianBasePos"};
waitUntil {!isNil "gosa_locationSize"};
waitUntil {!isNil "group_system_units"};
waitUntil {!isNil "group_off_units"};
private["_g","_s","_c"];
while{true}do{
	_g = allGroups-[group_system_units];
	sleep 1;
	_c = count _g;
	if (_c > 0) then {
		_s = 14/_c;
		for "_i" from 0 to (_c -1) do {
			sleep _s;
			_g select _i call gosa_fnc_group_other;
		};
	};
};
