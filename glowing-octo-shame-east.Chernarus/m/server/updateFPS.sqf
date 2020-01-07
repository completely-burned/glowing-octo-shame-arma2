waitUntil{time >= 10};

private["_fps_array","_fps_array_time"];
_fps_array = [];
_fps_array_time = [];

private["_fps","_fps_array_size"];
_fps = 0;
_fps_array_size = 0;

private["_FrameNo16"];

while{true}do{

	_FrameNo16 = diag_frameno +16;

	_fps_array 		set [count _fps_array, 		diag_fps		];
	_fps_array_time set [count _fps_array_time, time + draga_server_diag_fps_interval];

	for "_i" from 0 to (count _fps_array_time - 1) do {
		if( _fps_array_time select _i < time )then{
			_fps_array set [_i, -1];
			_fps_array_time set [_i, -1];
		}else{
			_fps = _fps + (_fps_array select _i);
			_fps_array_size = _fps_array_size +1;
		};
	};

	_fps_array = _fps_array - [-1];
	_fps_array_time = _fps_array_time - [-1];

	_fps = _fps / _fps_array_size;

	serverFPS=_fps;

	_fps = 0;
	_fps_array_size = 0;

	while {_FrameNo16 > diag_frameno} do {Sleep 0.001};

};
