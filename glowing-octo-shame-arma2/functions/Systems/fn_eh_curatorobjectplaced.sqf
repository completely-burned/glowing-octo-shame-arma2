private ["_curator","_entity","_arr","_n","_obj","_link","_n0"];
params ["_curator","_entity"];
diag_log format ["Log: [fnc_eh_CuratorObjectPlaced] %1", _this];

if ([_entity] call gosa_fnc_obj_isRespawnPoint) then {
	_arr = call gosa_fnc_base_get_locations;
	_arr = _arr select 0;
	for "_i" from 0 to (count _arr -1) do {
		_obj = _arr select _i;
		if (isNil "_n") then {
			_n = _entity distance _obj;
			_link = _obj;
		}else{
			_n0 = _entity distance _obj;
			if (_n0 < _n) then {
				_n = _n0;
				_link = _obj;
			};
		};
	};

	if !(isNil "_link") then {
		diag_log format ["Log: [fnc_eh_CuratorObjectPlaced] %1 synchronize %2", _entity, _link];
		_link synchronizeObjectsAdd [_entity];
		_entity synchronizeObjectsAdd [_link];
	};
};
