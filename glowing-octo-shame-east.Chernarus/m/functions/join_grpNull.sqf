private["_oldGroup"];
_oldGroup = group player;
[player] join grpNull;
if (!isPlayer leader _oldGroup && !isMultiplayer) then {
	{
		deleteVehicle _x;
	}forEach units _oldGroup;
};
