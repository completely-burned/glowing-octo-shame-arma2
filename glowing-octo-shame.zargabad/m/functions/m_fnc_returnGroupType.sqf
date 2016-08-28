private ["_grp","_cars","_apcs","_tanks","_helis","_planes","_boats","_type","_uavs","_Vehicles","_support_reammo","_support_repair","_support_refuel","_support_medic","_support","_canfloat","_canfloat0count","_preferRoads"];

//_grp = _this;;
_grp = _this select 0;
private["_Vehicles"];
_Vehicles=[];
//_Vehicles = [_grp] call m_fnc_returnGroupVehicleType;
	if((typeName _grp) == "CONFIG")then{
		for "_i" from 0 to ((count _grp) - 1) do 
		{
		//sleep 0.01;
			private ["_item"];
			_item = (_grp select _i);
			
			if (isClass _item) then 
			{
				_Vehicles = _Vehicles + [getText(_item >> "vehicle")];
			};
		};
	}else
	{
	//if((typeName _grp) == "ARRAY")then{
		_Vehicles=(_grp select 0);
	};

// _vehlist = [];
_cars = 0;
_apcs = 0;
_tanks = 0;
_helis = 0;
_planes = 0;
_uavs = 0;
_boats = 0;
// _artys = 0;
// _mortars = 0;
private ["_support_reammo","_support_repair","_support_refuel","_support_medic","_support"];
_support_reammo = 0;
_support_repair = 0;
_support_refuel = 0;
_support_medic = 0;
_support = 0;
private ["_canfloat"];
_canfloat = 0;
private ["_canfloat0count"];
		_canfloat0count = count _Vehicles;
{
	// if (!canstand vehicle _x && alive vehicle _x && !(vehicle _x in _vehlist)) then {
private ["_veh"];
		_veh =  _x;
		//_vehlist = _vehlist + [_veh];
private ["_transportSoldier"];
		_transportSoldier = getnumber(configfile >> "cfgvehicles" >> _veh >> "transportSoldier");

		//--- Vehicle is Car
		if (_veh iskindof "car" || _veh iskindof "wheeled_apc") then {_cars = _cars + 1};

		//--- Vehicle is Tank
		if (_veh iskindof "tank") then {_tanks = _tanks + 1};

		//--- Vehicle is APC
		if (_veh iskindof "tracked_apc") then {_apcs = _apcs + 1};
/*
		if (_veh iskindof "tank") then {
			if (getnumber(configfile >> "cfgvehicles" >>  _veh >> "transportSoldier") > 0) then {

				//--- Armored transport
				_apcs = _apcs + 1;
			} else {

				//--- Armored tank
				_tanks = _tanks + 1;
			};
		};
*/

		//--- Vehicle is Helicopter
		if (_veh iskindof "helicopter") then {_helis = _helis + 1};

		//--- Vehicle is Plane
		if (_veh iskindof "plane") then {
			if (_veh iskindof "uav") then {

				//--- UAV
				_uavs = _uavs + 1
			} else {

				//--- Plane
				_planes = _planes + 1
			};
		};

		//--- Vehicle is Artillery
		//if (_veh iskindof "staticcanon") then {_artys = _artys + 1};

		//--- Vehicle is Mortar
		//if (_veh iskindof "staticmortar") then {_mortars = _mortars + 1};

		//--- Vehicle is Boat
		//if (_veh iskindof "boat") then {_boats = _boats + 1};

		//--- Vehicle is support
private ["_canHeal","_canReammo","_canRefuel","_canRepair"];
		_canHeal = getnumber (configfile >> "cfgvehicles" >>  _veh >> "attendant") > 0;
		_canReammo = getnumber (configfile >> "cfgvehicles" >>  _veh >> "transportAmmo") > 0;
		_canRefuel = getnumber (configfile >> "cfgvehicles" >>  _veh >> "transportFuel") > 0;
		_canRepair = getnumber (configfile >> "cfgvehicles" >>  _veh >> "transportRepair") > 0;
		if (_canHeal) then {_support_medic = _support_medic + 1};
		if (_canReammo) then {_support_reammo = _support_reammo + 1};
		if (_canRefuel) then {_support_refuel = _support_refuel + 1};
		if (_canRepair) then {_support_repair = _support_repair + 1};
		
		_preferRoads = getnumber (configfile >> "cfgvehicles" >>  _veh >> "preferRoads") > 0;
	
        //4245t2454ty45t
		if (getnumber(configfile >> "cfgvehicles" >>  _veh >> "canfloat") == 1) then {
			_canfloat0count = (_canfloat0count - 1 - _transportSoldier);
			if (_canfloat0count <= 0) then {
			 _canfloat = _canfloat +1;
			};
		};
	// };
} foreach _Vehicles;

_type = ["inf"];
if (_cars >= 1) then {_type = _type+["motor_inf"]};
if (_apcs >= 1) then {_type = _type+["mech_inf"]};
if (_tanks >= 1) then {_type = _type+["armor"]};
if (_helis >= 1) then {_type = _type+["air"]};
if (_planes >= 1) then {_type = _type+["plane"]};
if (_uavs >= 1) then {_type = _type+["uav"]};
if (_canfloat >= 1) then {_type = _type+["canfloat"]};
if (_preferRoads >= 1) then {_type = _type+["preferRoads"]};
// if (_artys >= 1) then {_type = _type+["art"]};
// if (_mortars >= 1) then {_type = _type+["mortar"]};
if (_support_repair >= 1) then {_type = _type+["maint"]};
if (_support_medic >= 1) then {_type = _type+["med"]};
if ((_support_medic + _support_reammo + _support_refuel + _support_repair) > 1) then {_type = _type+["support"]};
// if (_boats >= 1) then {_type = ["boat"]};
_type;