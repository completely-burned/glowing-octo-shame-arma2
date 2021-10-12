/*---------------------------------------------------------------------------
десантирование
TODO: командира нужно помещать в центр или последним
---------------------------------------------------------------------------*/

diag_log format ["Log: [fnc_paraJump] #landing %1", _this];

private["_v"];

{
	_v = vehicle _x;

	if (_v isKindOf "Plane" && !(_v isKindOf "ParachuteBase")) then {

		diag_log format ["Log: [fnc_paraJump] #landing выгрузка %1", [_x, _v, assignedVehicleRole _x]];

		_x action ["Eject", _v];

		sleep 0.5; // TODO: нужно учитывать скорость

		// отвязка от самолета, чтобы не лезть в него обратно
		unassignVehicle _x;
		_x leaveVehicle _v;
	};
} forEach _this;
