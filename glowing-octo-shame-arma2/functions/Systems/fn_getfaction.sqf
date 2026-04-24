/*
  возвращает фракцию
 */

getText (configFile >> "CfgVehicles" >> (
    if (typeName _this == typeName objNull) then {
      typeOf _this
    }else{
      _this
    }
  ) >> "faction")
