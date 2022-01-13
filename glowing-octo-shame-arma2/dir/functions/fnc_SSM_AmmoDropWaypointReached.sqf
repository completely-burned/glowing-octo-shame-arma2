
diag_log format ["Log: [fnc_SSM_AmmoDropWaypointReached] %1", [_this, this, thisList]];


// WaypointStatements не нужно выполнять на всех устройствах
if (local this) then {
  // WaypointStatements зацикливается
  if (isNil {this getVariable "gosa_SSM_WaypointReached"}) then {






    gosa_SSM_CreateAmmoDrop = {
      private ["_pilot","_pos","_class","_para","_drop","_dir","_b","_z","_veh","_grp"];

      diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1", _this];

      _pilot = _this select 0;
      _grp = group _pilot;
      _veh = vehicle _pilot;

      if (true) then {


        if (_veh == _pilot or isNull _veh or isNull _grp or _veh isKindOf "ParachuteBase") exitWith { // TODO: эти проверки должны быть перед функцией
          diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 %2 %3", _veh, typeOf _veh, _grp];
          _pilot setVariable ["gosa_SSM_WaypointReached", nil];
        };

        _n = _this select 1;

        _class = ["UNBasicWeapons_EP1","GuerillaCacheBox"]; // TODO: нужна функция

        /*
        if (configName(configFile >> "CfgVehicles" >> _class) == "") exitWith {
          diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 configName '' ", _class];
        };*/


        //--- посадка
        diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 LAND", _veh];

        // возможно это придаст надежности
        _grp setCombatMode "BLUE";
        _grp setBehaviour "CARELESS";

        // land "GET OUT" поднимает вверх тс при стонкновении или атаке
        // FIXME: land "LAND" поднимает вверх тс при стонкновении или атаке
        _veh land "LAND";


        //--- ожидание посадки
        //while {(getPosATL _veh select 2 > 5 or speed _veh > 0.01) && alive _veh} do {
        while {isEngineOn _veh && alive _veh} do { // land "LAND" выключает двигатель
          sleep 1;
        };

        /*if !(alive _veh) exitWith {
          diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 dead", _veh];
        };*/

        diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 LANDed", _veh];


        // если экипаж уничтожен выгрузить нужно ящики все сразу
        for "_i" from 1 to 14 do {
          //--- если может лететь и ком.экипажа жив ожидание
          if (alive effectiveCommander _veh && canMove _veh) then {sleep 1};
        };

        //--- выгрузка
        {
          //if (alive _veh) then {
            _pos = getPos _veh;

            // TODO: растояние между ящиком и вертолетом нужно сделать меньше
            // CAN_COLLIDE создает ящик внутри другого объекта
            _z = createVehicle [_x, [_pos select 0, _pos select 1,0], [], 10, "NONE"];
            diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 drop", _z];

            // TODO: нужно добавлять оружие в зависимости колличества врагов вокруг
            //if (toLower _x in ["guerillacachebox","guerillacachebox_ep1"]) then {
              _z addMagazineCargoGlobal ["PG7VR", 3];
              _z addMagazineCargoGlobal ["PG7VL", 3];
              _z addMagazineCargoGlobal ["PG7V", 3];
            //};
          //};

          for "_i" from 1 to 3 do {
            if (alive effectiveCommander _veh && canMove _veh) then {sleep 1};
          };
        } forEach _class;


        sleep 7;

      };

      //--- отпуск
      diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 end", _veh];

      for "_i" from count waypoints _grp - 1 to 0 step -1 do {
        deleteWaypoint [_grp, _i];
      };

      _veh land "NONE";

      _grp setVariable ["gosa_SSM_SupportCaller", nil];
      _pilot setVariable ["gosa_SSM_WaypointReached", nil];

      //--- чиска
      // TODO: тс взятые с карты нужно исключить
      _z = 60;
      {
        _x setVariable ["gosa_timeDeleteVehicle", _z];
      } forEach [_veh]+crew _veh;

    }; // fnc






    this setVariable ["gosa_SSM_WaypointReached", [this,0] spawn gosa_SSM_CreateAmmoDrop];

  //} else {
    // TODO: удалить WaypointStatements
  };
};
