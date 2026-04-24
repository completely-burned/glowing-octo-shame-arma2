// OFrP
if (configName(_cfgVeh >> "OFrP_Soldier_Inf_TeamLeader") == "") then {
	_b = false;
}else{
	_n = missionNamespace getVariable ("gosa_faction_multiplier_"+"OFrP");
	if (_n > 0) exitWith {_b = true};
	if (_IslandType select 1 >= 1990 && _n == -1) exitWith {_b = true};
	_b = false;
};
if (_b) then {
	_west=_west+[
		[[[["OFrP_Tiger_HAD_CE","OFrP_Tiger_HAD_CE"],[[0,15,0],[15,0,0]],
			[_r4,_r3]]],0.2],
		[[[["OFrP_Tiger_HAP_CE","OFrP_Tiger_HAP_CE"],[[0,15,0],[15,0,0]],
			[_r4,_r3]]],0.02],
		[[[["OFrP_Rafale_B1","OFrP_Rafale_B1"],[[0,20,0],[20,0,0]],
			[_r4,_r3]]],0.05],
		[[[["OFrP_Rafale_M3","OFrP_Rafale_M3"],[[0,20,0],[20,0,0]],
			[_r4,_r3]]],0.05],
		[[[["OFrP_Mirage_5","OFrP_Mirage_5"],[[0,20,0],[20,0,0]],
			[_r4,_r3]]],0.05],

		[[[["OFrP_TE_Integral_Inf1","OFrP_Spotter_Integral_Inf1"],[[0,5,0],[3,0,0]],
			[_r2,_r2]]],0.05]
	];
	if(!_deserted)then{
		_west=_west+[
			[[[["OFrP_Caracal"],[],
				[_r3]],[["OFrP_Soldier_Inf_TeamLeader","OFrP_Soldier_Inf_Maximi","OFrP_Soldier_Inf_SniperFRF2","OFrP_Soldier_Inf","OFrP_Soldier_Inf_Radio","OFrP_Soldier_Inf","OFrP_Soldier_Inf_ABL","OFrP_Soldier_Inf_ERYX","OFrP_Soldier_Inf_Medic"]]
				],0.1],
			[[[["OFrP_Puma_CE_Pirate"],[],[_r3]]],0.1],

			[[[["OFrP_Soldier_CoS_TeamLeader","OFrP_Soldier_CoS_Medic","OFrP_Soldier_CoS_Minimi","OFrP_Soldier_CoS_Grenadier","OFrP_Soldier_COS_Radio","OFrP_Soldier_CoS"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[-3,0,0],[-5,0,0]],
				[_r3,_r2,_r2,_r1,_r1,_r1]]],0.01],
			[[[["OFrP_Soldier_CoS_TeamLeader","OFrP_Soldier_CoS_Medic","OFrP_Soldier_CoS_Laser","OFrP_Soldier_COS_SniperFRF2","OFrP_Soldier_CoS"],[[0,5,0],[-3.5,0,0],[-1.5,0,0],[1.5,0,0],[3.5,0,0]],
				[_r3,_r2,_r2,_r1,_r1]]],0.01],

			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_PVP_ANF1","OFrP_PVP_WASP","OFrP_Soldier_Inf_Grenadier"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],
				[_r2,_r2,_r1,_r1]]],0.05],
			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_PVP_WASP_MILAN","OFrP_PVP_WASP_MILAN","OFrP_Soldier_Inf_Grenadier"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],
				[_r2,_r2,_r1,_r1]]],0.05],
			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_VAB_TOP127","OFrP_Soldier_Inf","OFrP_Soldier_Inf_SniperFRF2","OFrP_Soldier_Inf_ABL","OFrP_Soldier_Inf_Maximi","OFrP_Soldier_Inf_Maximi","OFrP_Soldier_Inf_Medic","OFrP_Soldier_Inf_Grenadier"],[[0,5,0],[-3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
				[_r3,_r2,_r0,_r1,_r1,_r1,_r0,_r2,_r2]]],0.05],

			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_Soldier_Inf_Scout","OFrP_Soldier_Inf_Radio","OFrP_Soldier_Inf_SniperFRF2","OFrP_Soldier_Inf_SniperFRF2"],[],
				[_r4,_r3,_r2,_r1,_r1]]],0.1],
			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_Soldier_Inf_Medic","OFrP_Soldier_Inf_Grenadier","OFrP_Soldier_Inf_Maximi","OFrP_Soldier_Inf_ABL","OFrP_Soldier_Inf","OFrP_Soldier_Inf_ABL"],[],
				[_r3,_r2,_r2,_r1,_r1,_r0,_r0]]],0.05],
			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_Soldier_Inf_Maximi","OFrP_Soldier_Inf_SniperFRF2","OFrP_Soldier_Inf","OFrP_Soldier_Inf_Radio","OFrP_Soldier_Inf","OFrP_Soldier_Inf_ABL","OFrP_Soldier_Inf_ERYX","OFrP_Soldier_Inf_Medic"],[],
				[_r3,_r2,_r2,_r0,_r1,_r0,_r1,_r1,_r2]]],0.05],
			[[[["OFrP_Soldier_Inf_TeamLeader","OFrP_Soldier_Inf_ERYX","OFrP_Soldier_Inf_ERYX","OFrP_Soldier_Inf_LRAC89","OFrP_Soldier_Inf_LRAC89"],[],
				[_r2,_r2,_r1,_r1,_r1]]],0.05],

			[[[["OFrP_Leclerc","OFrP_Leclerc","OFrP_Leclerc"],[[0,5,0],[5,0,0],[9,0,0]],
				[_r4,_r3,_r2]]],0.1],
			[[[["OFrP_AMX30B2","OFrP_AMX30B2","OFrP_AMX30B2","OFrP_AMX30B2"],[[0,5,0],[5,0,0],[9,0,0],[13,0,0]],
				[_r4,_r3,_r3,_r2]]],0.1],
			[[[["OFrP_10RC","OFrP_10RC","OFrP_10RC"],[[0,5,0],[5,0,0],[9,0,0]],
				[_r4,_r3,_r2]]],0.1],
			[[[["OFrP_10RCR","OFrP_10RCR","OFrP_10RCR"],[[0,5,0],[5,0,0],[9,0,0]],
				[_r4,_r3,_r2]]],0.1]
		];
	};
	if(!_woodland)then{
		_west=_west+[
			[[[["OFrP_Caracal"],[],
				[_r3]],[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE_SniperFRF2","OFrP_Soldier_Inf_DE_Grenadier","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_Radio","OFrP_Soldier_Inf_DE_ABL","OFrP_Soldier_Inf_DE_ERYX","OFrP_Soldier_Inf_DE_Medic"]]
				],0.1],
			[[[["OFrP_Puma_DE_Pirate"],[],[_r3]]],0.1],

			[[[["OFrP_Soldier_CoS_DE_TeamLeader","OFrP_Soldier_CoS_DE_Medic","OFrP_Soldier_CoS_DE_Maximi","OFrP_Soldier_CoS_DE_Grenadier","OFrP_Soldier_COS_DE_Radio","OFrP_Soldier_CoS_DE"],[[0,5,0],[3,0,0],[5,0,0],[7,0,0],[-3,0,0],[-5,0,0]],
				[_r3,_r2,_r2,_r1,_r1,_r1]]],0.01],
			[[[["OFrP_Soldier_CoS_DE_TeamLeader","OFrP_Soldier_CoS_DE_Medic","OFrP_Soldier_CoS_DE_Laser","OFrP_Soldier_COS_DE_SniperHK417","OFrP_Soldier_CoS_DE"],[[0,5,0],[-3.5,0,0],[-1.5,0,0],[1.5,0,0],[3.5,0,0]],
				[_r3,_r2,_r2,_r1,_r1]]],0.01],

			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_VBL_ANF1_desert","OFrP_VBL_127_desert","OFrP_Soldier_Inf_DE_Grenadier"],[[0,5,0],[-5,0,0],[-5,-7,0],[3,0,0]],
				[_r2,_r2,_r1,_r1]]],0.1],
			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_VAB_127_desert","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_SniperFRF2","OFrP_Soldier_Inf_DE_LRAC89","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE_Medic","OFrP_Soldier_Inf_DE_Grenadier"],[[0,5,0],[-3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
				[_r3,_r2,_r0,_r1,_r1,_r0,_r1,_r2,_r2]]],0.1],
			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_VBCI_vci_desert","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_SniperFRF2","OFrP_Soldier_Inf_DE_ABL","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_Medic","OFrP_Soldier_Inf_DE_Grenadier"],[[0,5,0],[-3,0,0],[5,0,0],[7,0,0],[9,0,0],[11,0,0],[13,0,0],[15,0,0],[17,0,0]],
				[_r3,_r2,_r0,_r1,_r1,_r1,_r0,_r2,_r2]]],0.1],

			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_Soldier_Inf_DE_Scout","OFrP_Soldier_Inf_DE_Radio","OFrP_Soldier_Inf_DE_SniperFRF2","OFrP_Soldier_Inf_DE_SniperFRF2"],[],
				[_r4,_r3,_r2,_r1,_r1]]],0.1],
			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_Soldier_Inf_DE_Medic","OFrP_Soldier_Inf_DE_Grenadier","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE_ABL","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_LRAC89"],[],
				[_r3,_r2,_r2,_r1,_r1,_r0,_r0]]],0.1],
			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_Soldier_Inf_DE_Maximi","OFrP_Soldier_Inf_DE_SniperFRF2","OFrP_Soldier_Inf_DE_Grenadier","OFrP_Soldier_Inf_DE","OFrP_Soldier_Inf_DE_Radio","OFrP_Soldier_Inf_DE_ABL","OFrP_Soldier_Inf_DE_ERYX","OFrP_Soldier_Inf_DE_Medic"],[],
				[_r3,_r2,_r2,_r2,_r0,_r1,_r0,_r1,_r1]]],0.1],
			[[[["OFrP_Soldier_Inf_DE_TeamLeader","OFrP_Soldier_Inf_DE_ERYX","OFrP_Soldier_Inf_DE_ERYX","OFrP_Soldier_Inf_DE_LRAC89","OFrP_Soldier_Inf_DE_LRAC89"],[],
				[_r2,_r2,_r1,_r1,_r1]]],0.1],

			[[[["OFrP_Leclerc_desert","OFrP_Leclerc_desert","OFrP_Leclerc_desert"],[[0,5,0],[5,0,0],[9,0,0]],
				[_r4,_r3,_r2]]],0.1],
			[[[["OFrP_10RC_desert","OFrP_10RC_desert","OFrP_10RC_desert"],[[0,5,0],[5,0,0],[9,0,0]],
				[_r4,_r3,_r2]]],0.1],
			[[[["OFrP_10RCR_desert","OFrP_10RCR_desert","OFrP_10RCR_desert"],[[0,5,0],[5,0,0],[9,0,0]],
				[_r4,_r3,_r2]]],0.1]
		];
	};
};