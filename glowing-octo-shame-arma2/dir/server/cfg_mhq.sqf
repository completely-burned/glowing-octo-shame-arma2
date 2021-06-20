private ["_MHQ_list","_MHQ_list_unfolded"];
_MHQ_list=[];_MHQ_list_unfolded=[];
if(toLower worldname in ["zargabad", "takistan", "desert_e", "shapur_baf", "mountains_acr"])then{
	if ( west in gosa_friendlyside ) then {
		_MHQ_list=_MHQ_list+[
			toLower "M1130_CV_EP1"
		];
		_MHQ_list_unfolded=_MHQ_list_unfolded+[
			toLower "M1130_HQ_unfolded_Base_EP1"
		];
	};
	if ( resistance in gosa_friendlyside ) then {
		_MHQ_list=_MHQ_list+[
			toLower "BRDM2_HQ_TK_GUE_EP1"
		];
		_MHQ_list_unfolded=_MHQ_list_unfolded+[
			toLower "BRDM2_HQ_TK_GUE_unfolded_Base_EP1"
		];
	};
	if ( east in gosa_friendlyside ) then {
		_MHQ_list=_MHQ_list+[
			toLower "BMP2_HQ_TK_EP1"
		];
		_MHQ_list_unfolded=_MHQ_list_unfolded+[
			toLower "BMP2_HQ_TK_unfolded_Base_EP1"
		];
	};
}else{
	if ( east in gosa_friendlyside ) then {
		_MHQ_list=_MHQ_list+[
			toLower "BTR90_HQ",
			toLower "BMP2_HQ_INS"
		];
		_MHQ_list_unfolded=_MHQ_list_unfolded+[
			toLower "BTR90_HQ_unfolded",
			toLower "BMP2_HQ_INS_unfolded"
		];
	};
	if ( west in gosa_friendlyside ) then {
		_MHQ_list=_MHQ_list+[
			toLower "LAV25_HQ",
			toLower "BMP2_HQ_CDF"
		];
		_MHQ_list_unfolded=_MHQ_list_unfolded+[
			toLower "LAV25_HQ_unfolded",
			toLower "BMP2_HQ_CDF_unfolded"
		];
	};
	if ( resistance in gosa_friendlyside ) then {
		_MHQ_list=_MHQ_list+[
			toLower "BRDM2_HQ_Gue"
		];
		_MHQ_list_unfolded=_MHQ_list_unfolded+[
			toLower "BRDM2_HQ_Gue_unfolded"
		];
	};
};

MHQ_list = [_MHQ_list, _MHQ_list_unfolded];

publicVariable "MHQ_list";
