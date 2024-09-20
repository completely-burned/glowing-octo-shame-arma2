/*---------------------------------------------------------------------------
Принудительное обнаружение игрока.
FIXME: От этотого скрипта нет пользы.
FIXME: Лучше повышать knowsAbout игрока до >=1.5
---------------------------------------------------------------------------*/

private["_l_enemy","_p","_z","_knowledge","_r","_frames_required","_enemySide","_fps_conf"];

if (missionNamespace getVariable "gosa_reveal" == 1) then {

	_r = true;

	waitUntil{!isNil "gosa_friendlyside"};

	_fps_conf = (missionNamespace getVariable "gosa_ai_client_create_fps");
	if (_fps_conf == 0) then {
		_fps_conf = 30;
	};

	_enemySide = [west,east,resistance] - gosa_friendlyside;
 }else{
	_r = false;
};

diag_log format ["Log: [reveal_cl] enabled %1", _r];

while {_r} do {

	// lineIntersects нагружает cpu
	if(diag_fps > _fps_conf)then{

		_p = player;

		_knowledge = 0;
		for "_i" from 0 to count _enemySide -1 do {
			_knowledge = ((_enemySide select _i) knowsAbout _p) max _knowledge;
		};

		diag_log format ["Log: [reveal_cl] %1", [_p,_knowledge]];

		// игрока уже обнаружили
		if (_knowledge < 1.5) then {

			_l_enemy = [];
			{
				if (side _x getFriend gosa_playerSide < 0.6) then {
					_l_enemy set [count _l_enemy, _x];
				};
			// lineIntersects 1000m ограничен
			} forEach (_p nearEntities 1000);

			if (count _l_enemy > 0) then {

				_z = _l_enemy call BIS_fnc_selectRandom;

				// TODO: видит затылком
				if !(lineIntersects [eyePos _z, aimPos _p, _z, _p]) then {
					_z reveal _p;
					diag_log format ["Log: [reveal_cl] %1 reveal %2", _z, _p];
				};
			};

		};
	};

	sleep 15 + random 5;
};
