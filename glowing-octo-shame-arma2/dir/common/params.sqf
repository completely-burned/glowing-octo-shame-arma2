
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

_z = missionNamespace getVariable "gosa_locationType";
	if (_z == -1) then {
		if (toLower worldName in ["Bootcamp_ACR","ProvingGrounds_PMC"]) then {
			missionNamespace setVariable ["gosa_locationType", 0];
		} else {
			missionNamespace setVariable ["gosa_locationType", 1];
		};
	};
