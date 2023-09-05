
private [
	#ifndef __ARMA3__
		"_sorted","_pre",
	#endif
	"_s","_i","_r0","_r1"];

#ifdef __ARMA3__
	private _pre = _this select 0;
	private _sorted = [];
#else
	_pre = _this select 0;
	_sorted = [];
#endif
diag_log format ["Log: [fnc_sortUnits_onRank] _pre %1", _pre];

if (count _pre > 1) then {
	_sorted set [0, _pre select 0];
	for "_i" from 1 to (count _pre -1) do {
		scopeName "sn_gs";
		for "_s" from (count _sorted -1) to 0 step -1 do {
			_r0 = rankId (_pre select _i);
			_r1 = rankId (_sorted select _s);
			diag_log format ["Log: [fnc_sortUnits_onRank] for %1", [_pre select _i, _r0], [_sorted select _s, _r1]];
			if (typeName _r0 != "SCALAR") then {
				_r0 = 0;
			};
			if (typeName _r1 != "SCALAR") then {
				_r1 = 0;
			};
			if (_r0 > _r1) then
			{
				_sorted set [_s+1, _sorted select _s];
				_sorted set [_s, _pre select _i];
			};
			if (_r0 <= _r1 && 
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

