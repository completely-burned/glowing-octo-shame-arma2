#define InvisibleManE_EP1 O_UAV_AI
#define InvisibleManW_EP1 B_UAV_AI
#define InvisibleManG_EP1 I_UAV_AI
#define InvisibleManC_EP1 C_UAV_AI

private["_s","_r"];
_s = _this select 2;

switch (_s) do {
  case EAST: 		{_r = "InvisibleManE_EP1"};

  case WEST:		{_r = "InvisibleManW_EP1"};

  case RESISTANCE: 	{
    _r = "InvisibleManG_EP1";
    if (configName(LIB_cfgVeh >> _r) == "") then {
      _r = "InvisibleManR_EP1";
    };
    if (configName(LIB_cfgVeh >> _r) == "") then {
      _r = nil;
      if (isNil "_r" && RESISTANCE getFriend EAST > 0.6) then {
        _r = "InvisibleManE_EP1";
      };
      if (isNil "_r" && RESISTANCE getFriend WEST > 0.6) then {
        _r = "InvisibleManW_EP1";
      };
    };
  };

  case CIVILIAN: 	{
    _r = "InvisibleManC_EP1";
    if (configName(LIB_cfgVeh >> _r) == "") then {
      _r = nil;
      if (isNil "_r" && CIVILIAN getFriend EAST > 0.6) then {
        _r = "InvisibleManE_EP1";
      };
      if (isNil "_r" && CIVILIAN getFriend WEST > 0.6) then {
        _r = "InvisibleManW_EP1";
      };
    };
  };

  default {};
};

if (isNil "_r") then {
  diag_log format ["Log: [fnc_crewUAV] %1, return nil", _this];
  nil;
} else {
  if (configName(LIB_cfgVeh >> _r) == "") then {
    diag_log format ["Log: [fnc_crewUAV] %1, configName %2 == '', return nil", _this, _r];
    nil;
  } else {
    diag_log format ["Log: [fnc_crewUAV] %1, return %2", _this, _r];
    _r;
  };
};
