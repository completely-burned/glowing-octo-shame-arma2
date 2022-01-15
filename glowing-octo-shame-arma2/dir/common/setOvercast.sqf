if (isServer) then {
	var_server_Overcast = missionNamespace getVariable "gosa_Overcast";
	publicVariable "var_server_Overcast";
}else{
	waitUntil {!isNil {var_server_Overcast}};
};

if (var_server_Overcast != -1) then {
	0 setOvercast var_server_Overcast;
};
