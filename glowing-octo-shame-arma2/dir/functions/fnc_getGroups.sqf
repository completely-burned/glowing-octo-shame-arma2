#define __A2OA__
/*---------------------------------------------------------------------------
возвращает группы ии по полочкам
---------------------------------------------------------------------------*/

private ["_g","_s","_l","_u","_e","_w","_r","_c","_le","_lw","_lr","_lc","_o",
	"_arr"];

_e = []; _w = []; _r = []; _c = []; _o = []; // Remote
_le = []; _lw = []; _lr = []; _lc = []; // Local

_arr = _this;

for "_i" from 0 to (count _arr -1) do {
	_g = _arr select _i;
	//_l = leader _g;

	_u = units _g;
	#ifdef __A2OA__
	if (alive (_u select 0) or {{alive _x} count _u > 0}) then
	#else
	if (alive (_u select 0) or ({alive _x} count _u > 0)) then
	#endif
	{
		// FIXME: Не работает должным образом.
		// У игроков отряд может зависнуть и приводить к проблемам.
		#ifdef __A2OA__
		if (_u select 0 call gosa_fnc_isPlayer or {{_x call gosa_fnc_isPlayer} count _u <= 0}) then
		#else
		if (_u select 0 call gosa_fnc_isPlayer or ({_x call gosa_fnc_isPlayer} count _u <= 0)) then
		#endif
		// TODO: Нужно больше проверок для стабильности.
		{
			_s = side _g;
			#ifdef __ARMA3__
			if (local _g) then
			#else
			if (local (_u select 0)) then
			#endif
			{
					switch (_s) do {
						case EAST: 		{_le set [count _le, _g]};
						case WEST:		{_lw set [count _lw, _g]};
						case RESISTANCE: {_lr set [count _lr, _g]};
						case CIVILIAN: 	{_lc set [count _lc, _g]};
						default {_o set [count _o, _g]};
					};
			}else{
					switch (_s) do {
						case EAST: 		{_e set [count _e, _g]};
						case WEST:		{_w set [count _w, _g]};
						case RESISTANCE: {_r set [count _r, _g]};
						case CIVILIAN: 	{_c set [count _c, _g]};
						default {_o set [count _o, _g]};
					};
			};
		};
	}else{
		_o set [count _o, _g];
	};
};

[_le,_lw,_lr,_lc,_e,_w,_r,_c,_o];
