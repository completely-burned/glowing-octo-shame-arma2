#define __A2OA__

/*
Скрипт возрождения мобильного штаба.
TODO: устранить конфликт с маркерами. FIXME: Маркерами??
TODO: Совместимость с pvp.
TODO: Оптимизация.
*/

if (missionNamespace getVariable "gosa_MHQ" != 1) exitWith {
	diag_log format ["Log: [while_mhq] respawn type %1 exitWith", missionNamespace getVariable "respawn"];
};

private ["_StartingLocationsPos","_MHQ","_true"];
_StartingLocationsPos = ([] call gosa_fnc_getStartingPosMHQ);

waitUntil{!isNil {MHQ_list}};
waitUntil{!isNil {bis_fnc_init}};
waitUntil{!isNil {safeSpawnDistance}};
waitUntil{!isNil {gosa_friendlyside}};

diag_log format ["Log: [while_mhq] post waitUntil", nil];

_MHQ = objNull;

while{true}do{
	if !(alive _MHQ) then{

		#ifdef __A2OA__
			// -- развернутые базы
			{
				if(toLower typeOf _x in (MHQ_list select 1) && alive _x)then{
					// один штаб, остальные удаляются
					if(isNull _MHQ)then{
						_MHQ = _x;
					}else{
						diag_log format ["Log: [while_mhq] %1 setDamage 1", _x];
						_x setDamage 1;
					};
				};
			} forEach allMissionObjects "Warfare_HQ_base_unfolded";
		#endif

		// -- не развернутые мобильные базы
		{
			if(toLower typeOf _x in (MHQ_list select 0) && alive _x)then{
				// один штаб, остальные удаляются
				if(isNull _MHQ)then{
					_MHQ = _x;
				}else{
					diag_log format ["Log: [while_mhq] %1 setDamage 1", _x];
					_x setDamage 1;
				};
			};
		} forEach vehicles;

		private ["_list","_dist","_i"];
		_list =+ _StartingLocationsPos;
		_dist =+ (safeSpawnDistance select 5);

		diag_log format ["Log: [while_mhq] mhq %1 %2", _MHQ, [_list, _dist]];

		scopeName "scope1";
		while {!alive _MHQ} do {
			_i = floor random count _list;
			_pos = _list select _i;

			_true = true;

			// проверка дистанции точки
			if !(isNil "civilianBasePos") then{
				if(_pos distance civilianBasePos < _dist)then{
					diag_log format ["Log: [while_mhq] %1 distance civilianBasePos <", _pos];
					_true = false;
				};
			};

			// проверка дистанции врагов
			if({(side _x in m_sideEnemy)} count (_pos nearEntities _dist) > 0)then{
				diag_log format ["Log: [while_mhq] %1 distance enemy <", _pos];
				_true = false;
			};

			if(_true)then{
				_MHQ = createVehicle [(MHQ_list select 0) call BIS_fnc_selectRandom, _StartingLocationsPos call BIS_fnc_selectRandom, [], 0, "NONE"];
				[nil, _MHQ, rvehInit] call RE;
				diag_log format ["Log: [while_mhq] %1 created", _MHQ];
				breakTo "scope1";

			}else{
				_list set [_i, objNull];
				_list = _list - [objNull];
				// требования к растоянию до противников понижаются
				if(count _list == 0)then{
					_dist = _dist - ((safeSpawnDistance select 5) / 5);
					_list =+ _StartingLocationsPos;
					diag_log format ["Log: [while_mhq] mhq %1 %2", _MHQ, [_list, _dist]];
				};

			};

		};
	};

	sleep 10;
};
