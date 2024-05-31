private["_arr","_types","_b","_r","_cfgVeh","_item","_copyRef","_type","_n"];

_arr = _this select 0;

#ifdef __ARMA3__
	_copyRef = _this select 1;
#endif


_cfgVeh = LIB_cfgVeh;
_r = [];

for "_i" from 0 to (count _arr -1) do {
	_item = (_arr select _i select 0);

	ScopeName "_arr_item";

	_b = true;
	for "_i0" from 0 to (count _item -1) do {
		_types = (_item select _i0 select 0);
		for "_iT" from 0 to (count _types -1) do {
			_type = configName (_cfgVeh >> (_types select _iT));
			if (_type == "")  then {
				_b = false;
				//diag_log format ["Log: [fnc_filtering_squads_byAvail_v2] not available %1, deleting %2", _types select _iT, _types];
				BreakTo "_arr_item";

				// Reference
				#ifdef __ARMA3__
			}else{
				_n = (_copyRef findIf {toLowerANSI _x == toLowerANSI _type});
				if (_n >= 0) then {
					_types set [_iT, _copyRef select _n];
				};
				//diag_log format ["Log: [fnc_filtering_squads_byAvail_v2] %1, configName isEqualRef %2, _copyRef isEqualRef %3", _type, (_copyRef select _n) isEqualRef _type, (_copyRef select _n) isEqualRef (_types select _iT)];
				#endif
			};
		};
	};


	if (_b) then {
		_r set [count _r, _arr select _i];
	};
};

diag_log format ["Log: [fnc_filtering_squads_byAvail_v2] count _this %1, count _r %2", count _this, count _r];
_r;
