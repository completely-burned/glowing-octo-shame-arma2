/*---------------------------------------------------------------------------
десантирование
TODO: командира нужно помещать в центр или последним
---------------------------------------------------------------------------*/

diag_log format ["Log: [fnc_paraJump] #landing %1", _this];

private["_v","_u"];

for "_i" from count _this -1 to 0 step -1 do {
	_u = _this select _i;
	_v = vehicle _u;

	if (_v isKindOf "Plane" && !(_v isKindOf "ParachuteBase")) then {

		diag_log format ["Log: [fnc_paraJump] #landing выгрузка %1", [_u, _v, assignedVehicleRole _u]];

		_u action ["Eject", _v];

		// TODO: нужно учитывать скорость
		sleep 0.5; 

		// отвязка от самолета, чтобы не лезть в него обратно
		unassignVehicle _u;
		_u leaveVehicle _v;
	};
};
