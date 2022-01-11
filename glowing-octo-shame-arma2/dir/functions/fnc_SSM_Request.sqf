  private ["_var","_rp","_rt","_b","_var","_val","_fnc","_ch","_hq","_p"];

  if (playerSide != civilian) then {
    // request pos (position array), request type (string),
    _rp = [(_this select 0) select 0, (_this select 0) select 1];
    _rt = _this select 1;

/*
    // Disable Cease Fire
    _var = "BIS_SSM_CEASEFIRE_" + BIS_SSM_str_side_player;
    missionnamespace setVariable [_var , false];
    publicvariable _var;
*/
    // Store the request Position in the player's object
    _p = player;
    _p setvariable ["gosa_SSM_RequestPos",_rp,true];

    // bool value of permission to proceed
    _b= true;
    // Evaluate Mission Designer condition if given
    /*
    _val = missionnamespace getVariable ("BIS_SSM_"+_rt+"_CONDITION");
    call compile ("_b= "+_val );*/

/*
    _hq = missionnamespace getVariable ("BIS_SSM_HQ"+BIS_SSM_str_side_player);
    [_b,_rp,_rt,_hq,player] spawn BIS_SSM_fnc_RequestRadio;
*/

    if (_b) then {
      // Call Mission Designers Code
      /*
      _var = "BIS_SSM_"+_rt+"_EXPRESSION";
      _val = missionnamespace getVariable _var;
      if (not isNil _val) then {_this spawn _val;};*/

      // singleplayer call
      /*
      if (_rt == "AmmoDrop" or _rt == "UnitsDrop" or _rt == "Airstrike")
      then {["gosa_SSM_ch_Request"+_rt,player,_rt] call BIS_SSM_fnc_SpawnAircraft;};
      if (_rt == "Mortar" or _rt == "Artillery")
      then {["BIS_SSM_ch_Request"+_rt,player,_rt] spawn BIS_SSM_fnc_SpawnFireMission;};*/

      // multiplayer call
      _ch = "gosa_SSM_ch_Request"+ _rt;
      missionnamespace setvariable [_ch, _p];
      publicvariable _ch;
    };
  };
