private ["_airport","_marker"];

if(_this select 0 isKindOf "Logic")then{
	_airport = nearestBuilding position (_this select 0);
}else{
	_airport = (_this select 0);
};

if(isServer)then{
	_airport allowDammage false;
};
if(!isDedicated)then{
	_marker = createMarkerLocal [(str (_this select 0))+"AirportMarker", getPos _airport];
	_marker setMarkerTypeLocal "Airport";
};
