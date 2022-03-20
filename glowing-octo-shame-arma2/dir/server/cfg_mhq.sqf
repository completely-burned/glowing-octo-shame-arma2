private ["_mhq","_hq"];
_mhq=[];_hq=[];
if(toLower worldname in ["zargabad", "takistan", "desert_e", "shapur_baf", "mountains_acr"])then{
	if ( west in gosa_friendlyside ) then {
		_mhq=_mhq+[
			toLower "M1130_CV_EP1"
		];
		_hq=_hq+[
			toLower "M1130_HQ_hq_Base_EP1"
		];
	};
	if ( resistance in gosa_friendlyside ) then {
		_mhq=_mhq+[
			toLower "BRDM2_HQ_TK_GUE_EP1"
		];
		_hq=_hq+[
			toLower "BRDM2_HQ_TK_GUE_hq_Base_EP1"
		];
	};
	if ( east in gosa_friendlyside ) then {
		_mhq=_mhq+[
			toLower "BMP2_HQ_TK_EP1"
		];
		_hq=_hq+[
			toLower "BMP2_HQ_TK_hq_Base_EP1"
		];
	};
}else{
	if ( east in gosa_friendlyside ) then {
		_mhq=_mhq+[
			toLower "BTR90_HQ",
			toLower "BMP2_HQ_INS"
		];
		_hq=_hq+[
			toLower "BTR90_HQ_hq",
			toLower "BMP2_HQ_INS_hq"
		];
	};
	if ( west in gosa_friendlyside ) then {
		_mhq=_mhq+[
			toLower "LAV25_HQ",
			toLower "BMP2_HQ_CDF"
		];
		_hq=_hq+[
			toLower "LAV25_HQ_hq",
			toLower "BMP2_HQ_CDF_hq"
		];
	};
	if ( resistance in gosa_friendlyside ) then {
		_mhq=_mhq+[
			toLower "BRDM2_HQ_Gue"
		];
		_hq=_hq+[
			toLower "BRDM2_HQ_Gue_hq"
		];
	};
};

MHQ_list = [_mhq, _hq];

publicVariable "MHQ_list";
