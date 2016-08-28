private["_crew"];
_crew = "";
{
	_crew=_crew+format["%2: %1; ",name _x, assignedVehicleRole _x];
}forEach (crew vehicle player);
vehicle player vehicleChat _crew;