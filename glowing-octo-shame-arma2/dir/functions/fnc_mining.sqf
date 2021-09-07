/* антиугонная система
 * это мины, и вовсе не те что уныло лежат на видном месте
 * TODO: для авиации нужен таймер, сливающий топливо
 * TODO: минирование мертвых юнитов
 * TODO: для игороков нужно будет выводить предупреждение, <<обнаружено подозрительное устройство>>, но это лучше реализовать после ремонтного модуля
 */


private ["_v","_m","_h"];

_v = _this select 0;
_m = _this select 1;

switch (_m) do {

	case 1: {
		//--- минирование
		diag_log format ["Log: [fnc_mining] %1 минирование", _v];

		_v engineOn false;

		//--- EventHandler
		_h = _v addEventHandler ["engine",{
			// FIXME: _this select 1 не работает должным образом, возможно из-за разницы пинга, возвращает иногда противоположное значение
			// TODO: для этого блока нужна отдельнай функция
			diag_log format ["Log: [fnc_mining] EventHandler engine %1", _this];
			_this spawn {
				//waitUntil{isEngineOn _this select 0 or _t > time};
				//if (_this select 1) then {
					//--- взрыв
					"HelicopterExploSmall" createVehicle getpos (_this select 0);

					//--- чистка
					[_this select 0, 2] call gosa_fnc_mining;

					//--- прочие повреждения
					_this select 0 engineOn false;

					//--- уничтожение экипажа
					{
						_x setDamage 1;
					} forEach crew (_this select 0);
				//};
			};
		}];

		//--- статус
		_v setVariable ["gosa_mined", _h];
	};

	case 2: {
		//--- разминирование и чистка
		diag_log format ["Log: [fnc_mining] %1 разминирование и чистка", _v];
		_v removeEventHandler ["engine", _v getVariable "gosa_mined"];
		_v setVariable ["gosa_mined", nil];
	};

	case 3: {
		//--- подходит?
		alive _v &&
		isNil {_v getVariable "gosa_mined"} &&
		(_v isKindOf "Tank" or _v isKindOf "Wheeled_APC") &&
		getNumber(configFile >> "CfgVehicles" >> typeOf _v >> "side") in [0,1,2] &&
		!([[_v], listMHQ] call gosa_fnc_CheckIsKindOfArray) &&
		isNil {_v getVariable "gosa_respawnveht"}
	};

/*
	case 4: {
		//--- статус
		isNil _v getVariable "gosa_mined"
	};
*/

	default {};
};
