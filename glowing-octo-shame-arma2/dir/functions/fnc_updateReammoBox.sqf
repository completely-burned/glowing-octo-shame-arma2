#define __A2OA__
/*
 * Скрипт восстанавливает содержимое ящика.
 * TODO: Необходима защита от переполнения ящиков.
 */

#ifdef __ARMA3__
	// Оптимизация.
	#define toLower toLowerANSI
	// В A3 работает только *Global.
	#define addItemCargo addItemCargoGlobal
	#define addMagazineCargo addMagazineCargoGlobal
	#define addWeaponCargo addWeaponCargoGlobal
	#define addBackpackCargo addBackpackCargoGlobal
#endif

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

	_arr = _box select 0;
	for "_i" from 0 to (count _arr -1) do {
		_arr set [_i, toLower (_arr select _i)];
	};

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
				_num = _count min 3;
				diag_log format ["Log: [fnc_updateReammoBox] %1 addItemCargo %3 %2", _this, _str, _num];
				_this addItemCargo [_str, _num];
			//};
		};
	};
#endif

#ifdef __A2OA__
	//-- Magazine
	_box = getMagazineCargo _this;

	// TODO: Нужна функция.
	_arr = _box select 0;
	for "_i" from 0 to (count _arr -1) do {
		_arr set [_i, toLower (_arr select _i)];
	};

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
				_num = _count min 2;
				diag_log format ["Log: [fnc_updateReammoBox] %1 addMagazineCargo %3 %2", _this, _str, _num];
				_this addMagazineCargo [_str, _num];
			//};
		};
	};


	//-- Weapon
	_box = getWeaponCargo _this;

	_arr = _box select 0;
	for "_i" from 0 to (count _arr -1) do {
		_arr set [_i, toLower (_arr select _i)];
	};

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
				_num = _count min 1;
				diag_log format ["Log: [fnc_updateReammoBox] %1 addWeaponCargo %3 %2", _this, _str, _num];
				_this addWeaponCargo [_str, _num];
			//};
		};
	};


	//-- Backpack
	_box = getBackpackCargo _this;

	_arr = _box select 0;
	for "_i" from 0 to (count _arr -1) do {
		_arr set [_i, toLower (_arr select _i)];
	};

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
				_num = _count min 1;
				diag_log format ["Log: [fnc_updateReammoBox] %1 addBackpackCargo %3 %2", _this, _str, _num];
				_this addBackpackCargo [_str, _num];
			//};
		};
	};
#endif

_this setammocargo 1;
