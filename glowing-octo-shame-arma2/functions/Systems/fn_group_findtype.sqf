/*
 * [gosa_Groups_common select 0,["SUPPORT"],["Air"],[[],[]]] call gosa_fnc_group_findType
 */
private ["_grps","_types","_types_ignore","_return","_grp_types","_b"];

_grps = _this select 0;
_types = _this select 1;
_types_ignore = _this select 2;
_return = _this select 3;

diag_log format ["Log: [fnc_group_findType] _this %1", _this];

for "_i" from 0 to (count (_grps select 0) -1) do {
	// TODO: Мультиотряды.
	_grp_types = _grps select 0 select _i select 0 select 0 select 0 call gosa_fnc_getGroupType;

	scopeName "loop1";
	_b = false;
	for "_i0" from 0 to (count _types -1) do {
		if (_types select _i0 in _grp_types) then {
			_b = true;			
			diag_log format ["Log: [fnc_group_findType] %1 pending %2", _types select _i0, _grps select 0 select _i select 0 select 0 select 0];
			breakTo "loop1";
		};
	};
	if (_b) then {
		for "_i0" from 0 to (count _types_ignore -1) do {
			if (_types_ignore select _i0 in _grp_types) then {
				_b = false;
				diag_log format ["Log: [fnc_group_findType] %1 ignore %2", _types_ignore select _i0, _grps select 0 select _i select 0 select 0 select 0];
				breakTo "loop1";
			};
		};
	};
	if (_b) then {
		_return select 1 set [count (_return select 0), _grps select 1 select _i];		
		_return select 0 set [count (_return select 0), _grps select 0 select _i];
	};
};

diag_log format ["Log: [fnc_group_findType] _return %1", _return];
_return;
