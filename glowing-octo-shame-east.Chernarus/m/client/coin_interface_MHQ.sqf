if (!isNil{draga_MHQ}) then {
  _pos = getPos (_this select 3);
  _dir = getDir (_this select 3);
  deleteVehicle (_this select 3);
  _veh = draga_MHQ createvehicle _pos;
  _veh setDir _dir;
  _veh setVectorUp [0,0,1];
  player reveal _veh;
};
