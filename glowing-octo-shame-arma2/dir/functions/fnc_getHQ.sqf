/*
  Скрипт возвращает объект базы.
  TODO: Разные стороны.
  TODO: Устранить конфликт множества штабов.
  TODO: Функция не должна возвращать objNull.
*/

if (!alive (gosa_cache_HQ select 0)) then {
  { // forEach
    if(alive _x
      && {(toLower typeOf _x in (MHQ_list select 0)
          or {toLower typeOf _x in (MHQ_list select 1)})}
    )exitWith{
      gosa_cache_HQ = [_x];
    };
  } forEach vehicles;
};

diag_log format ["Log: [fnc_getHQ] %1", gosa_cache_HQ];
gosa_cache_HQ;
