/*---------------------------------------------------------------------------
true если позиция в пределах карты
---------------------------------------------------------------------------*/

// в пустыне или на воде не видно границы карты
if (toLower worldName in ["shapur_baf","utes","desert_e"]) exitWith {
	diag_log format ["Log: [fnc_withinMap] %1 true", worldName];
	true;
};

private["_p"];

_p = _this;

if (typeName _p == typeName objNull) then {
	_p = getPos _this;
};

if (_p select 0 < 0 or _p select 0 > (worldSize select 0)) exitWith {
	diag_log format ["Log: [fnc_withinMap] %1 false", [worldSize, _p, _this]];
	false;
};

if (_p select 1 < 0 or _p select 1 > (worldSize select 1)) exitWith {
	diag_log format ["Log: [fnc_withinMap] %1 false", [worldSize, _p, _this]];
	false;
};

diag_log format ["Log: [fnc_withinMap] %1 true", [worldSize, _p, _this]];
true;
