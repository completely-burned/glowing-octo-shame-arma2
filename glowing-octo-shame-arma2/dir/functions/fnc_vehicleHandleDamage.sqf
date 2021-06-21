private["_unit","_selectionName","_damage","_source","_projectile"];
_unit = _this select 0;
_selectionName = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

if(_unit == _source)then{
	if(_projectile != "")then{
		_damage
	};
}else{
	if!(isPlayer _source && isPlayer effectiveCommander _unit)then{
		_damage
	};
};
