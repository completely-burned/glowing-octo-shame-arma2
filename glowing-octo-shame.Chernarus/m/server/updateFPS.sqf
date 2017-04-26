private["_fps_array","_fps","_sleep"];
_fps_array=[];
_sleep=0.25;
private["_globalChatTime"];
_globalChatTime = time;
waitUntil{time >= 10};
while{true}do{
	_fps_array=_fps_array+[diag_fps];
	if(count _fps_array > 180/_sleep)then{
		_fps_array set [0,-1];
		_fps_array = _fps_array - [-1];
	};
	_fps = _fps_array select 0;
	{
		// _fps = _fps + _x;
		_fps = _fps min _x;
	}forEach _fps_array;
	// _fps=(_fps/count _fps_array);
	serverFPS=_fps;
	sleep _sleep;
	if(!isDedicated && debug)then{
		if(_globalChatTime <= time - 10)then{
			player globalChat format["FPS: %1; allGroups: %2; configFPS: %3",serverFPS,count allGroups,missionNamespace getVariable "serverFPSmin"];
			_globalChatTime = time;
		};
	};
};
