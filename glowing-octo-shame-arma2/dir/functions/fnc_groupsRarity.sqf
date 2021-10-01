/* меняет приоритеты
 * функция ничего не возвращает
 * нужно { _changes = +_orig; _changes call fnc; } будет изменен _changes
 */

private["_g","_t","_m","_r"];
_g = (_this select 0);
_m = 0;
{
	_m = _m max (_x select 1);
}forEach (_this select 1);

for "_i" from 0 to ((count (_g select 0)) - 1) do {
	_t = [_g, [0, _i, 0, 0, 0]] call BIS_fnc_returnNestedElement;
	{
		if( ([_t, _x select 0] call gosa_fnc_CheckIsKindOfArray) && !([_t, ["AllVehicles"], _x select 0] call gosa_fnc_CheckIsKindOfArray) )then {

			diag_log format ["Log: [fnc_groupsRarity] type %1", _t];

			_r = ([_g, [1, _i]] call BIS_fnc_returnNestedElement);
			diag_log format ["Log: [fnc_groupsRarity] rarity old %1", _r];

			if (_m == 0) then {
				_r = 0;
			}else{
				_r = ((_r * (_x select 1))/_m); // TODO: /ойвсе, опять бредятины накодил/, в итоге (*1/1), сколько можно болеть??, при нескольких вводных уменьшает лишь меньшие вводные, нужно учитывать имеющиеся данные
			};

			[_g, [1, _i],  _r] call BIS_fnc_setNestedElement;
			diag_log format ["Log: [fnc_groupsRarity] rarity new %1", ([_g, [1, _i]] call BIS_fnc_returnNestedElement)];
		};

	}forEach (_this select 1);
};
