/*---------------------------------------------------------------------------
возвращает локальные группы ии по сторонам
---------------------------------------------------------------------------*/

private ["_g","_s","_l","_u","_e","_w","_r","_c","_o"];

_e = []; _w = []; _r = []; _c = []; _o = [];

{
	_g = _x;
	//_l = leader _g;

	_u = units _g;
	if (local (_u select 0)) then {
		if (alive (_u select 0) or {{alive _x} count _u > 0}) then {
			/* не работает должным образом
			if({_x call gosa_fnc_isPlayer} count _u == 0)then{*/
				_s = side _g;
				switch (_s) do {
					case EAST: 		{_e set [count _e, _g]};
					case WEST:		{_w set [count _w, _g]};
					case RESISTANCE: {_r set [count _r, _g]};
					case CIVILIAN: 	{_c set [count _c, _g]};
					default {_o set [count _o, _g]};
				};
			//};
		}else{
			_o set [count _o, _g];
		};
	}else{
		_o set [count _o, _g];
	};
} forEach allGroups;

[_e,_w,_r,_c,_o];
