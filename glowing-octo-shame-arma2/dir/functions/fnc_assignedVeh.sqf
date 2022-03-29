private "_r";
_r = assignedVehicle _this;
if (isNull _r) then {
  _r = vehicle _this;
  if (_r == _this) then {
    // FIXME: на клиенте "Log: [fnc_assignedVeh] O 1-1-D:4 REMOTE, 32e3d650# 427973: uaz_granade.p3d REMOTE, local false"
    // FIXME: на клиенте "Log: [fnc_assignedVeh] R 1-1-B:1 REMOTE, R 1-1-B:2 REMOTE, local false"
    _r = _this getVariable "gosa_assignedVehicle";
    if (isNil "_r") then {
      _r = objNull;
    };
    diag_log format ["Log: [fnc_assignedVeh] %1, %2, local %3, var", _this, _r, local _this];
  } else { // diag_log
    diag_log format ["Log: [fnc_assignedVeh] %1, %2, local %3, veh", _this, _r, local _this];
  };
} else { // diag_log
  diag_log format ["Log: [fnc_assignedVeh] %1, %2, local %3", _this, _r, local _this];
};
_r;
