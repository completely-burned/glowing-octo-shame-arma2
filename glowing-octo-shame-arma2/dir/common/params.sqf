
private ["_z"];

if(isMultiplayer)then{
	waitUntil {!isNil "paramsArray"};
};

for "_i" from (0) to ((count (missionConfigFile/"Params")) - 1) do {
	_z = configName ((missionConfigFile/"Params") select _i);
	#ifdef __ARMA3__
		// TODO: нужно без костылей
		_z = [_z, _z call BIS_fnc_getParamValue];
		diag_log format ["Log: [params] %1", _z];
		_z = format ["%1 = %2", _z select 0, _z select 1];
		diag_log format ["Log: [params] %1", _z];
		call compile _z;
	#else
		if(isMultiplayer)then{
			missionNamespace setVariable [_z, paramsArray select _i];
		}else{
			missionNamespace setVariable [_z, getNumber (((missionConfigFile/"Params") select _i)/"default")];
		};
	#endif
};

missionNamespace setVariable ["enemyCoefficient", (missionNamespace getVariable "enemyCoefficient") / 100];

_z = missionNamespace getVariable "gosa_MHQ";
	if (_z == -1) then {
		if (missionNamespace getVariable "respawn" == 0) then {
			missionNamespace setVariable ["gosa_MHQ", 1];
		} else {
			missionNamespace setVariable ["gosa_MHQ", 0];
		};
	};

_z = missionNamespace getVariable "gosa_shop";
	if (_z == -1) then {
		if (
			missionNamespace getVariable "respawn" == 0 or
			missionNamespace getVariable "gosa_MHQ" == 1
		 ) then {
			missionNamespace setVariable ["gosa_shop", 1];
		} else {
			missionNamespace setVariable ["gosa_shop", 0];
		};
	};

_z = missionNamespace getVariable "gosa_locationType";
	if (_z == -1) then {
		if (toLower worldName in ["bootcamp_acr","provinggrounds_pmc"]) then {
			missionNamespace setVariable ["gosa_locationType", 0];
		} else {
			missionNamespace setVariable ["gosa_locationType", 1];
		};
	};

_z = missionNamespace getVariable "gosa_MartaManager";
	if (_z == -1 && gosa_loglevel > 0) then {
			missionNamespace setVariable ["gosa_MartaManager", 1];
	};
