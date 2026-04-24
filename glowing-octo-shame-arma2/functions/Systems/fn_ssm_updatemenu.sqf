

#define gosa_SSM_CURRENTDISPLAY UInamespace getVariable "currentCutDisplay"
#define BIS_SSM_UIICONS ["\ca\ui\data\icon_wf_support_supplydrop_ca.paa", "\ca\ui\data\icon_wf_support_transport_ca.paa", "\ca\ui\data\icon_wf_support_cas_ca.paa", "\ca\ui\data\icon_wf_support_mortar_ca.paa", "\ca\ui\data\icon_wf_support_artilery_ca.paa"]

private ["_e","_c","_b","_a","_side","_icons"];

gosa_SSM_fnc_InitVariable = {
	private ["_var","_val"];
	_var = _this select 0;
	_val = _this select 1;
	if (isNil _var) then {missionnamespace setvariable [_var,_val];};
};

//BIS_FNC_GUIget = {};
//40 CutRsc["OptionsAvailable","PLAIN",0];
_icons = BIS_SSM_UIICONS;

gosa_SSM_CUSTOMICON = "\ca\ui\data\cursor_support_ca";

_e = [[localize "STR_EP1_MENU_TITLE",false]];
_usable = [];

_b= true;
_side = str gosa_playerSide;

["gosa_SSM_AmmoDrop_ENABLED_"+_side,   if (missionNamespace getVariable "gosa_AmmoDrop" > 0) then {true} else {false}  ] call gosa_SSM_fnc_InitVariable;
["gosa_SSM_UnitsDrop_ENABLED_"+_side, false] call gosa_SSM_fnc_InitVariable;
["gosa_SSM_Airstrike_ENABLED_"+_side, false] call gosa_SSM_fnc_InitVariable;
["gosa_SSM_Mortar_ENABLED_"+_side,   false] call gosa_SSM_fnc_InitVariable;
["gosa_SSM_Artillery_ENABLED_"+_side, false] call gosa_SSM_fnc_InitVariable;
["gosa_SSM_CeaseFire_ENABLED_"+_side, false] call gosa_SSM_fnc_InitVariable;


["gosa_SSM_AmmoDrop_AVAILABLE_"+_side,   if (missionNamespace getVariable "gosa_AmmoDrop" > 0) then {true} else {false}  ] call gosa_SSM_fnc_InitVariable;
["gosa_SSM_UnitsDrop_AVAILABLE_"+_side, false] call gosa_SSM_fnc_InitVariable;
["gosa_SSM_Airstrike_AVAILABLE_"+_side, false] call gosa_SSM_fnc_InitVariable;
["gosa_SSM_Mortar_AVAILABLE_"+_side,   false] call gosa_SSM_fnc_InitVariable;
["gosa_SSM_Artillery_AVAILABLE_"+_side, false] call gosa_SSM_fnc_InitVariable;
["gosa_SSM_CeaseFire_AVAILABLE_"+_side, false] call gosa_SSM_fnc_InitVariable;

/*
_b= missionnamespace getVariable ("BIS_SSM_CeaseFire_ENABLED_"+_side);
_a= missionnamespace getVariable ("BIS_SSM_CeaseFire_AVAILABLE_"+_side);
//_e=_e + [["Report Cease Fire!",[2],"",-5,[["expression", "[] spawn BIS_SSM_fnc_CallCeaseFire"]], "1", "1", gosa_SSM_CUSTOMICON]];
if (_b) then {_e=_e + [[localize "STR_EP1_CANCEL_SUPPORT",[2],"",-5,
  [["expression", "[] spawn BIS_SSM_fnc_CallCeaseFire"]], "1", if (_a) then {"1"} else {"0"}, gosa_SSM_CUSTOMICON]]};
*/


_b= missionnamespace getVariable ("gosa_SSM_AmmoDrop_ENABLED_"+_side);
_a= missionnamespace getVariable ("gosa_SSM_AmmoDrop_AVAILABLE_"+_side);
if (_a and _b) then {(gosa_SSM_CURRENTDISPLAY DisplayCtrl (3511 + 0))
  CtrlSetText (_icons select (0));} else {(gosa_SSM_CURRENTDISPLAY DisplayCtrl (3511 + 0)) CtrlSetText "";};


if (_b) then {_e=_e + [[localize "STR_EP1_AMMO_DROP",[3],"",-5,
  [["expression", "[_pos,""AmmoDrop""] call gosa_fnc_SSM_Request"]], "1", if (_a) then {"CursorOnGround"} else {"0"}, gosa_SSM_CUSTOMICON]]};

/*
_b= missionnamespace getVariable ("BIS_SSM_UnitsDrop_ENABLED_"+_side);
_a= missionnamespace getVariable ("BIS_SSM_UnitsDrop_AVAILABLE_"+_side);
if (_a and _b) then {(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 1))
  CtrlSetText (_icons select (1));} else {(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 1)) CtrlSetText "";};

if (_b) then {_e=_e + [[localize "STR_EP1_PARADROP",[4],"",-5,
  [["expression", "[_pos,""UnitsDrop""] call BIS_SSM_fnc_Request"]], "1", if (_a) then {"CursorOnGround"} else {"0"}, gosa_SSM_CUSTOMICON]]};

_b= missionnamespace getVariable ("BIS_SSM_Airstrike_ENABLED_"+_side);
_a= missionnamespace getVariable ("BIS_SSM_Airstrike_AVAILABLE_"+_side);
if (_a and _b) then {(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 2))
  CtrlSetText (_icons select (2));} else {(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 2)) CtrlSetText "";};

if (_b) then {_e=_e + [[localize "STR_EP1_AIRSTRIKE",[5],"",-5,
  [["expression", "[_pos,""Airstrike""] call BIS_SSM_fnc_Request"]], "1", if (_a) then {"CursorOnGround"} else {"0"}, gosa_SSM_CUSTOMICON]]};

_b= missionnamespace getVariable ("BIS_SSM_Mortar_ENABLED_"+_side);
_a= missionnamespace getVariable ("BIS_SSM_Mortar_AVAILABLE_"+_side);
if (_a and _b) then {(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 3))
  CtrlSetText (_icons select (3));} else {(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 3)) CtrlSetText "";};

if (_b) then {_e=_e + [[localize "STR_EP1_MORTAR",[6],"",-5,
  [["expression", "[_pos,""Mortar""] call BIS_SSM_fnc_Request"]], "1", if (_a) then {"CursorOnGround"} else {"0"}, gosa_SSM_CUSTOMICON]]};

_b= missionnamespace getVariable ("BIS_SSM_Artillery_ENABLED_"+_side);
_a= missionnamespace getVariable ("BIS_SSM_Artillery_AVAILABLE_"+_side);
if (_a and _b) then {(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 4))
  CtrlSetText (_icons select (4));} else {(BIS_SSM_CURRENTDISPLAY DisplayCtrl (3500 + 4)) CtrlSetText "";};

if (_b) then {_e=_e + [[localize "STR_EP1_ARTILLERY",[7],"",-5,
  [["expression", "[_pos,""Artillery""] call BIS_SSM_fnc_Request"]], "1", if (_a) then {"CursorOnGround"} else {"0"}, gosa_SSM_CUSTOMICON]]};
*/

gosa_supportMenu_0 = _e;
//if (commandingmenu == "#USER:gosa_supportMenu_0") then {showCommandingMenu "#USER:gosa_supportMenu_0";};
