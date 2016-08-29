waitUntil {!isNil "bis_fnc_init" && !isNil "m_fnc_init"};
waitUntil {!isNil "listCrew" && !isNil "listMHQ"};
waitUntil {!isNil "silvieManagerBlacklist" && !isNil "silvieManagerVehicles"};

// #include "server_update_location.sqf";
private["_east1","_west1","_resistance1"];
_east1 = 0;_west1 = 0;_resistance1 = 0;

private ["_time2","_delay","_time2_select"];
_time2 = [time,time,time,time,time,time,time,time,time,time,time,time,time,time];

while {true} do {
	sleep 5;
	
	_delay = (time - (_time2 select 0)); 
	_time2 set [0,time];
	_time2_select = 1;

	allDead call fnc_cleanup;
	
	if( (_time2 select _time2_select) < time )then{
		_time2 set [_time2_select,time+5+random 5]; _time2_select = _time2_select + 1;
		{
			if(!alive _x)then{
				if (((_x distance getMarkerPos "respawn_guerrila") < 100 ) or ((_x distance getMarkerPos "respawn_civilian") < 100 ) or ((_x distance getMarkerPos "respawn_west") < 100 ) or ((_x distance getMarkerPos "respawn_east") < 100 )) then {
					deleteVehicle _x;
				};
			};
		}forEach vehicles;
	};
	
	if( (_time2 select _time2_select) < time )then{
		_time2 set [_time2_select,time+5+random 5]; _time2_select = _time2_select + 1;
		{
			Private["_veh"];
			_veh=_x;
			if ([[_veh], listMHQ+["Warfare_HQ_base_unfolded"]] call m_fnc_CheckIsKindOfArray) then {
				Private["_coin"];
				_coin = (_veh getvariable "m_COIN_ID");
				if (isNil "_coin") then {
					_veh setvariable ["m_COIN_ID",true]; 
					_veh spawn m_fnc_mobileHQ_init;
				};
			};
		}forEach vehicles+(allMissionObjects "Warfare_HQ_base_unfolded");
	};
		
	// BIS_GC_trashItFunc
	if( (_time2 select _time2_select) < time )then{
		_time2 set [_time2_select,time+30+random 5]; _time2_select = _time2_select + 1;
		#include "server_update_gc.sqf";
	};
		
	// if(true)then{
		// #include "server_update_groups.sqf";
	// };
		
	if( (_time2 select _time2_select) < time )then{
		_time2 set [_time2_select,time+4+random 2]; _time2_select = _time2_select + 1;
		#include "server_update_units.sqf";
	};
		
	if( (_time2 select _time2_select) < time )then{
		_time2 set [_time2_select,time+5+random 5]; _time2_select = _time2_select + 1;
		#include "server_update_vehicles.sqf";
	};
		
	if( (_time2 select _time2_select) < time )then{
		_time2 set [_time2_select,time+30+random 5]; _time2_select = _time2_select + 1;
		#include "server_update_other.sqf";
	};
		
	if(true)then{
		#include "server_update_respawnVehicles.sqf";
	};
		
	if( (_time2 select _time2_select) < time )then{
		_time2 set [_time2_select,time+30+random 5]; _time2_select = _time2_select + 1;
		#include "server_update_silvieManager.sqf";
	};
		
	if(true)then{
		#include "server_update_location.sqf";
	};
};