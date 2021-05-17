private["_oldGroup"];
_oldGroup = group player;
[player] join grpNull;
if (!(leader _oldGroup call gosa_fnc_isPlayer) && !isMultiplayer) then {
	{
		deleteVehicle _x;
	}forEach units _oldGroup;
};
