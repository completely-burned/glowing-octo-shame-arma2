/*
функция проверяет позицию на самом деле
а не ищет как может показаться из названия
и возвращает суммарную цену союзных юнитов
в радиусе от центра
*/

diag_log format ["Log: [fnc_find_AA_pos] #AA %1", _this];

private["_side","_pos","_list","_cost","_radius","_arr"];
_side = _this select 0;
_pos = _this select 1;
if (typeName _pos == typeName objNull) then {
	_pos = getPos _pos;
//} else {
};
if (count _pos < 2) exitWith {
	diag_log format ["Log: [fnc_find_AA_pos] #AA _pos %1", _pos];
	0;
};
if (_pos select 0 == 0 && _pos select 1 == 0) exitWith {
	diag_log format ["Log: [fnc_find_AA_pos] #AA _pos %1", _pos];
	0;
};
// сфера
_pos resize 2; 
_radius = _this select 2;

//--- ищем союзные наземные юниты находящиеся рядом с предполагаемой позицией
#ifdef __ARMA3__
_arr = [];
#endif
_list = _pos nearEntities [["Land"],_radius];
for "_i" from 0 to (count _list - 1) do {
	// подсчитывать нужно союзников
	if (_side getFriend side (_list select _i) >= 0.6) then {
		// затрагиваем только технику, боты вне техники не нуждается в особом подсчёте
		if (getNumber(configFile >> "CfgVehicles" >> typeOf (_list select _i) >> "isMan") != 1) then {
			if (alive effectiveCommander (_list select _i)) then {
			#ifdef __ARMA3__
				_arr pushBack (_list select _i);
				// нужно подчитывать людей в технике
				_arr append crew (_list select _i);
			#else
				_list = _list+crew(_list select _i);
			}else{
				// в защите пво не нуждается техника без экипажа
				_list set [_i, -1];
			#endif
			};
		};
	#ifndef __ARMA3__
	}else{
		//--- не являются союзниками
		_list set [_i, -1]; 
	#endif
	};
};

#ifdef __ARMA3__
_list = _arr;
#else
_list = (_list - [-1]);
#endif

// TODO: Использовать внешний глобальный список типов.
//--- приоритеты
_cost = 0;
{
	if ([[_x], ["Tank","Wheeled_APC"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call gosa_fnc_CheckIsKindOfArray) then {
		_cost = _cost + 2;
	};
	if ([[_x], ["LandVehicle"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call gosa_fnc_CheckIsKindOfArray) then {
		_cost = _cost + 1;
	};
	if ([[_x], ["Land","Man"], ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1","Ural_ZU23_Base"]] call gosa_fnc_CheckIsKindOfArray) then {
		_cost = _cost + 0.25;
	};
} forEach _list;

diag_log format ["Log: [fnc_find_AA_pos] #AA cost %1 %2", _cost, _list];

_cost;
