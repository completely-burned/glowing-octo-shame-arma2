#define __A2OA__

private ["_obj","_var"];

while {!isDedicated} do {
		if (isNil {player getVariable "gosa_ban_handleDamage"}) then {
			player addEventHandler ["Killed",	{
				_this select 0 removeEventHandler ["handleDamage", _this select 0 getVariable "gosa_ban_handleDamage"];
			}];
			player setVariable [
				"gosa_ban_handleDamage",
				player addEventHandler ["handleDamage",	{_this spawn gosa_fnc_teamDamaging; _this select 2}]
			];
		};

	// проверка переменных
	{
		_obj = _x;
		{
			_var = _obj getVariable _x;
			if (!isNil "_var") then {
#ifdef __A2OA__
				systemChat format["CoIn %1: %2", localize "STR_gosa_cheat_detected", player];
#endif
				_obj setVariable [_x, nil];
			};
		} forEach ["BIS_COIN_onStart","BIS_COIN_onSelect","BIS_COIN_onPurchase","BIS_COIN_onConstruct","BIS_COIN_onRepair","BIS_COIN_onSell"];
	} forEach vehicles; // needed for all objects, not just for vehicles

	sleep 0.5;
};
