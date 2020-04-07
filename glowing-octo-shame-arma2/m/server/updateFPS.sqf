waitUntil{time >= 10};

private["_fps_array","_fps_array_time","_fps_array_countGroups"];
_fps_array = [];
_fps_array_time = [];
_fps_array_countGroups = [];

private["_maxGroups"];
_maxGroups = 0;

private["_FrameNo16"];

private["_minFPS"];
_minFPS = missionNamespace getVariable "serverFPSmin";

private["_printTime"];
_printTime = 0;

while{true}do{

	_FrameNo16 = diag_frameno +16;


	_fps_array 		set [count _fps_array, 		diag_fps		];
	_fps_array_time set [count _fps_array_time, time + draga_server_diag_fps_interval];
	_fps_array_countGroups set [count _fps_array_countGroups, count allGroups];


	for "_i" from 0 to (count _fps_array_time - 1) do {
		if( _fps_array_time select _i < time )then{
			_fps_array set [_i, -1];
			_fps_array_time set [_i, -1];
			_fps_array_countGroups set [_i, -1];
		};
	};
	_fps_array = _fps_array - [-1];
	_fps_array_time = _fps_array_time - [-1];
	_fps_array_countGroups = _fps_array_countGroups - [-1];


	for "_i" from 0 to (count _fps_array_time - 1) do {
		if( _fps_array select _i <= _minFPS )then{
			_maxGroups = _maxGroups max (_fps_array_countGroups select _i);
		};
	};

	maxGroups=_maxGroups;

	if( time > _printTime )then{
		_printTime = time + 120;
		diag_log format ["maxGroups %1", _maxGroups];
	};

	while {_FrameNo16 > diag_frameno} do {Sleep 0.001};

};
