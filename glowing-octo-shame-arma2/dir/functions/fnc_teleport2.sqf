/*
 * TODO: Рефакторинг.
 * FIXME: Не работает в A3 и a2oa.
 */
diag_log format ["Log: [fnc_teleport2] %1", _this];

private ["_pos","_allow","_for","_inList","_veh","_obj",
	"_arr","_asl","_allow_veh","_allowed_veh","_zzz",
	"_time_limit","_time_out"];

_obj = _this select 0;
_for = _this select 1;

_allowed_veh = [0];
_time_limit = 5;


_time_out = time + _time_limit;
scopeName "root";

_zzz = [0,0,0];
_asl = false;
_allow = true;
_allow_veh = -1;
switch (typeName _obj) do {
	case ("OBJECT"):
	{
		if (speed _obj >= 2) then {
			_allow = false;
			hint localize "STR_gosa_CannotTeleport";
			breakTo "root";
		}else{
			if (_obj isKindOf "Logic") then {
				_asl = true;
				_pos = getPosASL _obj;
				_allow_veh = _obj getVariable "gosa_teleport_allow_veh";
				if (isNil "_allow_veh") then {
					// На земле.
					if (getposATL _obj select 2 < 2) then {
						diag_log format ["Log: [fnc_teleport2] %1, land", _obj];
						_allow_veh = 0;
						_asl = false;
						_pos = getPos _obj;
					}else{
						_allow_veh = 1;
					};
				};
			}else{
				// Смещение от центра объета.
				_pos = [_obj] call gosa_fnc_respawnPos;
			};
		};
	};
	case ("LOCATION"):
	{
		_pos = getPos _obj;
	};
	case ("STRING"):
	{
		_pos = getMarkerPos _obj;
	};
	default {
		_pos = [_obj] call gosa_fnc_respawnPos;
	};
};

if (_allow) then {
	_for set [count _for, player];
	diag_log format ["Log: [fnc_teleport2] _for %1", _for];
	_inList = [];
	for "_i" from 0 to (count _for -1) do {
		_veh = vehicle (_for select _i);
		if (_for select _i call gosa_fnc_unit_canTeleport) then {
			if !(_veh in _inList) then {
				_inList set [count _inList, _veh];
				if (_for select _i == _veh) then {
					if (_asl) then {
						diag_log format ["Log: [fnc_teleport2] %1, setPosASL", _pos];
						_veh setPosASL _pos;
					}else{
						diag_log format ["Log: [fnc_teleport2] %1, setPos", _pos];
						_veh setPos _pos;
					};
				}else{
					_veh engineOn false;
					if (_allow_veh in _allowed_veh) then {
						if (_asl) then {
							_veh setVelocity _zzz;
							_veh setVectorUp _zzz;
							diag_log format ["Log: [fnc_teleport2] %1, setPosASL", _pos];
							_veh setPosASL _pos;
						}else{
							_arr = [_pos,0, sizeOf typeOf _veh] call gosa_fnc_getSafePos;
							if (time > _time_out) then {
								diag_log format ["Log: [fnc_teleport2] %1, timeout", _veh];
								breakTo "root";
							};
							_veh setVelocity _zzz;
							_veh setVectorUp surfaceNormal _arr;
							diag_log format ["Log: [fnc_teleport2] %1, setPos", _arr];
							_veh setPos _arr;
						};
					};
				};
			};
		}else{
			diag_log format ["Log: [fnc_teleport2] %1, !canTeleport", _veh];
		};
	};
};
