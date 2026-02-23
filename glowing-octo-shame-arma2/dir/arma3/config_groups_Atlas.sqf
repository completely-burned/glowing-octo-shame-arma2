// ls_zim35_o_zna_groups
#define __cfg configFile >> "CfgGroups" >> "East" >> "ls_zim35_o_zna_groups"
_arr = [
// Infantry Infantry
// ls_zim35_o_g_zna_riflesquad Rifle Squad
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_riflesquad"]],1],
// ls_zim35_o_g_zna_weapon_squad Weapon Squad
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_weapon_squad"]],0.5],
// ls_zim35_o_g_zna_aa_team AA Team
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_aa_team"]],0.2],
// ls_zim35_o_g_zna_at_team AT Team
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_at_team"]],0.4],
// ls_zim35_o_g_zna_support_team Support Team
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_support_team"]],0.05],
// ls_zim35_o_g_zna_sentry Sentry
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_sentry"]],0.05],
// ls_zim35_o_g_zna_fireteam Fire team
[[[__cfg >> "Infantry" >> "ls_zim35_o_g_zna_fireteam"]],0.3]
];
[_arr] call gosa_fnc_groups_convNormal;
_arr = [_arr, _copyRef] call gosa_fnc_filtering_squads_byAvail_v2;
[_groups_map, east, "ls_zim35_o_zna_groups", _arr,
	gosa_date_default, [275,999],
	[]
] call gosa_fnc_map_groups_add;
