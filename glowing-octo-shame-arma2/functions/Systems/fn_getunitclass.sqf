#define __A2OA__

private ["_unit","_type","_tWeap","_r","_z","_veh","_t_veh","_tmp_arr",
	"_item","_crew","_crew_p"];

diag_log format ['Log: [fnc_getUnitClass] _this %1', _this];

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

	//--- Экипаж.
	// Пассажиров не нужно учитывать.
	_crew = [driver _veh, gunner _veh, commander _veh];
		diag_log format ['Log: [fnc_getUnitClass] _crew %1', _crew];
		// Игрока не нужно учитывать.
		_crew = _crew - [objNull, player];
		_crew_p = [];
		{
			if (_x call gosa_fnc_isPlayer) then {
				_crew_p set [count _crew_p, _x];
			};
		} forEach _crew;

	//--- экипаж тс игрок
	_z = 505;
	if !(_z in _r) then {
		if (count _crew_p > 0) then {
			_r set [count _r, _z];
		};
	};

	// TODO: Игрок, который разрешил подключение.
	//--- Экипаж тс игрок, который запретил подключение.
	_z = 506;
	if !(_z in _r) then {
		if (count _crew_p > 0) then {
			// [["43524234353254332"],[[[[],[],[],[505,600,605,506]]]]]
			_tmp_arr = gosa_mapPlayersPublic;
			if !(isNil "_tmp_arr") then {
				diag_log format ['Log: [fnc_getUnitClass] gosa_mapPlayersPublic %1', _tmp_arr];
				for "_i" from 0 to (count (_tmp_arr select 0) -1) do {
					// [gosa_squadOn, gosa_squadOff, gosa_squadOnW, gosa_squadOffW]
					_item = (_tmp_arr select 1 select _i select 0);
					diag_log format ['Log: [fnc_getUnitClass] _item %1', _item];
					if (_z in (_item select 3)) then {
						private ["_uid"];
						_uid = (_tmp_arr select 0 select _i);
						{
							if (getPlayerUID _x == _uid) exitWith {
								_r set [count _r, _z];
							};
						} forEach _crew_p;
					};
				};
			};
		};
	};

	// TODO: отряд исключително пехоты

	// TODO: нужно исключить пво

	//--- машины
	if (_t_veh isKindOf "Car") then {
		_z = 510;
		//--- бтр
		if (_t_veh isKindOf "Wheeled_APC") then {
			_z = 515;
		}else{
			_z = 516;
		};
		if !(_z in _r) then {
			_r set [count _r, _z];
		};
	};

	//--- танки
	if (_t_veh isKindOf "Tank") then {
		_z = 520;
		//--- бмп
		if (_t_veh isKindOf "Tracked_APC") then {
			_z = 525;
		}else{
			_z = 526;
		};
		if !(_z in _r) then {
			_r set [count _r, _z];
		};
	};

	if (_t_veh isKindOf "Air") then {

		_z = 600;
		if !(_z in _r) then {
			_r set [count _r, _z];
		};

		//--- пилот
		_z = 605;
		if !(_z in _r) then {
			if (_unit == driver _veh) then {
				_r set [count _r, _z];
			};
		};
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
