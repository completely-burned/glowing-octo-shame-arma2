while {!isDedicated} do {
		if (isNil {player getVariable "draga_ban_handleDamage"}) then {
			player addEventHandler ["Killed",	{
				_this select 0 removeEventHandler ["handleDamage", _this select 0 getVariable "draga_ban_handleDamage"];
			}];
			player setVariable [
				"draga_ban_handleDamage",
				player addEventHandler ["handleDamage",	{_this call fnc_teamDamaging}]
			];
		};
	sleep 0.5;
};
