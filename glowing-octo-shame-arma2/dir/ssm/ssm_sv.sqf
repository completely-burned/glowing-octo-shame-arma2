if (isServer && missionNamespace getVariable "gosa_AmmoDrop" == 1) then {
  "gosa_SSM_ch_RequestAmmoDrop" addPublicVariableEventHandler {_this + ["AmmoDrop"] call gosa_fnc_SSM_spawnAir};
  diag_log format ["Log: [SSM_ch_RequestAmmoDrop] addPublicVariableEventHandler %1 %2", "AmmoDrop", time];
};

/*
player setVariable ["gosa_SSM_RequestPos", getPos player, true];
gosa_SSM_ch_RequestAmmoDrop = player;
publicVariable "gosa_SSM_ch_RequestAmmoDrop";
*/
