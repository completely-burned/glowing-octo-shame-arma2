/*
Меняет приоритеты.
Функция ничего не возвращает.
Можно делать копию перед изменением.
Примеры:
	_orig = [ [["Man"],2], [["Car","Motorcycle"],0.5], [["StaticWeapon"],0] ];
	_mod = +_orig;
	_mod call fnc;
*/

diag_log format ["Log: [fnc_groupsRarity] %1", _this select 1];

private["_g","_t","_r","_class_param","_class_cfg","_fnc_change",
	"_rarity_param"];

_fnc_change = {
	//--- получаем rarity группы
	_r = ([_g, [1, _i]] call BIS_fnc_returnNestedElement);
	diag_log format ["Log: [fnc_groupsRarity] rarity old %1 %2", _r, [_g, [0, _i, 0, 0, 0]] call BIS_fnc_returnNestedElement];

	//--- меняем rarity
	_r = (_r * _rarity_param);

	//--- rarity > 1 не работает с оригинальными функциями // diag_log
	if (_r > 1) then { // diag_log
		diag_log format ["Log: [fnc_groupsRarity] rarity {%1 > 1} не работает с оригинальными функциями", _r];
	}; // diag_log

	//--- записываем новое rarity для группы
	[_g, [1, _i],  _r] call BIS_fnc_setNestedElement;
	diag_log format ["Log: [fnc_groupsRarity] rarity new %1 %2", ([_g, [1, _i]] call BIS_fnc_returnNestedElement), [_g, [0, _i, 0, 0, 0]] call BIS_fnc_returnNestedElement];
};

//--- Группы.
_g = (_this select 0);

for "_i" from 0 to ((count (_g select 0)) - 1) do {
	//--- типы юнитов группы
	_t = [_g, [0, _i, 0, 0, 0]] call BIS_fnc_returnNestedElement;
	diag_log format ["Log: [fnc_groupsRarity] type %1", _t];

	{
		scopeName "scope1";
		//--- Множитель.
		_rarity_param = (_x select 1);
		if (_rarity_param != 1) then {

			//-- Классы которые нужно изменить.
			_class_param = (_x select 0);
			//-- Получаем имеющиеся классы из списка юнитов групп.
			_class_cfg = (_t call gosa_fnc_getGroupType);

			// Для пехоты нужно исключить транспорт.
			if ("Man" in _class_param) then {
				if ({_x in
					["Tank","Car","Ship","StaticWeapon","LandVehicle","Air"]}
					count _class_cfg == 0) then
				{
					call _fnc_change;
					breakTo "scope1";
				};
			};

			if ({_x in _class_cfg} count _class_param > 0) then {
				call _fnc_change;
				breakTo "scope1";
			};

			diag_log format ["Log: [fnc_groupsRarity] без изменений %1", _t];
		};
	}forEach (_this select 1);
};
