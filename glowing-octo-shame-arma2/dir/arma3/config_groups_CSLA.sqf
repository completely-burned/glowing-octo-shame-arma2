_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"CSLA");
if (_tmp > 0 or (_tmp == -1 && _d >= 1960 && _d <= 1990)) then {
	if (_tmp > 0 or _n >= 160) then {
_east append [
	// configName CSLA_T72Mptn
	[[[["CSLA_T72M","CSLA_T72M","CSLA_T72M"],[[0,0,0],[50,0,0],[-50,0,0]],["Lieutenant","Sergeant","Sergeant"]]],0.5],
	// configName CSLA_T72infTeam
	[[[["CSLA_T72M","CSLA_mrVG70","CSLA_mrRPG75","CSLA_mrSa58P","CSLA_mrUK59L"],[[0,0,0],[1.5,-5.5,0],[-1.5,-5.5,0],[2.5,-2.5,0],[-2.5,-2.5,0]],["Sergeant","Corporal","Private","Private","Private"]]],0.5],
	// configName CSLA_mrSqdBVP1
	[[[["CSLA_mrSgt","CSLA_mrRPG75","CSLA_mrSa58Pp","CSLA_mrVG70","CSLA_mrVG70","CSLA_mrUK59L","CSLA_mrUK59L","CSLA_BVP1"],[[3,-4.5,0],[-3,-4.5,0],[3,1.5,0],[-3,1.5,0],[-1.5,-5.5,0],[3,-1.5,0],[-3,-1.5,0],[0,0,0]],["Sergeant","Corporal","Corporal","Private","Private","Private","Private","Corporal"]]],0.5],
	// configName CSLA_mrSqdOT64
	[[[["CSLA_mrSgt","CSLA_mrVG70","CSLA_mrVG70","CSLA_mrSa58Pp","CSLA_mrRPG7","CSLA_mrRPG75","CSLA_mrRPG7a","CSLA_mrUK59L","CSLA_mrUK59L","CSLA_OT64C"],[[1,-5.5,0],[2.5,-2,0],[-2.5,-2,0],[2.5,1,0],[-2.5,1,0],[2.5,4.5,0],[-2.5,4.5,0],[1,-4,0],[-1,-4,0],[0,0,0]],["Sergeant","Corporal","Corporal","Private","Private","Private","Private","Private","Private","Corporal"]]],0.5],
	// configName CSLA_mrSqdOT62
	[[[["CSLA_mrSgt","CSLA_mrVG70","CSLA_mrVG70","CSLA_mrSa58Pp","CSLA_mrRPG7","CSLA_mrRPG75","CSLA_mrRPG7a","CSLA_mrUK59L","CSLA_mrUK59L","CSLA_OT62"],[[1,-5.5,0],[2.5,-2,0],[-2.5,-2,0],[2.5,1,0],[-2.5,1,0],[2.5,4.5,0],[-2.5,4.5,0],[1,-4,0],[-1,-4,0],[0,0,0]],["Sergeant","Corporal","Corporal","Private","Private","Private","Private","Private","Private","Corporal"]]],0.5],
	// configName CSLA_mrADTeamOT65
	[[[["CSLA_mr9K32","CSLA_mr9K32","CSLA_mr9K32","CSLA_OT65A"],[[2.5,1,0],[-2.5,-2,0],[2.5,-2,0],[0,0,0]],["Sergeant","Corporal","Private","Corporal"]]],0.5],
	// configName CSLA_cpSentryTeam
	[[[["CSLA_rSa58P","CSLA_rSa58P"],[[0,0,0],[4,0,0]],["Corporal","Private"]]],0.5],
	// configName CSLA_cpFireTeam
	[[[["CSLA_rSa58P","CSLA_rSa58P","CSLA_rUK59L"],[[0,0,0],[4,0,0],[-4,0,0]],["Corporal","Private","Private"]]],0.5],
	// configName CSLA_cpRifleTeam
	[[[["CSLA_rSa58P","CSLA_rSa58P","CSLA_rSa58P","CSLA_rRPG75"],[[0,0,0],[4,0,0],[-4,0,0],[0,-4,0]],["Corporal","Private","Private","Private"]]],0.5],
	// configName CSLA_rSqd
	[[[["CSLA_rSgt","CSLA_rRPG7","CSLA_rRPG75","CSLA_rRPG7a","CSLA_rVG70","CSLA_rVG70","CSLA_rUK59L","CSLA_rUK59L"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0],[-24,0,0],[32,0,0]],["Sergeant","Corporal","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName CSLA_rTeam
	[[[["CSLA_rSa58P","CSLA_rRPG75","CSLA_rVG70","CSLA_rUK59L"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0]],["Corporal","Private","Private","Private"]]],0.5],
	// configName CSLA_rPLTeam
	[[[["CSLA_rOfc","CSLA_rRF10","CSLA_rOP63","CSLA_rMedi"],[[0,0,0],[4,-4,0],[-4,-4,0],[0,-8,0]],["Lieutenant","Corporal","Corporal","Corporal"]]],0.5],
	// configName CSLA_rUK59Team
	[[[["CSLA_rUK59a","CSLA_rUK59m","CSLA_rUK59m"],[[0,0,0],[2,-1,0],[-3,-2,0]],["Corporal","Private","Private"]]],0.5],
	// configName CSLA_rM52Team
	[[[["CSLA_rM52g","CSLA_rM52a","CSLA_rM52m","CSLA_rM52m"],[[0,0,0],[2,-1,0],[-4,-2,0],[6,-2,0]],["Corporal","Private","Private","Private"]]],0.5],
	// configName CSLA_rT21Team
	[[[["CSLA_rT21","CSLA_rT21a","CSLA_rT21a"],[[0,0,0],[2,-1,0],[-4,-2,0]],["Corporal","Private","Private"]]],0.5],
	// configName CSLA_r9P135MTeam
	[[[["CSLA_r9P135M","CSLA_r9M113","CSLA_r9M113"],[[0,0,0],[2,-1,0],[-4,-2,0]],["Corporal","Private","Private"]]],0.5],
	// configName CSLA_rADTeamAZU
	[[[["CSLA_AZU","CSLA_r9K32","CSLA_r9K32","CSLA_r9K32"],[[0,0,0],[2.5,1,0],[-2.5,-2,0],[2.5,-2,0]],["Corporal","Sergeant","Corporal","Private"]]],0.5],
	// configName CSLA_rADTeamInf
	[[[["CSLA_r9K32","CSLA_r9K32","CSLA_r9K32","CSLA_rUK59L"],[[0,0,0],[2,-2,0],[-2,-2,0],[0,-4,0]],["Sergeant","Corporal","Private","Private"]]],0.5],
	// configName CSLA_rADTeamV3S
	[[[["CSLA_rSgt","CSLA_V3S","CSLA_rRF10","CSLA_rSa58V","CSLA_rUK59L","CSLA_rUK59L","CSLA_rRPG7","CSLA_rRPG7a","CSLA_rMedi","CSLA_rVG70","CSLA_r9K32"],[[3,-3,0],[0,0,0],[0,-12,0],[-3,-3,0],[-3,-9,0],[3,-9,0],[3,-12,0],[-3,-12,0],[0,-15,0],[3,-15,0],[-3,-15,0]],["Sergeant","Corporal","Private","Private","Private","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName CSLA_abSqd
	[[[["CSLA_ptSgt","CSLA_ptSa58Pp","CSLA_ptVG70","CSLA_ptVG70","CSLA_ptRPG75","CSLA_ptRPG75","CSLA_ptUK59","CSLA_ptUK59"],[[0,0,0],[4,-4,0],[0,-8,0],[4,-12,0],[0,-16,0],[4,-20,0],[0,-24,0],[4,-28,0]],["Sergeant","Corporal","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName CSLA_abDtmt
	[[[["CSLA_ptSgt","CSLA_ptUK59","CSLA_ptOP63","CSLA_ptSa58Pp","CSLA_ptSa58Pp","CSLA_ptRF10","CSLA_ptMedi","CSLA_ptMedi","CSLA_ptVG70","CSLA_ptVG70","CSLA_ptSpr","CSLA_ptSpr","CSLA_ptRPG75","CSLA_ptRPG75","CSLA_ptUK59","CSLA_ptUK59"],[[0,0,0],[4,-4,0],[0,-8,0],[4,-12,0],[0,-16,0],[4,-20,0],[0,-24,0],[4,-28,0],[0,-32,0],[4,-36,0],[0,-40,0],[4,-44,0],[0,-48,0],[4,-52,0],[0,-56,0],[4,-60,0]],["Sergeant","Private","Corporal","Private","Private","Private","Corporal","Corporal","Private","Private","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName CSLA_lrrAbPrl
	[[[["CSLA_lrrCmd","CSLA_lrrSnp","CSLA_lrrSpr","CSLA_lrrMedi","CSLA_lrrDrM","CSLA_lrrRTO"],[[0,0,0],[4,-4,0],[0,-8,0],[4,-12,0],[0,-16,0],[4,-20,0]],["Lieutenant","Sergeant","Corporal","Sergeant","Corporal","Corporal"]]],0.5],
	// configName CSLA_lrrSbtDtmt
	[[[["CSLA_lrrCmd","CSLA_lrrSnp","CSLA_lrrSnp","CSLA_lrrMedi","CSLA_lrrMedi","CSLA_lrrSpr","CSLA_lrrSpr","CSLA_lrrSpr","CSLA_lrrSpr","CSLA_lrrDrM","CSLA_lrrDrM","CSLA_lrrRTO"],[[0,0,0],[4,-4,0],[0,-8,0],[4,-12,0],[0,-16,0],[4,-20,0],[0,-24,0],[4,-28,0],[0,-32,0],[4,-36,0],[0,-40,0],[4,-44,0]],["Lieutenant","Sergeant","Sergeant","Sergeant","Sergeant","Corporal","Corporal","Corporal","Corporal","Corporal","Corporal","Corporal"]]],0.5],
	// configName CSLA_lrrOT65Prl
	[[[["CSLA_lrrCmd","CSLA_OT65A_lrr","CSLA_lrrSnp","CSLA_lrrMedi"],[[0,0,0],[0,-12,0],[10,-6,0],[-10,-6,0]],["Lieutenant","Sergeant","Sergeant","Corporal"]]],0.5]
];
}};

_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"US85");
if (_tmp > 0 or (_tmp == -1 && _d >= 1960 && _d <= 1990)) then {
	if (_tmp > 0 or _n >= 160) then {
_west append [
	// configName US85_cpSentryTeam
	[[[["US85_mcM16","US85_mcM16"],[[0,0,0],[4,0,0]],["Corporal","Private"]]],0.5],
	// configName US85_cpFireTeam
	[[[["US85_mcM16","US85_mcM16","US85_mcM60"],[[0,0,0],[4,0,0],[-4,0,0]],["Corporal","Private","Private"]]],0.5],
	// configName US85_cpRifleTeam
	[[[["US85_mcM16","US85_mcM16","US85_mcM16","US85_mcLAW"],[[0,0,0],[4,0,0],[-4,0,0],[0,-4,0]],["Corporal","Private","Private","Private"]]],0.5],
	// configName US85_infSqd
	[[[["US85_mcSgt","US85_mcM249","US85_mcM16GL","US85_mcCprs","US85_mcSMAW","US85_mcM16","US85_mcM16","US85_mcLAW","US85_mcLAW","US85_mcM16GL","US85_mcM16GL","US85_mcM249","US85_mcM249"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0],[-24,0,0],[32,0,0],[-32,0,0],[40,0,0],[-40,0,0],[48,0,0],[-48,0,0]],["Sergeant","Private","Private","Corporal","Corporal","Corporal","Corporal","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName US85_infPLTeam
	[[[["US85_mcOfc","US85_mcSgt","US85_mcCprs","US85_mcRTO"],[[0,0,0],[4,-4,0],[-4,-4,0],[0,-8,0]],["Lieutenant","Sergeant","Corporal","Private"]]],0.5],
	// configName US85_infTeam
	[[[["US85_mcM16","US85_mcM16GL","US85_mcM249","US85_mcLAW"],[[0,0,0],[4,-4,0],[-4,-4,0],[0,-8,0]],["Corporal","Private","Private","Private"]]],0.5],
	// configName US85_infM60Team
	[[[["US85_mcM60","US85_mcM16","US85_mcM16"],[[0,0,0],[2,-1,0],[-3,-2,0]],["Corporal","Private","Private"]]],0.5],
	// configName US85_infADSqd
	[[[["US85_mcFIM92","US85_mcFIM92","US85_mcM16","US85_mcM16"],[[0,0,0],[4,-4,0],[-4,-4,0],[0,-8,0]],["Sergeant","Corporal","Private","Private"]]],0.5],
	// configName US85_infM252Sqd
	[[[["US85_M252_Stat","US85_mcM16","US85_mcM16","US85_mcM16","US85_mcM16","US85_mcM16"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0]],["Sergeant","Corporal","Private","Private","Private","Private"]]],0.5],
	// configName US85_infAslSqd
	[[[["US85_mcSMAW","US85_mcSMAW","US85_mcM16","US85_mcM16"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0]],["Sergeant","Corporal","Private","Corporal"]]],0.5],
	// configName US85_infCHQ
	[[[["US85_mcOfc","US85_mcOfc","US85_mcSgt","US85_mcCprs","US85_mcRTO","US85_mcM16"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0]],["Captain","Lieutenant","Sergeant","Corporal","Corporal","Corporal"]]],0.5],
	// configName US85_M113Sec
	[[[["US85_mcSgt","US85_mcM249","US85_mcM16GL","US85_mcCprs","US85_mcSMAW","US85_mcM16","US85_mcM16","US85_M113","US85_M113","US85_mcLAW","US85_mcLAW","US85_mcM16GL","US85_mcM16GL","US85_mcM249","US85_mcM249"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0],[-24,0,0],[32,0,0],[-32,0,0],[40,0,0],[-40,0,0],[48,0,0],[-48,0,0],[56,0,0],[-56,0,0]],["Sergeant","Private","Private","Corporal","Corporal","Corporal","Corporal","Corporal","Corporal","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName US85_M113Sqd
	[[[["US85_M113","US85_mcM136","US85_mcLAW","US85_mcM16GL","US85_mcM16GL","US85_mcM249","US85_mcM249"],[[1,-5.5,0],[2.5,-2,0],[-2.5,-2,0],[2.5,1,0],[-2.5,1,0],[2.5,4.5,0],[-2.5,4.5,0]],["Corporal","Corporal","Private","Private","Private","Private","Private"]]],0.5],
	// configName US85_M113ADSqd
	[[[["US85_M113","US85_mcFIM92","US85_mcFIM92","US85_mcM16","US85_mcM16"],[[0,0,0],[2.5,-2,0],[-2.5,-2,0],[2.5,1,0],[-2.5,1,0]],["Corporal","Sergeant","Corporal","Private","Private"]]],0.5],
	// configName US85_LAV25sqd
	[[[["US85_mcSgt","US85_mcM16GL","US85_mcM16","US85_mcLAW","US85_mcM16","US85_mcM60","US85_lav25"],[[1,-5.5,0],[2.5,-2,0],[-2.5,-2,0],[2.5,1,0],[-2.5,1,0],[2.5,4.5,0],[0,0,0]],["Sergeant","Corporal","Corporal","Private","Private","Private","Corporal"]]],0.5],
	// configName US85_M1043Team
	[[[["US85_M1043_M60","US85_mcSgt","US85_mcM16","US85_mcM249"],[[0,0,0],[2.5,1,0],[-2.5,-2,0],[2.5,-2,0]],["Corporal","Sergeant","Corporal","Private"]]],0.5],
	// configName US85_TruckSqd
	[[[["US85_mcSgt","US85_mcM60","US85_mcM16GL","US85_mcM16","US85_mcM60","US85_mcCG","US85_mcCG","US85_mcM47","US85_mcM16","US85_mcM16","US85_mcM16","US85_mcM249","US85_mcCprs","US85_M923c"],[[3,6,0],[3,4,0],[-3,4,0],[3,2,0],[-3,2,0],[3,0,0],[-3,0,0],[3,-2,0],[-3,-2,0],[3,-4,0],[-3,-4,0],[3,-6,0],[-3,-6,0],[0,0,0]],["Sergeant","Corporal","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName US85_abSqd
	[[[["US85_ptSgt","US85_ptM16GL","US85_ptM16GL","US85_ptMdc","US85_ptMdc","US85_ptM136","US85_ptM136","US85_ptM60","US85_ptM60"],[[0,0,0],[4,-4,0],[0,-8,0],[4,-12,0],[0,-16,0],[4,-20,0],[0,-24,0],[4,-28,0],[0,-32,0]],["Sergeant","Private","Private","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName US85_abDtmt
	[[[["US85_ptSgt","US85_ptM60","US85_ptM21","US85_ptRTO","US85_ptMdc","US85_ptMdc","US85_ptM16GL","US85_ptM16GL","US85_ptM136","US85_ptM136","US85_ptM16","US85_ptM16","US85_ptEng","US85_ptEng","US85_ptDrv","US85_ptM249","US85_ptM249"],[[0,0,0],[4,-4,0],[0,-8,0],[4,-12,0],[0,-16,0],[4,-20,0],[0,-24,0],[4,-28,0],[0,-32,0],[4,-36,0],[0,-40,0],[4,-44,0],[0,-48,0],[4,-52,0],[0,-56,0],[4,-60,0],[0,-64,0]],["Sergeant","Private","Corporal","Corporal","Corporal","Corporal","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName US85_sfSqd
	[[[["US85_sfGL","US85_sfSpr","US85_sfM21","US85_sfDrv","US85_sfMdc","US85_sfRTO"],[[0,0,0],[4,-4,0],[-4,-4,0],[0,-8,0],[4,-12,0],[-4,-12,0]],["Sergeant","Corporal","Corporal","Corporal","Corporal","Corporal"]]],0.5],
	// configName US85_M1A1ptn
	[[[["US85_M1A1","US85_M1A1","US85_M1A1","US85_M1A1"],[[0,0,0],[33,0,0],[-33,0,0],[66,0,0]],["Lieutenant","Sergeant","Corporal","Corporal"]]],0.5],
	// configName US85_M1A1scM113sqd
	[[[["US85_M1A1","US85_M1A1","US85_mcSgt","US85_mcM16GL","US85_mcM16GL","US85_mcLAW","US85_mcLAW","US85_mcM249","US85_mcM249","US85_mcSMAW","US85_mcM16","US85_M113"],[[17,0,0],[-17,0,0],[0,-12,0],[17,-7,0],[-17,-7,0],[15,-7,0],[-15,-7,0],[19,-7,0],[-19,-7,0],[2,-12,0],[-2,-12,0],[0,-7,0]],["Sergeant","Sergeant","Sergeant","Corporal","Corporal","Private","Private","Private","Private","Corporal","Private","Corporal"]]],0.5]
];
}};

_tmp = missionNamespace getVariable ("gosa_faction_multiplier_"+"FIA_CSLA");
if (_tmp > 0 or (_tmp == -1 && _d >= 1960 && _d <= 1990)) then {
	if (_tmp > 0 or _n >= 160) then {
[
	// configName FIA_cpSentryTeam
	[[[["FIA_mcM16","FIA_mcFAL"],[[0,0,0],[4,0,0]],["Corporal","Private"]]],0.5],
	// configName FIA_cpFireTeam
	[[[["FIA_mcM16","FIA_mcFAL","FIA_mcUK59L"],[[0,0,0],[4,0,0],[-4,0,0]],["Corporal","Private","Private"]]],0.5],
	// configName FIA_cpRifleTeam
	[[[["FIA_mcM16","FIA_mcSa58","FIA_mcFAL","FIA_mcRPG7"],[[0,0,0],[4,0,0],[-4,0,0],[0,-4,0]],["Corporal","Private","Private","Private"]]],0.5],
	// configName FIA_rScn
	[[[["FIA_mcCmd","FIA_mcUK59L","FIA_mcVG70","FIA_mcVG70","FIA_mcRPG7","FIA_mcSa58v","FIA_mcFAL","FIA_mcUK59L","FIA_mcMdc","FIA_mcM16","FIA_mcSa58","FIA_mcSa58"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0],[-24,0,0],[32,0,0],[-32,0,0],[40,0,0],[-40,0,0],[48,0,0]],["Sergeant","Corporal","Private","Private","Corporal","Private","Private","Corporal","Corporal","Private","Private","Private"]]],0.5],
	// configName FIA_rTeam
	[[[["FIA_mcM16","FIA_mcSa58","FIA_mcFAL","FIA_mcSa58V","FIA_mcFAL"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0]],["Sergeant","Corporal","Private","Private","Private"]]],0.5],
	// configName FIA_rSqd
	[[[["FIA_mcM16","FIA_mcSa58","FIA_mcSa58v","FIA_mcUK59L","FIA_mcSa61","FIA_mcM16","FIA_mcRPG7","FIA_mc9K32"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0],[-24,0,0],[32,0,0]],["Sergeant","Corporal","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName FIA_rTeamRPG
	[[[["FIA_mcM16","FIA_mcSa58v","FIA_mcRPG7","FIA_mcRPG7"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0]],["Corporal","Private","Private","Private"]]],0.5],
	// configName FIA_rTeamBTR40DSKM
	[[[["FIA_BTR40_DSKM","FIA_mcRPG7","FIA_mcSa58","FIA_mcUK59L"],[[0,0,0],[2.5,1,0],[-2.5,-2,0],[2.5,-2,0]],["Corporal","Sergeant","Corporal","Private"]]],0.5],
	// configName FIA_rTeamBTR40
	[[[["FIA_BTR40","FIA_mcM16","FIA_mcSa58","FIA_mcUK59L"],[[0,0,0],[2.5,1,0],[-2.5,-2,0],[2.5,-2,0]],["Corporal","Sergeant","Corporal","Private"]]],0.5],
	// configName FIA_cpCldsSentryTeam
	[[[["FIA_cldsRPG75","FIA_cldsSa24"],[[0,0,0],[4,0,0]],["Corporal","Private"]]],0.5],
	// configName FIA_cpCldsFireTeam
	[[[["FIA_cldsRPG75","FIA_cldsUK59L","FIA_cldsUK59L"],[[0,0,0],[4,0,0],[-4,0,0]],["Corporal","Private","Private"]]],0.5],
	// configName FIA_cpCldsRifleTeam
	[[[["FIA_cldsRPG75","FIA_cldsRPG7","FIA_cldsRPG7","FIA_cldsUK59L"],[[0,0,0],[4,0,0],[-4,0,0],[0,-4,0]],["Corporal","Private","Private","Private"]]],0.5],
	// configName FIA_cldsScn
	[[[["FIA_cldsCmd","FIA_cldsSa24","FIA_cldsMdc","FIA_cldsRPG75","FIA_cldsSa24Crw","FIA_cldsSvc","FIA_cldsSpr","FIA_cldsRPG7","FIA_clds9K32","FIA_cldsDrM","FIA_cldsUK59L","FIA_cldsOP63"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0],[-24,0,0],[32,0,0],[-32,0,0],[40,0,0],[-40,0,0],[48,0,0]],["Sergeant","Corporal","Private","Private","Corporal","Private","Private","Corporal","Corporal","Private","Private","Private"]]],0.5],
	// configName FIA_cldsSqd
	[[[["FIA_cldsCmd","FIA_cldsRPG75","FIA_cldsRPG75","FIA_cldsOP63","FIA_cldsOP63","FIA_cldsSpr","FIA_cldsSpr","FIA_cldsMdc","FIA_cldsMdc","FIA_cldsRPG7","FIA_cldsRPG7","FIA_cldsUK59L","FIA_cldsUK59L"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0],[-24,0,0],[32,0,0],[-32,0,0],[40,0,0],[-40,0,0],[48,0,0],[-48,0,0]],["Sergeant","Corporal","Private","Private","Corporal","Private","Private","Corporal","Corporal","Private","Private","Private","Private"]]],0.5],
	// configName FIA_cldsSqdBTR40DSKM
	[[[["FIA_BTR40_DSKM_clds","FIA_cldsCmd","FIA_cldsRPG7","FIA_cldsRPG7","FIA_cldsUK59L","FIA_cldsUK59L"],[[0,0,0],[1.5,-3,0],[-2,0,0],[2,0,0],[-2,2.5,0],[2,2.5,0]],["Corporal","Sergeant","Private","Private","Private","Private"]]],0.5],
	// configName FIA_cldsPtrAZUpara
	[[[["FIA_AZU_para_clds","FIA_cldsCmd","FIA_cldsOP63","FIA_cldsMdc","FIA_cldsRPG7","FIA_cldsSpr","FIA_cldsRPG75","FIA_cldsUK59L"],[[0,0,0],[1,-3,0],[-2,-2.5,0],[2,-2.5,0],[-2,0,0],[2,0,0],[-2,2.5,0],[2,2.5,0]],["Corporal","Sergeant","Corporal","Private","Private","Private","Private","Private"]]],0.5],
	// configName FIA_cldsPtrAZUT21
	[[[["FIA_AZU_T21_clds","FIA_cldsUK59L"],[[0,0,0],[2,2.5,0]],["Corporal","Private"]]],0.5],
	// configName FIA_cdPtrAZUDSKM
	[[[["FIA_AZU_DSKM_clds","FIA_cldsRPG7"],[[0,0,0],[2,2.5,0]],["Corporal","Private"]]],0.5],
	// configName FIA_cldsSqdAZUAslt
	[[[["FIA_AZU_DSKM_clds","FIA_AZU_T21_clds","FIA_cldsRPG7","FIA_cldsUK59L"],[[0,0,0],[10,0,0],[-2,2.5,0],[12,2.5,0]],["Sergeant","Corporal","Private","Private"]]],0.5],
	// configName FIA_cldsSqdV3S
	[[[["FIA_cldsCmd","CSLA_FIA_V3So_clds","FIA_cldsRPG75","FIA_cldsRPG75","FIA_cldsOP63","FIA_cldsOP63","FIA_cldsSpr","FIA_cldsSpr","FIA_cldsMdc","FIA_cldsMdc","FIA_cldsRPG7","FIA_cldsRPG7","FIA_cldsUK59L","FIA_cldsUK59L"],[[-4,0,0],[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0],[-24,0,0],[32,0,0],[-32,0,0],[40,0,0],[-40,0,0],[48,0,0],[-48,0,0]],["Sergeant","Private","Corporal","Private","Private","Corporal","Private","Private","Corporal","Corporal","Private","Private","Private","Private"]]],0.5],
	// configName FIA_cdDtmt
	[[[["FIA_cdCmd","FIA_cdSa26RPG75","FIA_cdSa26RPG75","FIA_cdMdc","FIA_cdMdc","FIA_cdSpr","FIA_cdSpr","FIA_cdRPG7","FIA_cdRPG7","FIA_cdUK59L","FIA_cdUK59L","FIA_cdOP63","FIA_cdOP63","FIA_cdFAL","FIA_cdFAL"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0],[-24,0,0],[32,0,0],[-32,0,0],[40,0,0],[-40,0,0],[48,0,0],[-48,0,0],[56,0,0],[-56,0,0]],["Sergeant","Corporal","Private","Private","Corporal","Private","Private","Corporal","Corporal","Private","Private","Private","Private","Private","Private"]]],0.5],
	// configName FIA_cdPrl
	[[[["FIA_cdCmd","FIA_cdFAL","FIA_cdUK59L","FIA_cdSa26RPG75","FIA_cdMdc","FIA_cdSpr","FIA_cdRPG7"],[[0,0,0],[8,0,0],[-8,0,0],[16,0,0],[-16,0,0],[24,0,0],[-24,0,0]],["Sergeant","Corporal","Private","Private","Corporal","Private","Private"]]],0.5]
];
}};
