/*
Интерфейса нет.
Скипт убирает штаб и на его месте создает штабной транспорт.
*/

diag_log format ["Log: [coin_interface_MHQ] %1", _this];

if (isNil "gosa_fnc_get_MHQ_type") then {
  diag_log format ["Log: [coin_interface_MHQ] isNil gosa_fnc_get_MHQ_type", nil];
  hint "Error, isNil gosa_fnc_get_MHQ_type"
}else{
  _pos = getPos (_this select 3);
  _dir = getDir (_this select 3);
  _type = typeOf (_this select 3);
  deleteVehicle (_this select 3);
  // FIXME: gosa_posDefaultHiden возможно создает проблемы
  _veh = _type call gosa_fnc_get_MHQ_type createvehicle [(gosa_posDefaultHiden select 0) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)), (gosa_posDefaultHiden select 1) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2))];
  _veh setDir _dir;
  _veh setPos _pos;
  diag_log format ["Log: [coin_interface_MHQ] created %1, removed %2", _veh, _this select 3];
  _veh setVectorUp [0,0,1];
  player reveal _veh;
};
