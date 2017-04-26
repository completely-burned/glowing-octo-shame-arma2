private["_oldGroup"];
_oldGroup = group player;
[player] join createGroup playerSide;
if (!isPlayer leader _oldGroup) then {
	{
		deleteVehicle _x;
	}forEach units _oldGroup;
};
