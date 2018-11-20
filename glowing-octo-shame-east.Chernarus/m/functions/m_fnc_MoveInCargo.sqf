private ["_cargo","_vehicles"];
_vehicles = _this select 0;
_cargo = _this select 1;
{
	for "_i" from 0 to ((_x emptyPositions "cargo") - 1) do {
		if ((count _cargo) > 0) then {
			( _cargo select 0 ) assignAsCargo _x;
			( _cargo select 0 ) moveInCargo _x;
			_cargo = ( _cargo - [ _cargo select 0 ] );
		};
	};
} foreach _vehicles;
