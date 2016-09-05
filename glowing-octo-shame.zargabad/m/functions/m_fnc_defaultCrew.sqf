private["_side","_type","_typeCrew"];
_side = _this select 0;
_type = _this select 1;

if(_side == west)then{
	if(_type isKindOf "Air")then{
		_typeCrew = "US_Soldier_Pilot_EP1";
	}else{
		_typeCrew = "US_Soldier_Crew_EP1";
	};
};

if(_side == east)then{
	if(_type isKindOf "Air")then{
		_typeCrew = "TK_Soldier_Pilot_EP1";
	}else{
		_typeCrew = "TK_Soldier_Crew_EP1";
	};
};

if(_side == resistance)then{
	if(_type isKindOf "Air")then{
		_typeCrew = "UN_CDF_Soldier_Pilot_EP1";
	}else{
		_typeCrew = "UN_CDF_Soldier_Crew_EP1";
	};
};

if(_side == civilian)then{
	_typeCrew = "TK_CIV_Takistani01_EP1";
};

_typeCrew
