private["_unit","_selection","_damage","_source","_projectile","_canDie","_damageNone","_m_true"];
_unit = _this select 0;
_selection = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

_m_true = true;

if(_unit == _source)then{
	if(_projectile == "")then{
		_m_true = false;
		_damage min (0.8 - 0.01)
	};
}else{
	if(isPlayer _source && isPlayer _unit)then{
		_m_true = false;
		_damage min (0.8 - 0.01)
	};
};

if(_m_true)then{
	if(_selection == "" && _damage >= 0.8 && alive _unit)then{
		if(isPlayer _unit)then{
		_unit setvariable ["BIS_lifeState","UNCONSCIOUS",true];
		_unit setvariable ["BIS_IS_inAgony",true,true];
		_m_true = false;
		0.8
		};
	};
};

if(_m_true)then{
	_m_true = false;
	_damage min (0.8 - 0.01)
};
