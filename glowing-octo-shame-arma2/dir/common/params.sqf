
private ["_z"];

if(isMultiplayer)then{
	waitUntil {!isNil "paramsArray"};
	for "_i" from (0) to ((count (missionConfigFile/"Params")) - 1) do {
		missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i),paramsArray select _i];
	};
}else{
	for "_i" from (0) to ((count (missionConfigFile/"Params")) - 1) do {
		missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i),getNumber (((missionConfigFile/"Params") select _i)/"default")];
	};
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
