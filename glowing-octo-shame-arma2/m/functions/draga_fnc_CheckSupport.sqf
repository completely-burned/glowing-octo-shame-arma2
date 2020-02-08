private["_true"];
_true = false;

if(count _this > 0)then {
	private["_side","_sideNumber"];
	_sideNumber = getNumber(LIB_cfgVeh >> _this select 0 >> "side");
	_side = _sideNumber call m_fnc_getSide;
	ScopeName "_true";
	{
		private["_type"];
		_type = _x;
		if(getNumber(LIB_cfgVeh >> _type >> "attendant")> 0 && _type isKindOf "LandVehicle")then{
			{
				if(_side in m_friendlySide)then{
						_true = true;
						BreakTo "_true";
				};
				if(alive assignedDriver _x)then{
					if(_sideNumber == getNumber(LIB_cfgVeh >> typeOf _x >> "side"))then{
						_true = true;
						BreakTo "_true";
					};
				};
			}forEach vehicles;
		};
		if(getNumber(LIB_cfgVeh >> _type >> "transportammo")> 0)then{
			{
				if(_side in m_friendlySide)then{
						_true = true;
						BreakTo "_true";
				};
				if(alive assignedDriver _x)then{
					if(_sideNumber == getNumber(LIB_cfgVeh >> typeOf _x >> "side"))then{
						_true = true;
						BreakTo "_true";
					};
				};
			}forEach vehicles;
		};
		if(getNumber(LIB_cfgVeh >> _type >> "transportrepair")> 0)then{
			{
				if(_side in m_friendlySide)then{
						_true = true;
						BreakTo "_true";
				};
				if(alive assignedDriver _x)then{
					if(_sideNumber == getNumber(LIB_cfgVeh >> typeOf _x >> "side"))then{
						_true = true;
						BreakTo "_true";
					};
				};
			}forEach vehicles;
		};
		if(getNumber(LIB_cfgVeh >> _type >> "transportfuel")> 0)then{
			{
				if(_side in m_friendlySide)then{
						_true = true;
						BreakTo "_true";
				};
				if(alive assignedDriver _x)then{
					if(_sideNumber == getNumber(LIB_cfgVeh >> typeOf _x >> "side"))then{
						_true = true;
						BreakTo "_true";
					};
				};
			}forEach vehicles;
		};
		
	}forEach _this;
};

_true
