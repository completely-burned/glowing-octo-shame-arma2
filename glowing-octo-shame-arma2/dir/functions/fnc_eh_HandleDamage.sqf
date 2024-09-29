private ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context",
	"_crush"];
params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];

// TODO: Исключить игроков и экипаж.

if (isNull _instigator && _projectile == "" && 
	side _unit getFriend side _source >= 0.6) then
{
	_crush = true;
}else{
	_crush = false;
};

if (_crush) then {
	_damage = _damage/100;
	diag_log format ["Log: [fnc_eh_HandleDamage] %1, _crush %2 %3", _unit, _damage, _this];
};

_damage;
