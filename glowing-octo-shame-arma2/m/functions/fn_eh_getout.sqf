// vehicle: Object - Vehicle the event handler is assigned to
// position: String - Can be either "driver", "gunner", "commander" or "cargo"
// unit: Object - Unit that leaved the vehicle

if (draga_loglevel > 0) then {
	diag_log format ["fn_eh_getout.sqf: %1", _this];
};

private ["_vehicle","_position","_unit"];
_vehicle = _this select 0;
_position = _this select 1;
_unit = _this select 2;

private ["_driver","_grp"];
_driver = driver _vehicle;
_grp = group _unit;

// временная остановка транспорта
if(isNil {_driver getVariable "disableAIMove"} && _position != "driver")then{
	_driver spawn {

		if (draga_loglevel > 0) then {
			diag_log format ["fn_eh_getout.sqf: disableAIMove %1", _this];
		};

		_this setVariable ["disableAIMove", true];
		_this disableAI "Move";
		sleep 10;
		_this enableAI "Move";
		_this setVariable ["disableAIMove", nil];

		if (draga_loglevel > 0) then {
			diag_log format ["fn_eh_getout.sqf: enableAIMove %1", _this];
		};
	};
};

// пехота отходит от транспорта

// экипаж раздельно
if(toLower typeOf _unit in (listCrewLower+listPilotLower) && (!canMove _vehicle or !alive _vehicle))then{

	if (draga_loglevel > 0) then {
		diag_log format ["fn_eh_getout.sqf: crew %1", _this];
	};

	if({isPlayer _x} count units _grp == 0)then{
		private ["_newGrp"];
		_newGrp = _grp getVariable "grpCrewNew";
		if(isNil {_newGrp})then{
			_newGrp = createGroup side _grp;
			_grp setVariable ["grpCrewNew", _newGrp];
			_newGrp setVariable ["grpCrewOld", _grp];
		};
		[_unit] joinSilent _newGrp;
	};
};
