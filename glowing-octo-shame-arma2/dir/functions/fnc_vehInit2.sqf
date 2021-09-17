private["_gosa_init"];
_gosa_init = (_this getVariable "_gosa_init");
if (isNil "_gosa_init") then {
	if (getNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isMan") == 1) then {

		if (isNil {_this getVariable "BIS_BC_carrier"}) then {_this setVariable ["BIS_BC_carrier",false];};
		if (isNil {_this getVariable "BIS_BC_dragger"}) then {_this setVariable ["BIS_BC_dragger",false];};
		if (isNil {_this getVariable "BIS_IS_inAgony"}) then {_this setVariable ["BIS_IS_inAgony",false];};

		//if(isPlayer _this or _this in playableUnits)then{
			//if (local _this) then {
				//_this addEventHandler ["handledamage", {_this call m_FirstAid_handleDamage}];
				//_this addEventHandler ["handleheal", {_this spawn m_FirstAid_handleHeal}];
			//};
		//};
	}else{
		if (local _this) then {
			//_this addEventHandler ["HandleDamage", {_this call gosa_fnc_vehicleHandleDamage}];
		};
		if (isServer) then {
			_this addEventHandler ["GetIn", {
				[_this select 2] allowGetin true;
			}];
			_this addEventHandler ["GetOut", {
				_this spawn gosa_fnc_eh_getout;
			}];
		};
	};
	_this setVehicleLock "UNLOCKED";
	_this setVariable ["_gosa_init",true,false];
};
