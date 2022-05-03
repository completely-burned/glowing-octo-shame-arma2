scriptName "Alice\data\scripts\fnc_createDoor.sqf";
/*
	Невидимая дверь.
*/
diag_log Format ["Log: [alice\fnc_createdoor] _this %1",_this];

private ["_obj","_ran","_debug","_pos","_bbox","_b1","_b2","_bbx","_bby","_marker","_marker2","_AIdoors","_door","_doorpos","_doorposdir","_doordir","_AIdoor","_markerD"];

_obj = _this;
_ran = round random 100000;
_debug = false;
/*
if (gosa_loglevel > 0) then {
	_debug = true;
};
//_debug = bis_alice_mainscope getvariable "debug";
*/

_pos = _obj modeltoworld [0,0,0];
_bbox = boundingbox _obj;
_b1 = _bbox select 0;
_b2 = _bbox select 1;
_bbx = abs(_b1 select 0) + abs(_b2 select 0);
_bby = abs(_b1 select 1) + abs(_b2 select 1);

if (_debug) then {
	_marker = createmarker [format ["houseA%1",_ran],_pos];
	_marker setmarkerdir direction _obj;
	_marker setmarkershapelocal "rectangle";
	_marker setmarkersizelocal [_bbx/2,_bby/2];
	_marker setmarkercolor "colorgreen";
	_marker setmarkeralpha 0.2;
};

_AIdoors = [];

//--- Create doors on all assigned memory points
for "_n" from 1 to 10 do {

	_door = format ["AIdoor%1",_n];
	if ((_obj selectionposition _door select 0) == 0) exitwith {};

	_doorpos = _obj modeltoworld (_obj selectionposition _door);

	//--- Prevent duplicates
	if (count (_doorpos nearentities ["BIS_alice_emptydoor",1]) == 0) then {
		_doorposdir = _obj modeltoworld (_obj selectionposition (_door + "_dir"));
		_doordir = ([_doorpos,_doorposdir] call bis_fnc_dirTo) + 180;

		_AIdoor = "BIS_alice_emptydoor" createvehicle _doorpos;
		diag_log Format ["Log: [alice\fnc_createdoor] create %1 _doorpos",_AIdoor];
		_AIdoor setpos _doorpos;
		_AIdoor setdir _doordir;
		_AIdoor setvariable ["ALICE_obj",_obj];
		_AIdoors = _AIdoors + [_AIdoor];

		if (_debug) then {
			_marker setmarkercolor "colorred";
			_markerD = createmarker [format ["houseDoor%1_%2",_ran,_n],_doorpos];
			_markerD setmarkertype "mil_triangle";
			_markerD setmarkerdir _doordir;
			_markerD setmarkersize [1,0.5];
			_markerD setmarkercolor "colorblack";
			_markerD setmarkeralpha 0.2;

			if (!isnil "alice_debug_doorpos") then {
				_cube = "CubeHelper" createvehicle _doorpos;
				_cube setpos _doorpos;
				_cube setdir _doordir;
			};
		};
	}else{
		diag_log Format ["Log: [alice\fnc_createdoor] nearentities %1 true",_doorpos];
	};
};

//--- Returned value
_AIdoors;
