while {!isDedicated} do {
		if (isNil {player getVariable "gosa_ban_handleDamage"}) then {
			player addEventHandler ["Killed",	{
				_this select 0 removeEventHandler ["handleDamage", _this select 0 getVariable "gosa_ban_handleDamage"];
			}];
			player setVariable [
				"gosa_ban_handleDamage",
				player addEventHandler ["handleDamage",	{_this call gosa_fnc_teamDamaging}]
			];
		};
	sleep 0.5;
};
