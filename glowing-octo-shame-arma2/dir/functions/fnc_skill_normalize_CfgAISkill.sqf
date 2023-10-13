/*
	Example
	Interpolation with vanilla A3 CfgAISkill

	In { w, x, y, z } value from (w,y) gets interpolated into (x,z)

	    spotDistance[] = { 0, 0.2, 1, 0.4 };
	        Value in a range 0-1 will change into value in a range 0.2-0.4.
	    _unit setSkill ["spotDistance", 0.5];
	        Results in _unit skill "spotDistance" returning 0.3
 */
private ["_arr","_r"];

_arr = getArray (configFile >> "CfgAISkill" >> (_this select 0));

_r = (((_this select 1) - (_arr select 1)) / ((_arr select 3) - (_arr select 1)));

diag_log format ["Log: [fnc_skill_normalize_CfgAISkill] %1, %2", _this, _r];

_r;