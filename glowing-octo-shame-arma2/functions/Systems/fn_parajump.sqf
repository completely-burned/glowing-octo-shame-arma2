/*---------------------------------------------------------------------------
десантирование
TODO: командира нужно помещать в центр или последним
---------------------------------------------------------------------------*/

diag_log format ["Log: [fnc_paraJump] #landing %1", _this];

private["_v","_u","_n","_d"];
_d = 30;
for "_i" from count _this -1 to 0 step -1 do {
	_u = _this select _i;
	_v = vehicle _u;

	if (_v isKindOf "Plane" && !(_v isKindOf "ParachuteBase")) then {
		diag_log format ["Log: [fnc_paraJump] #landing выгрузка %1", [_u, _v, assignedVehicleRole _u]];

		_u action ["Eject", _v];

		_n = (speed _v / 3.6);
		#ifdef __ARMA3__
			//_n = 3.6 * (velocityModelSpace _v select 1);
			sleep (_d/_n)*0.2;
			// Некоторые не прыгают.
			moveOut _u;
			sleep (_d/_n)*0.8;
		#else
			sleep (_d/_n);
		#endif

		#ifdef __ARMA3__
			[_u] call gosa_fnc_unit_addParachute;
		#endif

		// отвязка от самолета, чтобы не лезть в него обратно
		unassignVehicle _u;
		_u leaveVehicle _v;
	};
};
