#define __A2OA__
/*
 * Скрипт восстанавливает содержимое ящика.
 * TODO: Исправить проверку на переполнение.
 */

private ["_Magazines","_box","_item","_entry",
	"_count","_arr","_num","_str","_type","_cfgVeh"];

_cfgVeh = LIB_cfgVeh;
_type = typeOf _this;
_entry = _cfgVeh >> _type;

if (isnil {_this getVariable "gosa_megaAmmoBox"}) then {
	_Magazines = (_type call gosa_fnc_ReammoBox);
}else{
	_Magazines = ([] call gosa_fnc_megaAmmoBox);
};

#ifdef __ARMA3__
	//-- Items
	_box = getItemCargo _this;

	_arr = [];
	for "_i" from 0 to (count (_box select 0) - 1) do {
		_arr set [_i, toLower (_box select 0 select _i)];
	};
	_box set [0, _arr];

	_arr = _Magazines select 3;
	for "_i" from 0 to (count _arr - 1) do {
		_item = _arr select _i;
		_str = toLower (_item select 0);
		_count = _item select 1;
		_num = (_box select 0) find _str;
		if (_num >= 0) then {
			_count = (_count - ((_box select 1) select _num));
		};
		if (_count > 0) then {
			//_num = getNumber (_entry >> "transportMaxItems");
			//if (count (_box select 0) < _num) then {
				_this addItemCargo [_str, _count min 3];
			//};
		};
	};
#endif

#ifdef __A2OA__
	//-- Magazine
	_box = getMagazineCargo _this;

	// TODO: Нужна функция.
	_arr = [];
	for "_i" from 0 to (count (_box select 0) - 1) do {
		_arr set [_i, toLower (_box select 0 select _i)];
	};
	_box set [0, _arr];

	_arr = _Magazines select 0;
	for "_i" from 0 to (count _arr - 1) do {
		_item = _arr select _i;
		_str = toLower (_item select 0);
		_count = _item select 1;
		_num = (_box select 0) find _str;
		if (_num >= 0) then {
			_count = (_count - ((_box select 1) select _num));
		};
		if (_count > 0) then {
			//_num = getNumber (_entry >> "transportMaxMagazines");
			//if (count (_box select 0) < _num) then {
				_this addMagazineCargo [_str, _count min 2];
			//};
		};
	};


	//-- Weapon
	_box = getWeaponCargo _this;

	_arr = [];
	for "_i" from 0 to (count (_box select 0) - 1) do {
		_arr set [_i, toLower (_box select 0 select _i)];
	};
	_box set [0, _arr];

	_arr = _Magazines select 1;
	for "_i" from 0 to (count _arr - 1) do {
		_item = _arr select _i;
		_str = toLower (_item select 0);
		_count = _item select 1;
		_num = (_box select 0) find _str;
		if (_num >= 0) then {
			_count = (_count - ((_box select 1) select _num));
		};
		if (_count > 0) then {
			//_num = getNumber (_entry >> "transportMaxWeapons");
			//if (count (_box select 0) < _num) then {
				_this addWeaponCargo [_str, _count min 1];
			//};
		};
	};


	//-- Backpack
	_box = getBackpackCargo _this;

	_arr = [];
	for "_i" from 0 to (count (_box select 0) - 1) do {
		_arr set [_i, toLower (_box select 0 select _i)];
	};
	_box set [0, _arr];

	_arr = _Magazines select 2;
	for "_i" from 0 to (count _arr - 1) do {
		_item = _arr select _i;
		_str = toLower (_item select 0);
		_count = _item select 1;
		_num = (_box select 0) find _str;
		if (_num >= 0) then {
			_count = (_count - ((_box select 1) select _num));
		};
		if (_count > 0) then {
			//_num = getNumber (_entry >> "transportMaxBackpacks");
			//if (count (_box select 0) < _num) then {
				_this addBackpackCargo [_str, _count min 1];
			//};
		};
	};
#endif

_this setammocargo 1;
