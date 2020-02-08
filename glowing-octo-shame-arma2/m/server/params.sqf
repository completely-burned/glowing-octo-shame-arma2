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

