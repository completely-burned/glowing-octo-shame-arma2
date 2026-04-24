private ["_list","_true"];
_list = [];
_true = false;
// for "_i" from 0 to ((count (configFile >> "CfgVehicles")) - 1) do {
	// private ["_entry"];
	// _entry = ((configFile >> "CfgVehicles") select _i);
	// if (isClass _entry) then {
		// if ((getNumber(_entry >> "scope")) == 2) then {
			// if (getText(_entry >> "vehicleclass") in ["Backpacks"]) then {
				// if (getText(_entry >> "simulation") in ["house"]) then {
					// if (configName _entry isKindOf "ReammoBox") then {
						// _true = true;
					// };
				// };
			// };
			// if (_true) then {
				// _list set [count _list, configname _entry];
			// };
		// };
	// };
// };
// _list;
{
	if(configName(LIB_cfgVeh >> _x) != "")then{
		_list set [count _list, _x];
	};
}forEach["US_UAV_Pack_EP1","US_Assault_Pack_EP1","US_Assault_Pack_Ammo_EP1","US_Assault_Pack_AmmoSAW_EP1","US_Assault_Pack_AT_EP1","US_Assault_Pack_Explosives_EP1","US_Patrol_Pack_EP1","US_Patrol_Pack_Ammo_EP1","US_Patrol_Pack_Specops_EP1","US_Backpack_EP1","US_Backpack_AmmoMG_EP1","US_Backpack_AT_EP1","US_Backpack_Specops_EP1",
"BAF_AssaultPack_ARAmmo","BAF_AssaultPack_ATAmmo","BAF_AssaultPack_FAC","BAF_AssaultPack_HAAAmmo","BAF_AssaultPack_HATAmmo","BAF_AssaultPack_LRRAmmo","BAF_AssaultPack_MGAmmo","BAF_AssaultPack_RifleAmmo","BAF_AssaultPack_special",
"DE_Backpack_Specops_EP1","CZ_Backpack_EP1","CZ_Backpack_Ammo_EP1","CZ_Backpack_Specops_EP1","CZ_Backpack_AmmoMG_EP1","CZ_VestPouch_EP1","CZ_VestPouch_Sa58_EP1","CZ_VestPouch_M4_EP1",
"TK_RPG_Backpack_EP1","TK_ALICE_Pack_EP1","TK_ALICE_Pack_Explosives_EP1","TK_ALICE_Pack_AmmoMG_EP1","TKA_ALICE_Pack_Ammo_EP1","TKG_ALICE_Pack_AmmoAK47_EP1","TKG_ALICE_Pack_AmmoAK74_EP1","TK_Assault_Pack_EP1","TK_Assault_Pack_RPK_EP1","TKA_Assault_Pack_Ammo_EP1",
"Tripod_Bag","SPG9_TK_INS_Bag_EP1","SPG9_TK_GUE_Bag_EP1","TOW_TriPod_US_Bag_EP1","Metis_TK_Bag_EP1","2b14_82mm_TK_INS_Bag_EP1","2b14_82mm_TK_GUE_Bag_EP1","2b14_82mm_TK_Bag_EP1","M252_US_Bag_EP1","AGS_UN_Bag_EP1","AGS_TK_INS_Bag_EP1","AGS_TK_GUE_Bag_EP1","AGS_TK_Bag_EP1","MK19_TriPod_US_Bag_EP1","KORD_UN_Bag_EP1","KORD_TK_Bag_EP1","KORD_high_UN_Bag_EP1","KORD_high_TK_Bag_EP1","DSHkM_Mini_TriPod_TK_INS_Bag_EP1","DSHkM_Mini_TriPod_TK_GUE_Bag_EP1","DSHKM_TK_INS_Bag_EP1","DSHKM_TK_GUE_Bag_EP1","M2HD_mini_TriPod_US_Bag_EP1","M2StaticMG_US_Bag_EP1"];

// _list;

[];
