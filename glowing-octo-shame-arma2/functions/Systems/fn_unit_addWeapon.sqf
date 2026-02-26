private ["_obj","_str","_arr"];

_obj = _this select 0;
_arr = _this select 1;
//_obj = player;
//_arr = ["hgun_esd_01_F", "", "acc_esd_01_flashlight", "", [], [], ""];

_str = _arr select 0;

// TODO: Проверка наличия в инвентаре.

// TODO: Нужно не только для пистолета.
if (handgunWeapon _obj isEqualTo "") exitWith {
	_obj addWeapon [_str, false];
	for "_i" from 1 to 3 do {
		if (_arr select _i isNotEqualTo "") then {
			_obj addHandgunItem (_arr select _i);
		};
	};
};

{
	if !(isNull _x) exitWith {
		// TODO: Проверка свободного места.
		_x addWeaponWithAttachmentsCargoGlobal [_arr, 1];
	};
} forEach [backpackContainer _obj, vestContainer _obj, uniformContainer _obj];
