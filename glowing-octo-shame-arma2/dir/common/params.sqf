
private ["_z","_n","_arr","_str","_str0","_item","_arr0"];

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

_z = missionNamespace getVariable "gosa_respawnVehicles";
	if (_z == -1) then {
		if (missionNamespace getVariable "respawn" == 0) then {
			missionNamespace setVariable ["gosa_respawnVehicles", 1];
		} else {
			missionNamespace setVariable ["gosa_respawnVehicles", 0];
		};
	};

_z = missionNamespace getVariable "gosa_mission";
	if (_z == -1) then {
		missionNamespace setVariable ["gosa_mission", 2];
	} else {
		missionNamespace setVariable ["gosa_mission", 1];
	};

_z = missionNamespace getVariable "gosa_locations";
	if (_z == -1) then {
		missionNamespace setVariable ["gosa_locations", 2];
	} else {
		missionNamespace setVariable ["gosa_locations", 1];
	};

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
		missionNamespace setVariable ["gosa_shop", 1];
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


#ifdef __ARMA3__
_str = "gosa_faction_multiplier_";
_n = 50;

// FIA
_arr = ["BIS_OPF_G_F","BIS_BLU_G_F","BIS_IND_G_F"];
if ({missionNamespace getVariable _str+_x > 0} count _arr <= 0) then {
	_arr0 = [[],[]];
	for "_i" from 0 to 2 do {
		_item = _arr select _i;
		if (missionNamespace getVariable _str+_item >= 0) then {
			_arr0 select 0 set [count (_arr0 select 0), _item];
			// За синих больше отрядов FIA.
			if (_i == 1) then { // BIS_BLU_G_F
				_arr0 select 1 set [count (_arr0 select 1), 1];
			}else{
				_arr0 select 1 set [count (_arr0 select 1), 0.5];
			};
		};
	};
	if (count (_arr0 select 0) > 0) then {
		_str0 = _str + (_arr0 call gosa_fnc_selectRandomWeighted);
		missionNamespace setVariable [_str0, _n];
		diag_log format ["Log: [params] %1 set %2", _str0, _n];
	};
};

#endif

gosa_param_init_done = true;
