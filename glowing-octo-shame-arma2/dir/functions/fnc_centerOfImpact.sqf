
/*---------------------------------------------------------------------------
находим центр кучки 2D
_this список объектов, групп или позиций
---------------------------------------------------------------------------*/
diag_log format ["Log: [fnc_centerOfImpact] %1", _this];

private["_centr","_item","_pX","_pY","_n","_z"];

_z = [];
for "_i" from 0 to count _this -1 do {
	_item = _this select _i;

	if (typeName _item == typeName objNull) then {
		_item = getPos _item;
	};
	if (typeName _item == typeName grpNull) then {
		_item = getPos leader _item;
	};

	if (_item select 0 != 0 or _item select 1 != 0) then {
		_z set [count _z, _item];
	};
};

if (count _z == 0) exitWith {
	diag_log format ["Log: [fnc_centerOfImpact] годных нет", time];
	_z;
};

_centr = _z select 0;

/*	private["_m"];
	_m = createMarkerLocal [str _centr, _centr];
	_m setMarkerTextLocal str 0;
	_m setMarkerType "Dot";*/

for "_i" from 1 to count _z -1 do {
	_item = _z select _i;

	_n = _i+1;

	_pX = (_centr select 0) - (_item select 0);
	_pY = (_centr select 1) - (_item select 1);

	_pX = _pX/_n;
	_pY = _pY/_n;

	_centr = [
		(_centr select 0) - _pX,
		(_centr select 1) - _pY
	];

	/*	_m = createMarkerLocal [str _centr, _centr];
		_m setMarkerTextLocal str _i;
		_m setMarkerType "Dot";*/

};

_centr;
