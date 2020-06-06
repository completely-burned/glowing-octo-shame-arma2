private ["_overcast"];
_overcast = missionNamespace getVariable "Overcast";

if (_overcast != -1) then {
	0 setOvercast _overcast;
};
