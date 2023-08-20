
private ["_sorted","_pre","_s","_i"];

_pre = _this select 0;
diag_log format ["Log: [fnc_sortUnits_onRank] _pre %1", _pre];

_sorted = [];
if (count _pre > 1) then {
	_sorted set [0, _pre select 0];
	for "_i" from 1 to (count _pre -1) do {
		scopeName "sn_gs";
		for "_s" from (count _sorted -1) to 0 step -1 do {
			diag_log format ["Log: [fnc_sortUnits_onRank] for %1", [_pre select _i, _sorted select _s]];
			if (rankId (_pre select _i) > rankId (_sorted select _s)) then
			{
				_sorted set [_s+1, _sorted select _s];
				_sorted set [_s, _pre select _i];
			};
			if (rankId (_pre select _i) <= rankId (_sorted select _s) && 
				count _sorted - 1 == _s) then
			{
				_sorted set [_s+1, _pre select _i];
				// FIXME: Может подойдет ExitWith?
				breakTo "sn_gs";
			};
		};
	};
	diag_log format ["Log: [fnc_sortUnits_onRank] _sorted %1", _sorted];
	_sorted;
}else{
	_pre;
};

