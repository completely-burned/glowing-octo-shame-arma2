private["_unit","_selection","_damage","_source","_projectile","_canDie","_damageNone","_m_true"];
_unit = _this select 0;
_selection = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

_canDie = !isnil {_unit getvariable "BIS_allowDamage"};
_damageNone = if (_canDie) then {_damage} else {0};

_m_true = true;
if(_m_true)then{
	if(_selection == "" && _damage >= 0.8 && !_canDie && alive _unit)then{
		_unit setvariable ["BIS_lifeState","UNCONSCIOUS",true];
		_unit setvariable ["BIS_IS_inAgony",true,true];
		_m_true = false;
		0.8
	};
};
if(_m_true)then{
	if(lifeState _unit == "UNCONSCIOUS")then{
		_m_true = false;
		_damageNone
	};
};
if(_m_true)then{
	_m_true = false;
	if (_canDie) then {
		_damage
	} else {
		_damage min (0.8 - 0.01)
	};
};
