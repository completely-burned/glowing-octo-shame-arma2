/* меняет приоритеты
 * функция ничего не возвращает
 * нужно { _changes = +_orig; _changes call fnc; } будет изменен _changes
 * итоговые rarity могут превысить 1, 
 * что не будет работать с оригинальными функциями
 */

private["_g","_t","_r"];

//--- группы с приоритетом
_g = (_this select 0);

//--- в цикле только группы
for "_i" from 0 to ((count (_g select 0)) - 1) do {

	//--- типы юнитов группы
	_t = [_g, [0, _i, 0, 0, 0]] call BIS_fnc_returnNestedElement;

	//--- новые множители
	{ 

		//--- множитель 1, и такое бывает
		if (_x select 1 != 1) then {

			//--- условия для изменений
			if( ([_t, _x select 0] call gosa_fnc_CheckIsKindOfArray) && 
				// FIXME: это что?
				!([_t, ["AllVehicles"], _x select 0] call gosa_fnc_CheckIsKindOfArray) 
			 )then{

				diag_log format ["Log: [fnc_groupsRarity] type %1", _t];

				//--- получаем rarity группы
				_r = ([_g, [1, _i]] call BIS_fnc_returnNestedElement);
				diag_log format ["Log: [fnc_groupsRarity] rarity old %1", _r];

				//--- меняем rarity
				_r = (_r * (_x select 1));

				//--- rarity > 1 не работает с оригинальными функциями
				if (_r > 1) then { // diag_log
					diag_log format ["Log: [fnc_groupsRarity] rarity {%1 > 1} не работает с оригинальными функциями", _r];
				}; // diag_log

				//--- записываем новое rarity для группы
				[_g, [1, _i],  _r] call BIS_fnc_setNestedElement;
				diag_log format ["Log: [fnc_groupsRarity] rarity new %1", ([_g, [1, _i]] call BIS_fnc_returnNestedElement)];
			};
		};
	}forEach (_this select 1);
};
