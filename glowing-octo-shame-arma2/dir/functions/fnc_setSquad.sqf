/*
выбор разрешенных отрядов и тип оружия
и запись их в переменную
*/

diag_log format ['Log: [fnc_setSquad] _this %1', _this];

//--- дополнительное меню
if (count _this < 2) exitWith {

  ["setSquadRole", "gosa_z", [
      "enable " + (gosa_SquadRole_array select 0), // 0
      "disable (not completed) " + (gosa_SquadRole_array select 0), // 1
      "reset " + (gosa_SquadRole_array select 0) // 2
    ], "", "
      [gosa_SquadRole_array, %2] execVM 'dir\functions\fnc_setSquad.sqf';
      gosa_SquadRole_array = nil;
    "
  ] call BIS_FNC_createmenu;

  showCommandingMenu "#USER:gosa_z_0";
};

//--- установка значений
private ["_id","_z"];

_id = _this select 0 select 1; // id другого игрока или тип юнита
_z = _this select 1; // режим

//--- on
if ( _z ==  0 ) then {
  if (typeName _id == typeName "") then {
  if !(_id in gosa_squadOn) then {
    gosa_squadOn = gosa_squadOn + [_id];
  };
  gosa_squadOff = gosa_squadOff - [_id];
  }else{
    if !(_id in gosa_squadOnW) then {
      gosa_squadOnW = gosa_squadOnW + [_id];
    };
    gosa_squadOffW = gosa_squadOffW - [_id];
  };
};

//--- off
if ( _z == 1 ) then {
  if (typeName _id == typeName "") then {
  if !(_id in gosa_squadOff) then {
    gosa_squadOff = gosa_squadOff + [_id];
  };
  gosa_squadOn = gosa_squadOn - [_id];
  }else{
    if !(_id in gosa_squadOffW) then {
      gosa_squadOffW = gosa_squadOffW + [_id];
    };
    gosa_squadOnW = gosa_squadOnW - [_id];
  };
};

//--- reset
if ( _z ==  2 ) then {
  if (typeName _id == typeName "") then {
  gosa_squadOn = gosa_squadOn - [_id];
  gosa_squadOff = gosa_squadOff - [_id];
  }else{
    gosa_squadOnW = gosa_squadOnW - [_id];
    gosa_squadOffW = gosa_squadOffW - [_id];
  };
};

diag_log format ['Log: [fnc_setSquad] On %1', gosa_squadOn];
diag_log format ['Log: [fnc_setSquad] Off %1', gosa_squadOff];
diag_log format ['Log: [fnc_setSquad] OnW %1', gosa_squadOnW];
diag_log format ['Log: [fnc_setSquad] OffW %1', gosa_squadOffW];
