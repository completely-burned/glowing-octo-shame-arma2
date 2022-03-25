private "_r";
_r = assignedVehicle _this;
if (isNull _r) then {
  _r = vehicle _this;
  if (_r == _this) then {
    _r = _this getVariable "gosa_assignedVehicle";
    diag_log format ["Log: [fnc_assignedVeh] %1, %2, local %3, var", _this, _r, local _this];
    if (isNil "_r") then {
      _r = objNull;
    };
  } else { // diag_log
    diag_log format ["Log: [fnc_assignedVeh] %1, %2, local %3, veh", _this, _r, local _this];
  };
} else { // diag_log
  diag_log format ["Log: [fnc_assignedVeh] %1, %2, local %3", _this, _r, local _this];
};
_r;
