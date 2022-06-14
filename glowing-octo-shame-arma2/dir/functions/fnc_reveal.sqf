if ((_this select 2) distance (_this select 1) < 1000) then {
  if (_this select 0 knowsAbout (_this select 1) < 1.5) then {
    diag_log format ["Log: [fnc_reveal] %1 reveal %2", _this select 0, _this select 1];
    #ifdef __A2OA__
    _this select 0 reveal [_this select 1, 1.5];
    #else
      _this select 0 reveal _this select 1;
    #endif
  };
};
