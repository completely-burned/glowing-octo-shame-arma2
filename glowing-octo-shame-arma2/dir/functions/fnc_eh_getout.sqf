// vehicle: Object - Vehicle the event handler is assigned to
// position: String - Can be either "driver", "gunner", "commander" or "cargo"
// unit: Object - Unit that leaved the vehicle

private ["_vehicle","_position","_unit","_driver","_grp","_newGrp","_type"];
_vehicle = _this select 0;
_position = _this select 1;
_unit = _this select 2;
_type = typeOf _vehicle;

diag_log format ["Log: [fnc_eh_getout.sqf] %1 %2", _this, _type];

_driver = driver _vehicle;
_grp = group _unit;

// временная остановка транспорта чтобы не задавить
if(isNil {_driver getVariable "disableAIMove"} && _position != "driver" && _type isKindOf "LandVehicle")then{
	_driver spawn {

		diag_log format ["Log: [fnc_eh_getout.sqf]: %1 disableAIMove, временная остановка транспорта", _this];

		_this setVariable ["disableAIMove", true];
		_this disableAI "Move";
		sleep 10;
		_this enableAI "Move";
		_this setVariable ["disableAIMove", nil];

		diag_log format ["Log: [fnc_eh_getout.sqf]: %1 enableAIMove", _this];
	};
};

// пехота отходит от транспорта

// экипаж подбитой техники выходит из основной группы чтобы не задерживать движение основной группы
// FIXME: лучше реализовать этот функционал в другом месте
if(toLower typeOf _unit in (listCrewLower+listPilotLower) &&
	(!canMove _vehicle or !alive _vehicle) &&
	getnumber(configfile >> "cfgvehicles" >> _type >> "transportSoldier") == 0
 )then{

	diag_log format ["Log: [fnc_eh_getout.sqf]: %1 экипаж подбитой техники выходит из основной группы", _this];

	if({_x call gosa_fnc_isPlayer} count units _grp == 0)then{
		_newGrp = _grp getVariable "grpCrewNew";
		if(isNil {_newGrp})then{
			_newGrp = createGroup side _grp;
			_grp setVariable ["grpCrewNew", _newGrp];
			_newGrp setVariable ["grpCrewOld", _grp];
		};
		[_unit] joinSilent _newGrp;
	};
};
