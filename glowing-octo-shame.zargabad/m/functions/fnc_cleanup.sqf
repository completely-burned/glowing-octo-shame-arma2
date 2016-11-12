
private ["_count_deleteList"];
_count_deleteList = (count _this);
if (_count_deleteList > 0)then{
	Private["_dist"];
	_dist = ((10000 - (_count_deleteList * 10)) max 1600);// _dist = 1;
	{
		Private["_type"];
		_type = typeOf _x;
		// if(true)then{
		if !([_x, _dist] call m_fnc_CheckPlayersDistance) then {
			if ((getNumber(configFile >> "CfgVehicles" >> _type >> "isMan") == 1) && alive _x) then {
				_x setDammage 1;
				// deleteVehicle _x;
			}else{
				deleteVehicle _x;
			};
		};
	} forEach _this;
};
