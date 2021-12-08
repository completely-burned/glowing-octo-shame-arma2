private ["_unit","_type","_tWeap","_r","_z"];

_unit = _this select 0;

_type = typeOf _unit;

//_tWeap = "";

_r = 9999;

//if ((configName(configFile >> "CfgVehicles" >> _type >> "vehicleClass")) != "") then {

  //--- поддержка, медик, инженер, автозаправщик

  //--- свмолет

  //--- вертолет

  //--- дрон

  //--- пво

  //--- механизированые

  //--- моторизированые

  //--- танки

//} else {

  //Launchers.
  /*
  _tWeap = secondaryWeapon _unit;

  if (_tWeap == "") then {
    _tWeap = primaryWeapon _unit;
  };
  */
  _z = 0;

    {


    //if (_tWeap != "") then {


      //_type = getNumber (configFile >> "CfgWeapons" >> _x >> "type");

      switch (getNumber (configFile >> "CfgWeapons" >> _x >> "type")) do
      {
        //Rifles.
        case 1:
        {
          if (getNumber(configFile >> "CfgWeapons" >> _x >> "opticsFlare") == 1) then
          {
            diag_log format ['Log: [fnc_getUnitClass] %1 opticsFlare == 1', [_unit,_x,_z]];
            _z = 9;
          }
          else
          {
            _z = 7;
          }
        };

        //Sidearms.
        case 2:
        {
          _z = 6;
        };

        //Launchers.
        case 4:
        {
          _z = 10;
        };

        //Machineguns.
        case 5:
        {
          //Check autofire to see this is a machinegun.
          if (getNumber(configFile >> "CfgWeapons" >> _x >> "autoFire") == 1) then
          {
            _z = 8;
          }
          else
          {
            //Probably a heavy sniper rifle.
            _z = 9;
          };
        };

        default
        {
          //Explosives?
          if ((getNumber (configFile >> "CfgWeapons" >> _x >> "type") % 256) == 0) then
          {
            _z = 1;
          };
        };
      };

      if (!isNil "_z") then {
        if (_r == 9999 or _z > _r ) then {
          _r = _z;
          _type = _x;
          diag_log format ['Log: [fnc_getUnitClass] %1', [_unit,_type,_r]];
        };
      };

    //};
    } forEach weapons _unit;


  //--- винтовки

  //--- винтовки с оптикой

  //--- снайперские винтовки

  //--- пулеметы

  //--- гранатометы, пзрк

  //--- экзотическое оружие

//};

diag_log format ['Log: [fnc_getUnitClass] %1', [_unit,_type,_r]];


_r;
