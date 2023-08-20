
private ["_sorted","_pre","_s","_i","_pos"];

_pre = _this select 0;
_pos = _this select 1;

_sorted = [];
if (count _pre > 1) then {
	_sorted set [0, _pre select 0];
	for "_i" from 1 to (count _pre -1) do {
		scopeName "sn_gs";
		for "_s" from (count _sorted -1) to 0 step -1 do {
			// Добавляем в середину.
			if (_pos distance (_pre select _i) < _pos distance (_sorted select _s)) then
			{
				_sorted set [_s+1, _sorted select _s];
				_sorted set [_s, _pre select _i];
			};
			// Дописываем в конец.
			if (_pos distance (_pre select _i) >= _pos distance (_sorted select _s) && 
				count _sorted - 1 == _s) then
			{
				_sorted set [_s+1, _pre select _i];
				// FIXME: Может подойдет ExitWith?
				breakTo "sn_gs";
			};
		};
	};
	_sorted;
}else{
	_pre;
};
