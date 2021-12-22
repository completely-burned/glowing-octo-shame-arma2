private ["_unit","_type","_tWeap","_r","_z","_veh","_t_veh"];

_unit = _this select 0;

_type = typeOf _unit;

//_tWeap = "";

_r = [];

_veh = vehicle _unit;

if (_veh != _unit) then {

	_t_veh = typeOf _veh;

	// TODO: для техники нужен другой метод

	_z = 500;
	if !(_z in _r) then {
		_r set [count _r, _z];
	};

	//--- поддержка, медик, инженер, автозаправщик

	//--- свмолет

	//--- вертолет

	//--- дрон

	//--- пво

	//--- механизированые

	//--- моторизированые

	//--- танки
};

	//Launchers.
	/*
	_tWeap = secondaryWeapon _unit;

	if (_tWeap == "") then {
		_tWeap = primaryWeapon _unit;
	};
	*/
	_z = 0;

		{


		//if (_tWeap != "") then {


			//_type = getNumber (configFile >> "CfgWeapons" >> _x >> "type");

			switch (getNumber (configFile >> "CfgWeapons" >> _x >> "type")) do
			{
				//Rifles.
				case 1:
				{
					if (getNumber(configFile >> "CfgWeapons" >> _x >> "opticsFlare") == 1) then
					{
						diag_log format ['Log: [fnc_getUnitClass] %1 opticsFlare == 1', [_unit,_x,_z]];
						_z = 9;
						if !(_z in _r) then {
							_r set [count _r, _z];
						};
					}
					else
					{
						_z = 7;
						if !(_z in _r) then {
							_r set [count _r, _z];
						};
					}
				};

				//Sidearms.
				case 2:
				{
					_z = 6;
					if !(_z in _r) then {
						_r set [count _r, _z];
					};
				};

				//Launchers.
				case 4:
				{
					_z = 10;
					if !(_z in _r) then {
						_r set [count _r, _z];
					};
				};

				//Machineguns.
				case 5:
				{
					//Check autofire to see this is a machinegun.
					if (getNumber(configFile >> "CfgWeapons" >> _x >> "autoFire") == 1) then
					{
						_z = 8;
						if !(_z in _r) then {
							_r set [count _r, _z];
						};
					}
					else
					{
						//Probably a heavy sniper rifle.
						_z = 9;
						if !(_z in _r) then {
							_r set [count _r, _z];
						};
					};
				};

				default
				{
					//Explosives?
					if ((getNumber (configFile >> "CfgWeapons" >> _x >> "type") % 256) == 0) then
					{
						_z = 1;
						if !(_z in _r) then {
							_r set [count _r, _z];
						};
					};
				};
			};

		//};
		} forEach weapons _unit;

	if(getNumber(configFile >> "CfgVehicles" >> _type >> "attendant")> 0) then{
		_z = 103;
		if !(_z in _r) then {
			_r set [count _r, _z];
		};
	};
	if(getNumber(configFile >> "CfgVehicles" >> _type >> "Engineer")> 0) then{
		_z = 104;
		if !(_z in _r) then {
			_r set [count _r, _z];
		};
	};

	//--- винтовки

	//--- винтовки с оптикой

	//--- снайперские винтовки

	//--- пулеметы

	//--- гранатометы, пзрк

	//--- экзотическое оружие

diag_log format ['Log: [fnc_getUnitClass] %1', [_unit,_type,_r]];


_r;
