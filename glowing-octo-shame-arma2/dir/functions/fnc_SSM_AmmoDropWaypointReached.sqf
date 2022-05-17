
diag_log format ["Log: [fnc_SSM_AmmoDropWaypointReached] %1", [_this, this, thisList]];

#define BIS_SSM_CargoParachute "ParachuteMediumWest_EP1"

// WaypointStatements не нужно выполнять на всех устройствах
if (local this) then {
  // WaypointStatements зацикливается
  if (isNil {this getVariable "gosa_SSM_WaypointReached"}) then {





    gosa_SSM_CreateAmmoDrop=
    {
      diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1", _this];
      private ["_pilot","_pos","_class","_para","_drop","_dir","_b","_time"];
      _pilot = _this select 0;
      _grp = group _pilot;
      _veh = vehicle _pilot;
      diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 %2 %3", _veh, typeOf _veh, _grp];

      // Index of the Ammo Drop Classes Array
      _n = _this select 1;
      _pos = position vehicle _pilot;

      if (_n >= 2) exitWith {
        //--- отпуск
        diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 end", _veh];

        for "_i" from count waypoints _grp - 1 to 0 step -1 do {
          deleteWaypoint [_grp, _i];
        };

        //_veh land "NONE";

        _grp setVariable ["gosa_SSM_SupportCaller", nil];
        _pilot setVariable ["gosa_SSM_WaypointReached", nil];

        //--- чиска
        _time = time+60;
        {
          _z = _x getVariable "gosa_tmpObj";
          if (!isNil "_z" && {_z == "AmmoDrop"}) then {
            _x setVariable ["gosa_timeDeleteVehicle", _time];
            diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 GC set_timeDeleteVehicle %2", _x, _time];
          };
        } forEach [_veh]+crew _veh;
      };

      //_class = (missionnamespace getVariable ("BIS_SSM_AmmoDrop_BOX_" + str side _pilot)) select _n;
      _class = ["UNBasicWeapons_EP1","GuerillaCacheBox"] select _n;
      // TODO: Устранить возможность столкновения на высоте 2000.
      _para = BIS_SSM_CargoParachute createVehicle [_pos select 0,_pos select 1,2000];
      _para setpos [_pos select 0,_pos select 1,(_pos select 2) -10];    debuglog ["Log:::::::::::::",(_pos select 2)];
      _drop = _class createVehicle [_pos select 0,_pos select 1,2000];

      _drop attachTo [_para, [0,0,1]];
      _para setVelocity [((velocity vehicle _pilot) select 0)/2, ((velocity vehicle _pilot) select 1)/2,((velocity vehicle _pilot) select 2)/2];
      sleep 0.02;

      // For some reason, this command is not always performing as it suppose to, therefore, we repeat it to make sure. (network lag?)
      _drop attachTo [_para, [0,0,1]];
      _para setVelocity [((velocity vehicle _pilot) select 0)/2, ((velocity vehicle _pilot) select 1)/2,((velocity vehicle _pilot) select 2)/2];
      sleep 0.02;

      _drop attachTo [_para, [0,0,1]];
      _para setVelocity [((velocity vehicle _pilot) select 0)/2, ((velocity vehicle _pilot) select 1)/2,((velocity vehicle _pilot) select 2)/2];
      sleep (0.05 + random 0.2);

      // Call this function recursive, to dropp varius boxes
      _n = _n+1;
      //_b = (count (missionnamespace getVariable ("BIS_SSM_AmmoDrop_BOX_" + str side _pilot))) > _n;

      _time = time+60;
      // If the Drop hits the ground, recreate it over ground
      WaitUntil{(_para distance _veh > 30)
        or ((getPosATL _drop select 2) < 0.01)
        or (time > _time)};
      //if (_b) then {[_pilot,_n] spawn gosa_SSM_CreateAmmoDrop;};
      [_pilot,_n] spawn gosa_SSM_CreateAmmoDrop;

      // failover
      _time = time+60;
      // If the Drop hits the ground, recreate it over ground
      WaitUntil{(getPosATL _drop select 2) < 0.01 or time > _time};
      _pos = position _drop;
      _dir = direction _para;
      detach _drop;
      deletevehicle _drop;
      _para setVariable ["gosa_timeDeleteVehicle", time+10];
      //_drop = _class createVehicle _pos;
      _drop = createVehicle [_class, [_pos select 0, _pos select 1,0], [], 0, "CAN_COLLIDE"];
      _drop setdir _dir;
      //_drop setPos [_pos select 0, _pos select 1,0];
    };

    gosa_SSM_CreateAmmoDrop2 = {
      private ["_pilot","_pos","_class","_para","_drop","_dir","_b","_z","_veh","_grp"];

      diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1", _this];

      _pilot = _this select 0;
      _grp = group _pilot;
      _veh = vehicle _pilot;

      if (true) then {


        // TODO: эти проверки должны быть перед функцией
        if (_veh == _pilot or isNull _veh or isNull _grp or _veh isKindOf "ParachuteBase") exitWith {
          diag_log format ["Log: [gosa_SSM_CreateAmmoDrop] %1 %2 %3", _veh, typeOf _veh, _grp];
          _pilot setVariable ["gosa_SSM_WaypointReached", nil];
        };

        _n = _this select 1;

        // TODO: нужна функция
        _class = ["UNBasicWeapons_EP1","GuerillaCacheBox"];

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
        // land "LAND" выключает двигатель
        while {isEngineOn _veh && alive _veh} do {
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
