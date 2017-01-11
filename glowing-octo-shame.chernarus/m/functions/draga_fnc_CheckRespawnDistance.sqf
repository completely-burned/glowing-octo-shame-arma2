private["_true"];
if (IsDedicated) then {
	_true = true;
}else{
	waitUntil {!isNil "draga_respawnMarkers"};
	private["_pos","_dist"];
	_pos = _this select 0;
	_dist = _this select 1;
	_true = false;
	ScopeName "Check";
	{
		if ((_pos distance getMarkerPos _x ) <= _dist ) then {
			_true = true;
			BreakTo "Check";
		};
	} forEach draga_respawnMarkers
};
_true;
