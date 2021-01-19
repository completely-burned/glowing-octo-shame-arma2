private["_oldGroup"];
_oldGroup = group player;
[player] join grpNull;
if (!(leader _oldGroup call fnc_isPlayer) && !isMultiplayer) then {
	{
		deleteVehicle _x;
	}forEach units _oldGroup;
};
