/*---------------------------------------------------------------------------
_this select 0 позиция начала
_this select 1 позиция пересечения
_this select 2 растояние за позицией пересечения
возвращает позицию за позицией пересечения
---------------------------------------------------------------------------*/

private["_front_p","_x_p","_dX","_dY","_dist","_dist_after_x","_dist_before_x","_p"];

_front_p = _this select 0;
_x_p = _this select 1;
_dist_after_x = _this select 2;

diag_log format ["Log: [fnc_getPosBehind] %1", _this];

_dX = ((_x_p select 0) - (_front_p select 0));
_dY = ((_x_p select 1) - (_front_p select 1));

_dist_before_x = sqrt( (_dX^2) + (_dY^2) );

_dist = _dist_after_x + _dist_before_x;

_p = [
	(_front_p select 0) + (_dist / (_dist_before_x / _dX)),
	(_front_p select 1) + (_dist / (_dist_before_x / _dY))
];

_p;
