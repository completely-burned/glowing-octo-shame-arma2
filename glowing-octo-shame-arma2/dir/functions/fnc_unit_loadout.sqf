private ["_type", "_obj", "_arr"];

_obj = _this select 0;
_type = _this select 1;

//- UnitLoadout
if (toLower _type != toLower typeOf _obj) then {
	_arr = getUnitLoadout _type;
	if (!isNil {_arr select 4} && !isNil {_arr select 3}) then {
		if (count (_arr select 4) >= 2 && count (_arr select 3) >= 2) then {
			(_arr select 4 select 1) append (_arr select 3 select 1);
		};
	};
	_arr set [3, nil];
	_obj setUnitLoadout _arr;
};
