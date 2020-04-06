if (!isNil{fnc_get_MHQ_type}) then {
  _pos = getPos (_this select 3);
  _dir = getDir (_this select 3);
  _type = typeOf (_this select 3);
  deleteVehicle (_this select 3);
  _veh = _type call fnc_get_MHQ_type createvehicle [(draga_posDefaultHiden select 0) + ((random draga_posDefaultHidenRandom) - (draga_posDefaultHidenRandom/2)), (draga_posDefaultHiden select 1) + ((random draga_posDefaultHidenRandom) - (draga_posDefaultHidenRandom/2))];
  _veh setDir _dir;
  _veh setPos _pos;
  _veh setVectorUp [0,0,1];
  player reveal _veh;
};
