/*---------------------------------------------------------------------------
возвращает размер карты, не точно
---------------------------------------------------------------------------*/

if (isNil "worldSize") then {
	private["_s","_centerPosition"];

	_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

	_s = getMarkerPos "gosa_worldSize";

	// горизонт
	if (_s select 0 == 0) then {
		_s set [0, (_centerPosition select 0) *2];

		if (worldName == "Chernarus") then {
			_s set [0, (_s select 0) + (6 * 100)];
		};

		if (worldName == "Shapur_BAF") then {
			_s set [0, (_s select 0) - (6.6 * 100)];
		};
	};

	if (_s select 1 == 0) then {
		_s set [1, (_centerPosition select 1) *2];

		if (worldName == "Chernarus") then {
			_s set [1, (_s select 1) - (2.5 * 100)];
		};

		if (worldName == "Shapur_BAF") then {
			_s set [1, (_s select 1) - (7.8 * 100)];
		};
	};

	private["_diag_log"];
	_diag_log = "gosa_worldSize_diag";
	createMarkerLocal [_diag_log, _s];
	_diag_log setMarkerTextLocal _diag_log;
	_diag_log setMarkerTypeLocal "Dot";
	_diag_log setMarkerPosLocal _s;

	worldSize = _s;
	diag_log format ["Log: [worldSize] = %1", worldSize];
};

worldSize;
