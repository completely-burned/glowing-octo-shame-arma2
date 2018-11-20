// _this spawn{
	private ["_grp"];
	_grp = _this select 0;
	private ["_pos"];
	_pos=civilianBasePos;
	while{!isnull _grp}do{
		if(count waypoints _grp < 2)then
		{
			private ["_air"];
			_air = if((vehicle leader _grp) iskindof "air")then{true}else{false};
			private ["_maxDist"];
			if(_air)then{
				_maxDist = 4000;
			}
			else{
				_maxDist = 150;
			};
			private ["_newPos", "_posX", "_posY"];
			_posX = _pos select 0;
			_posY = _pos select 1;
			private ["_newX", "_newY"];
			_newX = _posX + (_maxDist - (random (_maxDist * 2)));
			_newY = _posY + (_maxDist - (random (_maxDist * 2)));
			_newPos = [_newX, _newY];
			_grp Move _newPos;
			if(_air)then{sleep 20}else{sleep 120};
		};
		sleep 10;
	};
// };