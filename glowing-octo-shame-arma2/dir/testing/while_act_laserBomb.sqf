/*скрипт добавляет игроку с лазерным указателем в меню действие для сброса бомбы
 */

private ["_shell","_act_create","_act"];

_act_create = false;
_act = [];

while {true} do {

	if (currentWeapon player == "Laserdesignator") then {
		_shell = player getVariable "gosa_laserBoShell";
		if (!isNil "_shell" && {alive _shell}) then {
			_act_create = false;
		}else{
			_act_create = true;
		};
		sleep 1;
	}else{
		_act_create = false;
		sleep 10;
	};

	// TODO: действие не удаляется сразу и повторно использовать ошибочно можно
	if (_act_create) then {
		if (count _act == 0) then {
			_act set [0, player];
			_act set [1,
				_act select 0 addAction [
					"laserBomb (testing)",
					"dir\actions\act_laserBomb.sqf"
				]
			];
		};
	}else{
		if (count _act > 0) then {
			_act select 0 removeAction (_act select 1);
			_act = [];
		};
	};

};
