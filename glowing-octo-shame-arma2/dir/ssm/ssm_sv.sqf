if (isServer && missionNamespace getVariable "gosa_AmmoDrop" == 1) then {
  "gosa_SSM_ch_RequestAmmoDrop" addPublicVariableEventHandler {_this + ["AmmoDrop"] call gosa_fnc_SSM_spawnAir};
};

/*
player setVariable ["gosa_SSM_RequestPos", getPos player, true];
gosa_SSM_ch_RequestAmmoDrop = player;
publicVariable "gosa_SSM_ch_RequestAmmoDrop";
*/
