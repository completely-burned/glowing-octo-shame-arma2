
waitUntil{!isNil {MHQ_list}};
waitUntil{!isNil {bis_fnc_init}};
waitUntil{!isNil {safeSpawnDistance}};
waitUntil{!isNil {m_friendlySide}};


// -- стартовые позиции
private ["_useDefaultStarts", "_names","_StartingLocationsPos"];
_useDefaultStarts = true;
_names = configfile >> "cfgWorlds" >> WorldName >> "Names";
_StartingLocationsPos = [];

for "_i" from 0 to (count _names - 1) do
{
	private ["_name"];
	_name = _names Select _i;

	if (IsClass _name) then
	{
		private ["_type","_position"];
		_type = GetText (_name >> "type");

		if (_useDefaultStarts && _type == "FlatArea") then
		{
			_position = GetArray (_name >> "position");
			// _direction = GetNumber (_name >> "angle");

			_StartingLocationsPos set [count _StartingLocationsPos, _position];
		};
	};
};

private ["_MHQ"];

private ["_true"];

while{true}do{

	_MHQ = objNull;

	// -- развернутые базы
	{
		if(toLower typeOf _x in (MHQ_list select 1) && alive _x)then{
			if(isNull _MHQ)then{
				_MHQ = _x;
			}else{
				_x setDamage 1;
			};
		};
	} forEach allMissionObjects "Warfare_HQ_base_unfolded";

	// -- не развернутые мобильные базы
	{
		if(toLower typeOf _x in (MHQ_list select 0) && alive _x)then{
			if(isNull _MHQ)then{
				_MHQ = _x;
			}else{
				_x setDamage 1;
			};
		};
	} forEach vehicles;

	// -- создание, если отсутствуют
	if(isNull _MHQ)then{

		private ["_list","_dist"];
		_list =+ _StartingLocationsPos;
		_dist =+ (safeSpawnDistance select 5);

		scopeName "scope1";
		while {isNull _MHQ}do{
			_pos = (_list call BIS_fnc_selectRandom);

			_true = true;

			if(!isNil {civilianBasePos})then{ // проверка дистанции точки
				if(_pos distance civilianBasePos < _dist)then{
					_true = false;
				};
			};

			if({(side _x in m_sideEnemy)} count (_pos nearEntities _dist) > 0)then{ // проверка дистанции врагов
				_true = false;
			};

			if(_true)then{
				_MHQ = createVehicle [(MHQ_list select 0) call BIS_fnc_selectRandom, _StartingLocationsPos call BIS_fnc_selectRandom, [], 0, "NONE"]; // создание
				breakTo "scope1";
			}else{
				_list = _list - [_pos];
			};

			if(count _list == 0)then{
				_dist = _dist - ((safeSpawnDistance select 5) / 5);
				_list =+ _StartingLocationsPos;
			};
		};
	};

	sleep 10;
};
