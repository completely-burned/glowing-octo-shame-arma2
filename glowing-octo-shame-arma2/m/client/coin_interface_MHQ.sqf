if (!isNil{gosa_fnc_get_MHQ_type}) then {
  _pos = getPos (_this select 3);
  _dir = getDir (_this select 3);
  _type = typeOf (_this select 3);
  deleteVehicle (_this select 3);
  _veh = _type call gosa_fnc_get_MHQ_type createvehicle [(gosa_posDefaultHiden select 0) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)), (gosa_posDefaultHiden select 1) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2))];
  _veh setDir _dir;
  _veh setPos _pos;
  _veh setVectorUp [0,0,1];
  player reveal _veh;
};
