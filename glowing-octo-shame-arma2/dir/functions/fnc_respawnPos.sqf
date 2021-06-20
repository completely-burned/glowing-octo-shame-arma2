private ["_obj","_pos","_dir","_dist2"];

_pos = _this select 0;

if (typeName _pos == typeName objNull) then {

	_obj = _pos;
	_pos = getPos _obj;

	if(_obj isKindOf "LandVehicle")then{
		_dir = getDir _obj + 90 - 20 + random 40;
		if(random 2 >= 1)then{
			_dir = _dir + 180;
		};
		_dist2 = 4 + random 4;
		_pos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
	};

	if(_obj isKindOf "WarfareBDepot")then{
		_dir = getDir _obj;
		_dist2 = 3;
		_pos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
	};

	if(_obj isKindOf "Warfare_HQ_base_unfolded")then{
		_dir = getDir _obj - 85 + random 10;
		_dist2 = 4;
		_pos = [(_pos select 0) + _dist2*sin _dir, (_pos select 1) + _dist2*cos _dir];
	};

	if(_obj isKindOf "Base_WarfareBBarracks" or _obj isKindOf "BASE_WarfareBFieldhHospital")then{
		_dir = random 360;
		_dist = random 10;
		_pos = [(_pos select 0) + _dist*sin _dir, (_pos select 1) + _dist*cos _dir];
	};

};

_pos;
