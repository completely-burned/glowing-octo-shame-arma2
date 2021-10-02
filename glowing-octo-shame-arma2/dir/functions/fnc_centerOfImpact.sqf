
/*---------------------------------------------------------------------------
находим центр кучки 2D
_this список объектов или позиций
---------------------------------------------------------------------------*/

private["_centr","_item","_pX","_pY","_n"];

_centr = _this select 0;

if (typeName _centr == typeName objNull) then {
	_centr = getPos _centr;
};

/*	private["_m"];
	_m = createMarkerLocal [str _centr, _centr];
	_m setMarkerTextLocal str 0;
	_m setMarkerType "Dot";*/

for "_i" from 1 to count _this -1 do {
	_item = _this select _i;

	if (typeName _item == typeName objNull) then {
		_item = getPos _item;
	};

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
