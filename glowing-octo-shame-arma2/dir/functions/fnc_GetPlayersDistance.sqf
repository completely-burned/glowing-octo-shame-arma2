private["_pos","_player","_distance"];
_pos = _this select 0;

if (typeName _pos == typeName objNull) then {
	_pos = vehicle _pos;
};

_player = objNull;
if (isMultiplayer) then{
	{
		if (_x call gosa_fnc_isPlayer) then {
			_player = vehicle _x;
			if (isNil {_distance}) then {
				_distance = _pos distance _player;
			}else{
				_distance = _distance min (_pos distance _player);
			}
		};
	} foreach allUnits;
}else{
	_distance = vehicle player distance _pos;
};
diag_log format ["gosa_fnc_GetPlayersDistance.sqf %1 %2", _distance, _pos];

_distance;
