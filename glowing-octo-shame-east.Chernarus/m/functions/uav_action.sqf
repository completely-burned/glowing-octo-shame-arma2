private["_arguments","_list","_list2"];
_arguments = _this select 3;
draga_uavs=[];
_list=[];
_list2=[];
{
	if ((vehicle _x iskindof "uav") && alive vehicle _x && playerSide == side _x) then {
		draga_uavs set [count draga_uavs, [player,_x,nil,_arguments]];
		_list2 set [count _list2, getText (configFile >> "CfgVehicles" >> typeOf vehicle _x >> "displayName")];
		_list set [count _list, count _list];
	};
} foreach vehicles;

["uav", "uav", [_list,_list2], "","if(getnumber (configfile >> 'cfgvehicles' >> typeof (draga_uavs select %1 select 0) >> 'isUav') == 1)then{draga_uavs select %1 execVM 'm\uav\uav_heli_interface.sqf';}else{draga_uavs select %1 execVM 'm\uav\uav_interface.sqf';};"] call BIS_FNC_createmenu;
showCommandingMenu "#USER:uav_0";
