#define __A2OA__

/*
 * Функция отсеивает неподходящие тела для перерождения.
 */

private ["_n","_b","_t_om","_t_bl","_weapon","_veh","_str","_arr"];

// timeout за пределами карты.
_t_om = 25;
// timeout временного чёрного списка.
_t_bl = 10;

if !(side _this in gosa_friendlyside) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, Не дружественная сторона", _this];
	false;
};

if (isNull _this) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1", _this];
	false;
};

if !(isNil{_this getVariable "selectPlayerDisable"}) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, var selectPlayerDisable", _this];
	false;
};

if (_this call gosa_fnc_isPlayer) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, isPlayer", _this];
	false;
};

if !(alive _this) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, not alive", _this];
	false;
};

if (damage _this >= 0.9) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, damage", _this];
	false;
};

if (_this call gosa_fnc_isUAV) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, isUAV", _this];
	false;
};

if (isNil{group _this getVariable "grp_created"}) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, group not completed", _this];
	false;
};


_b = false;

/*
// TODO: Перед включением этого кода необходимо сделать генератор отказоустойчивых отрядов.
#ifdef __ARMA3__
		_weapon = primaryWeapon _this;
		if !(getAssetDLCInfo _weapon select 1) then {
			diag_log format ["Log: [fnc_selectPlayer_isFit] %1, not owned %1", _this, _weapon];
			_b = true;
		};
	_veh = _this call gosa_fnc_assignedVeh;
	if !(isNull _veh) then {
		if !(getAssetDLCInfo _veh select 1) then {
			_arr = assignedVehicleRole _this;
			if (count _arr > 0) then {
				if (toLowerANSI (_arr select 0) in ["driver","gunner","commander","turret"]) then {
					diag_log format ["Log: [fnc_selectPlayer_isFit] %1, not owned %1", _this, _veh];
					_b = true;
				};
			};
		};
	};

	if (_b) exitWith {
		false;
	};
#endif
*/

if (isNil "gosa_player_needs_revival") then {
	_b = true;
}else{
	_n = gosa_player_needs_revival;
	if (_n + _t_om > time) then {
		_b = true;
	};
};

if (_b) then {
	if (_this call gosa_fnc_withinMap) then {
		_b = false;
	};
};

if (_b) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, out of map", _this];
	false;
};


// TODO: Улучшить переключение на далёкий патруль.
if (vehicle _this distance civilianBasePos > (safeSpawnDistance select 1)) then {
	if !(isNil {group _this getVariable "patrol"}) then {
		_b = true;
	};
};

if (_b) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, patrol", _this];
	false;
};


#ifndef __A2OA__
// v1.11 Не передает управление игроку если юнит не локальный.
if !(local _this) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, not local", _this];
	false;
};
#endif



// черный список временный
_n = _this getVariable "gosa_respawn_blt";
if !(isNil "_n") then {
	if (_n + _t_bl < time) then {
		_this setVariable ["gosa_respawn_blt", nil];
	} else {
		_b = true;
	};
};

if (_b) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, временно в чёрном списке", _this];
	false;
};

// TODO: Нужно реализовать десант с игроками тоже.
if (group _this != group player) then {
	if (vehicle _this isKindOf "StaticWeapon") exitWith {
		_b = true;
	};

	if (vehicle _this isKindOf "Air") exitWith {
		_b = true;
	};

	if (vehicle _this isKindOf "Ship") exitWith {
		_b = true;
	};
};

if (_b) exitWith {
	diag_log format ["Log: [fnc_selectPlayer_isFit] %1, isKindOf", _this];
	false;
};

true;
