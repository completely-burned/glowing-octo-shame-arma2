
private["_dragaChangeLagFSM"];

while {true} do {
	sleep 10;

	{
		_dragaChangeLagFSM = _x getVariable "_dragaChangeLagFSM";
		if (isNil "_dragaChangeLagFSM") then {_dragaChangeLagFSM = false};

		if (_dragaChangeLagFSM) then {
			if !([_x, if(isFormationLeader _x)then{800}else{400}] call m_fnc_CheckPlayersDistance) then {
				_x disableAI "FSM";
			}else{
				_x enableAI "FSM";
			};
		};

	} forEach allunits;
};
