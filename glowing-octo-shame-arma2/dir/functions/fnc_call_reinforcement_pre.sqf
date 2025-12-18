diag_log format ["Log: [fnc_call_reinforcement_pre] %1", _this];

private ["_n","_arr","_fl"];
//--- линия фронта
_arr = [];
_n = (_this select 1);
if (_n > 1) then {
	if (_n == 1) then {
		if ((_this select 2) getFriend (_this select 3) >= 0.6) then {
			_arr = (_this select 5) +_arr;
		};
		if ((_this select 2) getFriend (_this select 4) >= 0.6) then {
			_arr = (_this select 6) +_arr;
		};
	};
	if (_n == 2) then {
		if ((_this select 2) getFriend (_this select 3) < 0.6) then {
			_arr = (_this select 5) +_arr;
		};
		if ((_this select 2) getFriend (_this select 4) < 0.6) then {
			_arr = (_this select 6) +_arr;
		};
	};

	// позиция
	for "_i" from 0 to (count _arr -1) do {
		if !(isNil {_arr select _i getVariable "patrol"}) then {
			_arr set [_i, grpNull]
		};
	};
	_arr = _arr -[grpNull];

	if (count _arr > 0) then {
		_arr = (_arr call gosa_fnc_centerOfImpact);
	};

	if (count _arr > 0) then {
		if(gosa_loglevel>0)then{"gosa_fl_"+str(_this select 2) setMarkerPos _arr};

		// азимут
		if (_n == 2) then {
			_n = ([_this select 13, _arr] call BIS_fnc_dirTo) + 180;
		}else{
			_n = ([_this select 13, _arr] call BIS_fnc_dirTo);
		};
		_fl = [_n, 3];
	};

	diag_log format ["Log: [fnc_call_reinforcement_pre] frontLine %1 %2", _this select 2, _arr];
}else{
	_fl = [];
};

// _arr [нападающие, патрули,  нападающие.уд.пк,  патрули.уд.пк], для одной стороны.
_n = ({isNil {_x getVariable "patrol"}} count (_this select 7));
	_arr = [_n, count (_this select 7) - _n];
	_arr set [2, {isNil {_x getVariable "patrol"}} count (_this select 8)];
	_arr set [3, count (_this select 8) - (_arr select 2)];
	diag_log format ["Log: [fnc_call_reinforcement_pre] %1 сейчас %2 %3", (_this select 2), _arr, [count (_this select 7), count (_this select 8)]];

if (((_arr select 0) + ((_arr select 2) * (_this select 15)) +
	({(_x select 1) == (_this select 11)} count (_this select 0))) < (_this select 9)) then
{
	(_this select 0) set [count (_this select 0),
		[[(_this select 2), objNull, _fl] spawn gosa_fnc_call_reinforcement, _this select 11]];
};
if (((_arr select 1) + ((_arr select 3) * (_this select 15)) +
	({(_x select 1) == (_this select 12)} count (_this select 0))) < (_this select 10)) then
{
	(_this select 0) set [count (_this select 0), [
		[
			(_this select 2),
			(_this select 14) call BIS_fnc_selectRandom, _fl,
			[_this select 7, _this select 8]
		] spawn gosa_fnc_call_reinforcement, _this select 12
	]];
};
