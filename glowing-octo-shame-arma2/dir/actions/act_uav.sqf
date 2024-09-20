private["_arguments","_list","_list2"];
_arguments = _this select 3;
gosa_uavs=[];
_list=[];
_list2=[];
{
	if ((vehicle _x iskindof "uav") && alive vehicle _x && gosa_playerSide == side _x) then {
		gosa_uavs set [count gosa_uavs, [player,_x,nil,_arguments]];
		_list2 set [count _list2, getText (configFile >> "CfgVehicles" >> typeOf vehicle _x >> "displayName")];
		_list set [count _list, count _list];
	};
} foreach vehicles;

["uav", "uav", [_list,_list2], "","if(getnumber (configfile >> 'cfgvehicles' >> typeof (gosa_uavs select %1 select 0) >> 'isUav') == 1)then{gosa_uavs select %1 execVM 'dir\uav\uav_heli_interface.sqf';}else{gosa_uavs select %1 execVM 'dir\uav\uav_interface.sqf';};"] call BIS_FNC_createmenu;
showCommandingMenu "#USER:uav_0";
