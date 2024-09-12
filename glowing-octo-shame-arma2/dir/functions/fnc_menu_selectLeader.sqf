private['_g','_tmp_obj','_tmp_arr'];
_tmp_obj = player;
_g = group _tmp_obj;
_tmp_arr = []+GroupSelectedUnits _tmp_obj;

if (count _tmp_arr > 0) then {
	_tmp_obj = _tmp_arr select 0;
}else{
	// Отмена если командир другой игрок.
	if (leader _g call gosa_fnc_isPlayer) then {
		_tmp_obj = objNull;
	};
};

if !(isNull _tmp_obj) then {
	if (isMultiplayer) then {
		#ifdef __ARMA3__
			[_g, _tmp_obj] remoteExec ['selectLeader', groupOwner _g];
		#else
			[nil, _g, rselectLeader, _tmp_obj] call RE;
		#endif
	}else{
		_g selectLeader _tmp_obj;
	};
};
