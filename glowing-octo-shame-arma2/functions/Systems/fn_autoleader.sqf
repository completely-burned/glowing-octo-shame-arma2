/*
	Скрипт переназначает командира отряда.
 */

private["_l"];

_l = _this select 0;

{
	if (rankId _x > rankId _l) then {
		diag_log format ["Log: [autoLeader] %1 > %2 (rankId)", [_x, typeOf _x], [_l, typeOf _l]];
		_l = _x;
	}else{
		if (rankId _x == rankId _l) then {
			if (getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "cost") >
				getNumber (configFile >> "CfgVehicles" >> typeOf _l >> "cost")
			) then {
				diag_log format ["Log: [autoLeader] %1 > %2 (cost)", [_x, typeOf _x], [_l, typeOf _l]];
				_l = _x;
			};
		};
	};
} forEach _this;

diag_log format ["Log: [autoLeader] %1 selectLeader %2", group _l, _l];
group _l selectLeader _l;
