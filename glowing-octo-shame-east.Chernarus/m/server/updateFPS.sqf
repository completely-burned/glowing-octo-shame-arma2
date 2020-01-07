waitUntil{time >= 10};

private["_fps_array","_fps_array_size","_fps","_currFrameNo16"];
_fps_array=[];
_fps_array_size=180;
while{true}do{

	_currFrameNo16 = diag_frameno +16;

	_fps_array=_fps_array+[diag_fps];

	if(count _fps_array > _fps_array_size)then{
		_fps_array set [0,-1];
		_fps_array = _fps_array - [-1];
	};

	_fps = _fps_array select 0;
	{
		_fps = _fps min _x;
	}forEach _fps_array;

	serverFPS=_fps;

	while {_currFrameNo16 > diag_frameno} do {Sleep 0.001};

};
