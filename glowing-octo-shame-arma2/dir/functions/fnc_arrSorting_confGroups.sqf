/*
 * Функция приводит [[_groups,0.5],[_groups,0.5]] к виду [[_groups,_groups],[0.5,0.5]]
 */

private["_g","_w","_item"];
_g=[];
_w=[];

for "_i" from 0 to (count _this -1) do {
	_item = _this select _i;
	_g set [_i, [_item select 0]];
	_w set [_i,  _item select 1 ];
};

[_g,_w];
