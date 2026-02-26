private ["_obj","_str","_arr","_cfgWea","_n","_str0","_arr0","_hmd"];
scopeName "root";

_obj = _this select 0;
_arr = _this select 1;
//_obj = player;
//_arr = ["hgun_esd_01_F", "", "acc_esd_01_flashlight", "", [], [], ""];

_str = _arr select 0;
_cfgWea = LIB_cfgWea;
if (configName (_cfgWea >> _str) isNotEqualTo "") then {
	_str0 = toLower _str;

	_hmd = hmd _obj;
	if (toLower _hmd isEqualTo _str0) exitWith {
		diag_log format ["Log: [fn_unit_addWeapon] Есть в инвентаре, %1", _this];
	};
	_arr0 = weapons _obj;
	_arr0 append items _obj;
	for "_i" from 0 to (count _arr0 -1) do {
		if (toLower (_arr0 select _i) isEqualTo _str0) exitWith {
			diag_log format ["Log: [fn_unit_addWeapon] Есть в инвентаре, %1", _this];
			breakTo "root";
		};
	};


	_n = getNumber(_cfgWea >> _str >> "type");
	if (_n isEqualTo 4096) then {
		if (_hmd isEqualTo "") exitWith {
			diag_log format ["Log: [fn_unit_addWeapon] %1 linkItem %2", _obj, _str];
			_obj linkItem _str;
			breakTo "root";
		};
	};
	if (_n isEqualTo 2) then {
		if (handgunWeapon _obj isEqualTo "") exitWith {
			diag_log format ["Log: [fn_unit_addWeapon] %1 addWeapon %2", _obj, _str];
			_obj addWeapon [_str, false];
			for "_i" from 1 to 3 do {
				if (_arr select _i isNotEqualTo "") then {
					diag_log format ["Log: [fn_unit_addWeapon] %1 addHandgunItem %2", _obj, (_arr select _i)];
					_obj addHandgunItem (_arr select _i);
				};
			};
		};
	};

	{
		if !(isNull _x) exitWith {
			// TODO: Проверка свободного места.
			diag_log format ["Log: [fn_unit_addWeapon] %1 addWeaponWithAttachmentsCargoGlobal", _obj];
			_x addWeaponWithAttachmentsCargoGlobal [_arr, 1];
		};
	} forEach [backpackContainer _obj, vestContainer _obj, uniformContainer _obj];
};
