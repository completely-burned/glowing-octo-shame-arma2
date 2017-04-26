private ["_leader"];
{
	_leader = leader _x;
	// _units = units _x;
	if(!isNull _leader)then{
		If (true) then {
			if(alive _leader)then{
				private ["_behaviour"];
				_behaviour = behaviour _leader;

					private ["_CurrentWaypoint"];
					_CurrentWaypoint = CurrentWaypoint _x;
					private ["_stopped"];
					if(waypointType [_x,_CurrentWaypoint] == "SAD")then{
						_stopped = true;
					}else{
						_stopped=false;
					};
					
					if(waypointAttachedVehicle [_x,0] != _leader)then{
						[_x, 0] waypointAttachVehicle _leader;
						[_x, 0] setWaypointType "SAD";
					};
					if(
					(_behaviour != "COMBAT")
					&& _stopped )then{
						_x setCurrentWaypoint [_x, _CurrentWaypoint+1];
					};
					
					if(
					(_behaviour == "COMBAT")
					&& !(_stopped)
					&& ((civilianBasePos distance _leader)<(sizeLocation*0.75))
					)then{
						_x setCurrentWaypoint [_x, 0];
					};

					// if((civilianBasePos distance _leader)<(250 max(sizeLocation*1.25)))then{
						// if(_behaviour != "COMBAT")then{
							// // [_x, _CurrentWaypoint] setWaypointBehaviour "COMBAT";
							// _x setBehaviour "COMBAT";
						// };
					// }else{
						// if(_behaviour != "AWARE")then{
							// _x setBehaviour "AWARE";
						// };
					// };

			};
		};
	};
	sleep 0.01;
}forEach allGroups;
