/*
TODO: Рефакторинг.

_this select 0 = _object.
_this select 1 = Тип запуска, для отладки.
*/

private["_gosa_init","_o"];
_o = (_this select 0);
_gosa_init = (_o getVariable "_gosa_init");
diag_log format ["Log: [fnc_vehInit2] %1, var %2", _this, _o getVariable "_gosa_init"];
if (isNil "_gosa_init") then {

	_o addEventHandler ["killed", {_this spawn gosa_fnc_eh_killed}];

	if (getNumber(configFile >> "CfgVehicles" >> typeOf _o >> "isMan") == 1) then {

		#ifdef __ARMA3__
			_o addEventHandler ["HandleDamage", {call gosa_fnc_eh_HandleDamage}];
		#else
			if (isNil {_o getVariable "BIS_BC_carrier"}) then {_o setVariable ["BIS_BC_carrier",false];};
			if (isNil {_o getVariable "BIS_BC_dragger"}) then {_o setVariable ["BIS_BC_dragger",false];};
			if (isNil {_o getVariable "BIS_IS_inAgony"}) then {_o setVariable ["BIS_IS_inAgony",false];};
		#endif

		//if(isPlayer _o or _o in playableUnits)then{
			//if (local _o) then {
				//_o addEventHandler ["handledamage", {_this call m_FirstAid_handleDamage}];
				//_o addEventHandler ["handleheal", {_this spawn m_FirstAid_handleHeal}];
			//};
		//};
	}else{
		if (local _o) then {
			//_o addEventHandler ["HandleDamage", {_this call gosa_fnc_vehicleHandleDamage}];
		};
		if (isServer) then {
			_o addEventHandler ["GetIn", {
				_this spawn {[_this select 2] allowGetin true};
			}];
			_o addEventHandler ["GetOut", {
				_this spawn gosa_fnc_eh_getout;
			}];
		};
	};
	_o setVehicleLock "UNLOCKED";
	_o setVariable ["_gosa_init",true,false];
	_o allowDamage true;
	_o enableSimulation true;
	#ifdef __ARMA3__
		_o setObjectScale 1;
		// Отказоустойчивость
		[_o, true] remoteExec ["allowDamage"];
		[_o, 1] remoteExec ["setObjectScale"];
		[_o, true] remoteExec ["enableSimulation"];
	#endif
};
