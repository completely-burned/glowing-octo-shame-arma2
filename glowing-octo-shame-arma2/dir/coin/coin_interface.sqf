
// объект радом с  котором строится
_logic = _this select 3 select 0;

gosa_HQ_logic = _logic;

[_logic, nil, nil, _this select 3] call gosa_fnc_coin_variable;

uinamespace setvariable ["COIN_displayMain",finddisplay 46];

BIS_COIN_QUIT = nil;

//--- Terminate of system is already running
player setvariable ["bis_coin_logic",_logic];
bis_coin_player = player;

//////////////////////////////////////////////////
// startLoadingScreen [localize "str_coin_name","RscDisplayLoadMission"];
//////////////////////////////////////////////////

private["_camera"];

//--- Execute designer defined code - onStart
//_code = _logic getvariable "BIS_COIN_onStart";
//[_logic] call _code;

if (isnil "BIS_CONTROL_CAM") then {
	_camera = "camconstruct" camcreate [position player select 0,position player select 1,15];
	//_camera = "camconstruct" camcreate [position _logic select 0,position _logic select 1,15];
	_camera cameraeffect ["internal","back"];
	_camera camPrepareFOV 0.900;
	_camera campreparefocus [-1,-1];
	_camera camCommitPrepared 0;
	cameraEffectEnableHUD true;
	_camera setdir direction player;
	[_camera,-30,0] call BIS_fnc_setPitchBank;
	_camera camConstuctionSetParams ([position _logic] + (_logic getvariable "BIS_COIN_areasize"));
};

BIS_CONTROL_CAM = _camera;
BIS_CONTROL_CAM_LMB = false;
BIS_CONTROL_CAM_RMB = false;
showcinemaborder false;

1122 cutrsc ["constructioninterface","plain"];

//_display = finddisplay 46;
COIN_EH_keydown =		(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["KeyDown",		"if !(isnil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['keydown',_this,commandingmenu] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil;}"];
COIN_EH_keyup =			(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["KeyUp",		"if !(isnil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['keyup',_this] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil;}"];
COIN_EH_mousebuttondown =	(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["MouseButtonDown",	"if !(isnil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['mousedown',_this,commandingmenu] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil; BIS_CONTROL_CAM_onMouseButtonDown = _this; if (_this select 1 == 1) then {BIS_CONTROL_CAM_RMB = true}; if (_this select 1 == 0) then {BIS_CONTROL_CAM_LMB = true};}"];
COIN_EH_mousebuttonup =		(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["MouseButtonUp",	"if !(isnil 'BIS_CONTROL_CAM_Handler') then {BIS_CONTROL_CAM_RMB = false; BIS_CONTROL_CAM_LMB = false;}"];
//(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["MouseMoving",		"if !(isnil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['mousemoving',_this] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil;}"];
//(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["MouseHolding",	"if !(isnil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['mouseholding',_this] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil;}"];

BIS_CONTROL_CAM_keys = [];


_logic setvariable ["BIS_COIN_selected",objnull];
_logic setvariable ["BIS_COIN_params",[]];
_logic setvariable ["BIS_COIN_tooltip",""];
_logic setvariable ["BIS_COIN_menu","#USER:BIS_Coin_categories_0"];
_logic setvariable ["BIS_COIN_restart",false];
_nvgstate = if (daytime > 18.5 || daytime < 5.5) then {true} else {false};
camusenvg _nvgstate;
_logic setvariable ["BIS_COIN_nvg",_nvgstate];


//--- Open menu
_logic spawn {
	_logic = _this;
	waituntil {!isnil {_this getvariable "BIS_COIN_fundsOld"}};
	while {!isnil "BIS_CONTROL_CAM"} do {
		waituntil {
			_params = _logic getvariable "BIS_COIN_params";
			if (isnil "_params") then {_params = []};
			(commandingmenu == "" && count _params == 0 && !BIS_CONTROL_CAM_RMB) || isnil "BIS_CONTROL_CAM"
		};
		if (isnil "BIS_CONTROL_CAM") exitwith {};
		showcommandingmenu "#USER:BIS_Coin_categories_0";
		//showcommandingmenu (_logic getvariable "BIS_COIN_menu");
		sleep 0.01;
	};
};

//--- Border - temporary solution //TODO: move border if position of logic changes (eg. by placing hq)
_createBorder = {
	_logic = _this;
	_oldBorder = missionnamespace getvariable "BIS_COIN_border";
	if (!isnil "_oldBorder") then {
		{deletevehicle _x} foreach _oldBorder;
	};
	missionnamespace setvariable ["BIS_COIN_border",nil];

	_border = [];
	_center = position _logic;
	_size = (_logic getvariable "BIS_COIN_areasize") select 0;
	_width = 9.998; //200/126
	_width = 9.996; //150/96
	_width = 9.992; //100/64
	_width = 9.967; //50/32
	_width = 9.917; //30/20
	_width = 9.83; //20/14
	_width = 9.48; //10/8
	_width = 10 - (0.1/(_size * 0.2));
	_width = 10;

	_pi = 3.14159265358979323846;
	_perimeter = (_size * _pi);
	_perimeter = _perimeter + _width - (_perimeter % _width);
	_size = (_perimeter / _pi);
	_wallcount = _perimeter / _width * 2;
	_total = _wallcount;


	for "_i" from 1 to _total do {
		_dir = (360 / _total) * _i;
		_xpos = (_center select 0) + (sin _dir * _size);
		_ypos = (_center select 1) + (cos _dir * _size);
		_zpos = (_center select 2);

		_a = "transparentwall" createvehiclelocal [_xpos,_ypos,_zpos];
		_a setposasl [_xpos,_ypos,0];
		_a setdir (_dir + 90);
		_border = _border + [_a];
		//[_a,0,0] call BIS_fnc_setPitchBank;
		//sleep 0.01;
	};
	missionnamespace setvariable ["BIS_COIN_border",_border];
};
_createBorderScope = _logic spawn _createBorder;


BIS_CONTROL_CAM_Handler = {
	_mode = _this select 0;
	_input = _this select 1;
	if !(isNil "BIS_CONTROL_CAM") then {_camera = BIS_CONTROL_CAM};
	_logic = bis_coin_player getvariable "bis_coin_logic";
	_terminate = false;

	if (isnil "_logic") exitwith {};
	if(!isNull _logic)then{

		_areasize = _logic getvariable "BIS_COIN_areasize";
		_limitH = _areasize select 0;
		_limitV = _areasize select 1;

		_keysCancel		= actionKeys "MenuBack";
		_keysRepair		= actionKeys "User13";
		_keysSell		= actionKeys "User14";

		_keysBanned		= [1];
		//_keysSelectAll		= actionKeys "SelectAll";
		_keyNightVision		= actionKeys "NightVision";


		//--- Mouse DOWN
		if (_mode == "mousedown") then {
			_key = _input select 1;
			if (_key == 1 && 65665 in (actionkeys "MenuBack")) then {_terminate = true};
		};


		//--- Key DOWN
		if (_mode == "keydown") then {
			_key = _input select 1;
			if !(_key in (BIS_CONTROL_CAM_keys + _keysBanned)) then {BIS_CONTROL_CAM_keys = BIS_CONTROL_CAM_keys + [_key]};

			//--- Terminate CoIn
			if (_key in _keysCancel && isnil "BIS_Coin_noExit") then {_terminate = true;};

			//--- Start NVG
			if (_key in _keyNightVision) then {
				_NVGstate = !(_logic getvariable "BIS_COIN_nvg");
				_logic setvariable ["BIS_COIN_nvg",_NVGstate];
				camusenvg _NVGstate;
			};
		};
		//--- Key UP
		if (_mode == "keyup") then {
			_key = _input select 1;
			if (_key in BIS_CONTROL_CAM_keys) then {BIS_CONTROL_CAM_keys = BIS_CONTROL_CAM_keys - [_key]};
		};

		//--- Deselect or Close
		if (_terminate) then {
			_menu = _this select 2;

			//--- Close
			if (isnil "BIS_Coin_noExit") then {
				if (_menu == "#USER:BIS_Coin_categories_0") then {
					if (!(isNil "BIS_CONTROL_CAM")) then {
						BIS_COIN_QUIT = true;
					};
				} else {
					_preview = _logic getvariable "BIS_COIN_preview";
					if !(isnil "_preview") then {deletevehicle _preview};
					_logic setvariable ["BIS_COIN_preview",nil];
					_logic setvariable ["BIS_COIN_params",[]];
				};
			};
		};

	};

	//coinn = coinn + 1;
};

waituntil {scriptdone _createBorderScope};
//////////////////////////////////////////////////
// endLoadingScreen;
//////////////////////////////////////////////////


/*******************************************************************************************************************************************************
/*** LOOOP *********************************************************************************************************************************************
/******************************************************************************************************************************************************/
_canAffordCount = 0;
_canAffordCountOld = 0;
_oldMenu = commandingmenu;
_limitHOld = -1;
_limitVOld = -1;
_loaded = false;
_localtime = time;

while {!isnil "BIS_CONTROL_CAM" && player == bis_coin_player && isnil "BIS_COIN_QUIT"} do {
	if (isnull (uinamespace getvariable 'BIS_CONTROL_CAM_DISPLAY') && !_loaded) then {
		cameraEffectEnableHUD true;
		1122 cutrsc ["constructioninterface","plain"];
		_loaded = true;
		_logic setvariable ["BIS_COIN_restart",true];
		_localtime = time;
	};
	if ((time - _localtime) >= 1 && _loaded) then {_loaded = false};
	_logic = bis_coin_player getvariable "bis_coin_logic";

	_mode = "mousemoving";
	//_input = _logic getvariable "BIS_COIN_mousepos";
	_camera = BIS_CONTROL_CAM;

  	if (isnil "_logic") exitwith {};
	if (isNull _logic) exitwith {};

	_areasize = _logic getvariable "BIS_COIN_areasize";
	_limitH = _areasize select 0;
	_limitV = _areasize select 1;

	if (_limitH != _limitHOld || _limitV != _limitVOld) then {
		_logic spawn _createBorder;
		BIS_CONTROL_CAM camConstuctionSetParams ([position _logic] + (_logic getvariable "BIS_COIN_areasize"));
	};
	_limitHOld = _limitH;
	_limitVOld = _limitV;


	_keysCancel		= actionKeys "MenuBack";
	_keysRepair		= actionKeys "User13";
	_keysSell		= actionKeys "User14";

	_keysBanned		= [1];
	_keysSelectAll		= actionKeys "SelectAll";

	//--- Mouse moving or holding
	if (true) then {

		//_x = _input select 1;
		//_y = _input select 2;

		//--- Check pressed keys
		_keys = BIS_CONTROL_CAM_keys;
		//debuglog ("Log: " + str _keys);
		_ctrl = (29 in _keys) || (157 in _keys);
		_shift = (42 in _keys) || (54 in _keys);
		_alt = (56 in _keys);


		//--- Construction or Selection
		_params = _logic getvariable "BIS_COIN_params";
		_tooltip = "empty";
		_tooltipType = "empty";
		_selected = objnull;
		if (count _params > 0) then {

			//--- Construction

			//--- Basic colors
			_colorGreen = "#(argb,8,8,3)color(0,1,0,0.3,ca)";
			_colorRed = "#(argb,8,8,3)color(1,0,0,0.3,ca)";
			_colorGray = "#(argb,8,8,3)color(1,1,1,0.1,ca)";
			_colorGray = "#(argb,8,8,3)color(0,0,0,0.25,ca)";
			_color = _colorGreen;

			//--- Class, Category, Cost, (preview class), (display name)
			_itemclass = _params select 0;
			_itemcategory = _params select 1;
			//if (typename _itemcategory == typename 0) then {_itemCategory = select _itemcategory};
			_itemcost = _params select 2;
			_itemcash = 0;
			if (typename _itemcost == "ARRAY") then {_itemcash = _itemcost select 0; _itemcost = _itemcost select 1};
			_itemFunds = (_logic getvariable "BIS_COIN_funds") select _itemcash;
			_itemname = if (count _params > 3) then {_params select 3} else {gettext (configfile >> "CfgVehicles" >> _itemclass >> "displayName")};
			//_itemclass_preview = _itemclass + "preview";
			_itemclass_preview = gettext (configfile >> "CfgVehicles" >> _itemclass >> "ghostpreview");
			if (_itemclass_preview == "") then {_itemclass_preview = _itemclass};
			//if (str (configfile >> "CfgVehicles" >> _itemclass_preview) == "") then {_itemclass_preview = _itemclass};


			//--- Preview building
			_preview = camtarget BIS_CONTROL_CAM;
			if (typeof _preview != _itemclass_preview) then {
				//--- No preview
				deletevehicle _preview;
				if !(isnil {_logic getvariable "BIS_COIN_preview"}) then {deletevehicle (_logic getvariable "BIS_COIN_preview")}; //--- Serialization hack
				_preview = _itemclass_preview createvehicle (screentoworld [0.5,0.5]);
				BIS_CONTROL_CAM camsettarget _preview;
				BIS_CONTROL_CAM camcommit 0;
				_logic setvariable ["BIS_COIN_preview",_preview];

				_preview setObjectTexture [0,_colorGray];
				_preview setvariable ["BIS_COIN_color",_colorGray];

				//--- Execute designer defined code
				//_code = _logic getvariable "BIS_COIN_onSelect";
				//[_itemclass,_preview] call _code;
				//[_logic, _preview,_itemclass] spawn _code;

				//--- Exception - preview not created
				if (isnull _preview) then {
					deletevehicle _preview;
					_logic setvariable ["BIS_COIN_preview",nil];
					_logic setvariable ["BIS_COIN_params",[]];
					textLogFormat ["Log: [COIN] ERROR: Failed to create '%1' (preview of '%2')",_itemclass_preview,_itemclass];
				};

			} else {
				//--- Check zone
				if (
					([position _preview,_logic] call BIS_fnc_distance2D) > _limitH
				) then {
					_color = _colorGray
				} else {

					// автоматическое удаление статичного оружия при наводке
					{
						if (!alive _x) then {
							deleteVehicle _x;
						};
					} forEach (position _preview nearObjects ["StaticWeapon", 2.5]);

					//--- No money
					_funds = 0;
					call compile format ["_funds = %1",_itemFunds];
					_fundsRemaining = _funds - _itemcost;
					if (_fundsRemaining < 0) then {_color = _colorRed};

					_dist = (sizeof typeof _preview) / 2 min 4;
					if (_itemclass isKindOf "StaticWeapon") then {
						_dist = 0.25;
					};

					//--- No Place To Build
					_isFlat = (position _preview) isflatempty [
						_dist,	//--- Minimal distance from another object
						0,				//--- If 0, just check position. If >0, select new one
						0.7,				//--- Max gradient
						_dist,	//--- Gradient area
						0,				//--- 0 for restricted water, 2 for required water,
						false,				//--- True if some water can be in 25m radius
						_preview			//--- Ignored object
					];
					if (count _isFlat == 0) then {_color = _colorRed};
				};
				_preview setObjectTexture [0,_color];
				_preview setvariable ["BIS_COIN_color",_color];

				_tooltip = _itemclass;
				_tooltipType = "preview";

				//--- Temporary solution
				_colorGUI = [1,1,1,0.1];
				if (_color == _colorGreen) then {_colorGUI = [0.3,1,0.3,0.3]};
				if (_color == _colorRed) then {_colorGUI = [1,0.2,0.2,0.4]};

				//_display = uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY";
				//_center = (uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201;
				((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201) ctrlsettextcolor _colorGUI;
				((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201) ctrlcommit 0;


			};

			//--- Place
			if (!isnull _preview && ((BIS_CONTROL_CAM_LMB && 65536 in (actionKeys "DefaultAction")) || {_x in (actionKeys "DefaultAction")} count BIS_CONTROL_CAM_keys > 0) && _color == _colorGreen) then {
				_pos = position _preview;
				_dir = direction _preview;
				deletevehicle _preview;
				_logic setvariable ["BIS_COIN_preview",nil];
				_logic setvariable ["BIS_COIN_params",[]];

				//--- Remove funds
				call compile format ["%1 = %1 - _itemcost",_itemFunds];
				publicvariable _itemFunds;

				//--- Execute designer defined code
				[_logic,_itemclass,_pos,_dir,_shift,_itemcost] spawn {
					_logic = _this select 0;
					_itemclass = _this select 1;
					_pos = _this select 2;
					_dir = _this select 3;
					_shift = _this select 4;
					_itemcost = _this select 5;

					//_code = _logic getvariable "BIS_COIN_onPurchase";
					//[_logic,objNull,_itemclass,_pos,_dir] call _code;

					//--- Build
					_building = _itemclass createvehicle [(gosa_posDefaultHiden select 0) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)) , (gosa_posDefaultHiden select 1) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2))];//[10,10,10000];
					_building setdir _dir;
					_building setVectorUp surfaceNormal _pos;
					_building setpos _pos;
					//if (gettext (configfile >> "cfgvehicles" >> _itemclass >> "placement") == "vertical") then {_building setpos _pos}; //--- Vertical
					if (gettext (configfile >> "cfgvehicles" >> _itemclass >> "namesound") == "fence" || _itemclass iskindof "staticweapon") then {_building setpos _pos}; //--- Vertical
					//waituntil {!isnull _building};
					//_building setdir _dir;
					//_building setpos _pos;
					_building setvariable ["BIS_COIN_cost",_itemcost,true];

					//--- Register building
					[_logic,"BIS_COIN_buildings",[_building],true] call bis_fnc_variablespaceadd;

					//--- Execute designer defined code On Construct
					//_code = _logic getvariable "BIS_COIN_onConstruct";
					_code = {
						if ((_this select 0) isKindOf "LandVehicle") then {
							BIS_COIN_QUIT = true;
							[_this select 1] call gosa_fnc_coin_variable;
							deleteVehicle (_this select 0);
						};
					};
					[_logic, _building,_itemclass,_pos,_dir] spawn _code;
				};

				//--- Temporary solution
				_colorGUI = [1,1,1,0.1];
				//_display = uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY";
				//_center = (uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201;
				((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201) ctrlsettextcolor _colorGUI;
				((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201) ctrlcommit 0;
			};

			//--- Deselect
		} else {
			_colorGUI = [1,1,1,0.1];

			_buildings = _logic getvariable "BIS_COIN_buildings";
			if (true) then {

				//--- Selection
				_worldpos = screentoworld [0.5,0.5];
				_selected = objnull;

				{
					_size = (sizeof typeof _x) / 3;
					if (_size < 2) then {_size = 2};
					if (_x distance _worldpos < _size && !(_x isKindOf "WarfareBDepot") && !(_x isKindOf "WarfareBAirport")) exitwith {_selected = _x;_logic setvariable ["BIS_COIN_selected",_selected]};
					_logic setvariable ["BIS_COIN_selected",objnull];
				} foreach nearestObjects [_worldpos, ["WarfareBBaseStructure", "BASE_WarfareBFieldhHospital","StaticWeapon"], 20];

				//--- Selected building
				if !(isnull _selected) then {
					_colorGUI = [1,1,1,0.3];

					_tooltip = typeof _selected;
					_tooltipType = "selected";

					//--- Custom actions
					if (count _keys > 0 && !_ctrl) then {

						//--- Repair
						if ({_x in _keysRepair} count _keys > 0) then {
							[_logic,_selected] spawn {
								//_code = (_this select 0) getvariable "BIS_COIN_onRepair";
								//_this call _code;
								(_this select 1) setdamage 0;
							};
						};

						//--- Sell
						if ({_x in _keysSell} count _keys > 0) then {
							[_logic,_selected] spawn {
								//_code = (_this select 0) getvariable "BIS_COIN_onSell";
								//_this call _code;
								deletevehicle (_this select 1);
							};
						};
					};
				};
			};

			//_display = uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY";
			//_center = (uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201) ctrlsettextcolor _colorGUI;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201) ctrlcommit 0;
		};

		_oldTooltip = _logic getvariable "BIS_COIN_tooltip";
		//_display = uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY";
		if ((_tooltipType + _tooltip) != _oldTooltip || commandingmenu != _oldMenu) then {

			//--- Description
			_type = _tooltip;

			//--- Header & preview picture

			_textHeader = "<t size='1.2'><br /></t>";
			_textPicture = "<t size='2.8'><br /></t><br /><br />";

			if (isClass (configfile >> "cfgvehicles" >> _type)) exitwith {};

			_fileIcon = gettext (configfile >> "cfgvehicles" >> _type >> "icon");
			if (str(configfile >> "CfgVehicleIcons" >> _fileIcon) != "") then {_fileIcon = gettext (configfile >> "CfgVehicleIcons" >> _fileIcon)};
			_filePicture = gettext (configfile >> "cfgvehicles" >> _type >> "picture");

			//Clear image for undefined static types.
			if (_filePicture == "pictureStaticObject") then {_filePicture = ""};

			if (str(configfile >> "CfgVehicleIcons" >> _filePicture) != "") then {_filePicture = gettext (configfile >> "CfgVehicleIcons" >> _filePicture)};

			if (_tooltipType != "empty") then {
				_textHeader = format ["<t align='center'><t size='1.4'>%1</t><br /><t size='1'></t></t>",
					gettext (configfile >> "cfgvehicles" >> _type >> "displayname"),
					if (isnull _selected) then {""} else {str round ((1 - damage _selected) * 100) + "%"}
				];
				_textPicture = format ["<t align='left' size='2.8' shadow='0'><img image='%1'/></t> ",_filePicture];
			};

			/*
			_textHeader = "X";
			_textPicture = "";
			*/

			_onRepair = if (isnil {_logic getvariable "BIS_COIN_onRepair"}) then {{}} else {_logic getvariable "BIS_COIN_onRepair"};
			_text1 = if (_tooltipType == "selected" && (str _onRepair != str {})) then {

				//--- Repair hint
				localize "str_coin_repair" + "<t align='right'>" + call compile (actionKeysNames ["User13",1]) + "</t><br />";
			} else {
				//--- Rotate
				if (count _params > 0) then {
					localize "str_coin_rotate" + "<t align='right'>" + call compile (keyname 29) + "</t><br />";
				} else {"<br />"};
			};

			_onSell = if (isnil {_logic getvariable "BIS_COIN_onSell"}) then {{}} else {_logic getvariable "BIS_COIN_onSell"};
			_text2 = if (_tooltipType == "selected" && (str _onSell != str {})) then {

				//--- Sell hint
				localize "str_coin_sell" + "<t align='right'>" + call compile (actionKeysNames ["User14",1]) + "</t><br />";
			} else {

				//--- Build hint
				if (count _params > 0) then {
					localize "str_coin_build" + "<t align='right'>" + call compile (actionKeysNames ["DefaultAction",1]) + "</t><br />";
				} else {"<br />"};

			};

			_text3 = if (commandingmenu != "#USER:BIS_Coin_categories_0") then {

				//--- Back hint
				if (isnil "BIS_Coin_noExit") then {
					localize "str_coin_back" + "<t align='right'>" + call compile (actionKeysNames ["MenuBack",1]) + "</t>";
				} else {""};
			} else {

				//--- Exit hint
				if (isnil "BIS_Coin_noExit") then {
					"<t color='#ff5544'>" + localize "str_coin_exit" + "<t align='right'>" + call compile (actionKeysNames ["MenuBack",1]) + "</t></t>";
				} else {""};
			};

			//--- Compose text
			_textHint = (
			 	_textPicture +
				_textHeader +
				""
			);

			_textControls = (
				_text1 +
				_text2 +
				_text3 +
				""
			);

			//--- Set box
			//_bcg = (uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112211;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112211) ctrlshow true;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112211) ctrlcommit 0;
			//_desc = _display displayctrl 112214;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112214) ctrlsetstructuredtext (parsetext _textHint);
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112214) ctrlshow true;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112214) ctrlcommit 0;
			//_controls = _display displayctrl 112215;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112215) ctrlsetstructuredtext (parsetext _textControls);
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112215) ctrlshow true;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112215) ctrlcommit 0;
		};

		//--- Amount of funds changed
		_funds = _logic getvariable "BIS_COIN_funds";
		_fundsDescription = _logic getvariable "BIS_COIN_fundsDescription";
		_cashValues = [];
		{
			_cashValues = _cashValues + [call compile _x];
		} foreach _funds;
		_cashValuesOld = _logic getvariable "BIS_COIN_fundsOld";
		if (isnil "_cashValuesOld") then {_cashValuesOld = []; _cashValuesOld set [count _cashValues - 1,-1]};
		_restart = _logic getvariable "BIS_COIN_restart";
		if (!([_cashValues,_cashValuesOld] call bis_fnc_arraycompare) || _restart) then {
			_cashValuesCount = count _cashValues;
			_cashSize = if (_cashValuesCount <= 1) then {2} else {2.8 / _cashValuesCount};
			_cashText = format ["<t size='%1' align='left' valign='middle'>",_cashSize];
			_cashLines = 0;
			for "_i" from 0 to (count _funds - 1) do {
				_cashValue = _cashValues select _i;
				_cashDescription = if (count _fundsDescription > _i) then {_fundsDescription select _i} else {"?"};
				_cashText = _cashText + format ["%1 %2<br />",_cashDescription,round _cashValue];
				_cashLines = _cashLines + 0.05;
			};
			_cashText = _cashText + "</t>";
			//_cash = _display displayctrl 112224;
			_cashPos = ctrlposition ((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112224);
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112224) ctrlsetstructuredtext (parsetext _cashText);
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112224) ctrlsetposition [_cashPos select 0,_cashPos select 1,_cashPos select 2,(_cashPos select 3)/*0.1*/ + _cashLines];
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112224) ctrlshow true;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112224) ctrlcommit 0;

			//--- Categories menu
			_categories = +(_logic getvariable "BIS_COIN_categories");
			//_categoriesLong = [];
			//{_categoriesLong = _categoriesLong + [_x + ""]} foreach _categories; //--- Adding empty spaces will widen the box to max value
			_categoriesMenu = [];
			for "_i" from 0 to (count _categories - 1) do {
				_categoriesMenu = _categoriesMenu + [_i];
			};

			[["Categories",true],"BIS_Coin_categories",[_categoriesMenu,_categories],"#USER:BIS_Coin_%1_items_0","",""] call BIS_fnc_createmenu;

			//--- Items menu
			_items = _logic getvariable "BIS_COIN_items";
			_canAffordCountOld = _canAffordCount;
			_canAffordCount = 0;
			textLogFormat ["COIN_ %1",_items];
			for "_i" from 0 to (count _categories - 1) do {
				_category = _categories select _i;
				_arrayNames = [];
				_arrayNamesLong = [];
				_arrayEnable = [];
				_arrayParams = [];
				{
					_itemclass = _x select 0;
					_itemcategory = _x select 1;
					if (typename _itemcategory == typename "") then {//--- Backward compatibility
						_itemcategory = _categories find _itemcategory;
						textLogFormat ["Log: [COIN] ERROR: Old category used: '%1' (in '%2')",_itemcategory,_itemclass];
					} else {100};

					if (_itemcategory < count _categories) then {
						_itemcost = _x select 2;
						_itemcash = 0;
						if (typename _itemcost == "ARRAY") then {_itemcash = _itemcost select 0; _itemcost = _itemcost select 1};
						_cashValue = _cashValues select _itemcash;
						_cashDescription = if (count _fundsDescription > _itemcash) then {_fundsDescription select _itemcash} else {"?"};
						_itemname = if (count _x > 3) then {_x select 3} else {gettext (configfile >> "CfgVehicles" >> _itemclass >> "displayName")};
						if (_itemcategory == _i/*_category*/) then {
							_canAfford = if (_cashValue - _itemcost >= 0) then {1} else {0};
							_canAffordCount = _canAffordCount + _canAfford;
							_text = _itemname + " - " + _cashDescription + str _itemcost;
							_arrayNames = _arrayNames + [_text];
							_arrayNamesLong = _arrayNamesLong + [_text + "                   "];
							_arrayEnable = _arrayEnable + [_canAfford];
							_arrayParams = _arrayParams + [[nil] + [_x,_i]];
						};
					} else {textLogFormat ["Log: [CoIn] ERROR: Invalid category '%1' used in '%2'",_itemcategory,_itemclass]};
				} foreach _items;


				[[_category,true],format ["BIS_Coin_%1_items",_i],[_arrayNames,_arrayNamesLong,_arrayEnable],"","
					BIS_CONTROL_CAM_LMB = false;
					scopename 'main';
					_item = '%1';
					_id = %2;
					_array = (call compile '%3') select _id;

					_params = _array select 1;
					gosa_HQ_logic setvariable ['BIS_COIN_params',_params];
					gosa_HQ_logic setvariable ['BIS_COIN_menu',commandingmenu];
					showcommandingmenu '';

				",_arrayParams] call BIS_fnc_createmenu;
				/*

				[_category,format ["BIS_Coin_%1_items",_category],[_arrayNames,_arrayNamesLong,_arrayEnable],"","
					debugLog ('item: %1 id %2 array %3');

				",_arrayParams] call BIS_fnc_createmenu;
				*/
			};

			if (_canAffordCount != _canAffordCountOld) then {showcommandingmenu (commandingmenu)}; //<-- Open menu again to show disabled items
		};
		_logic setvariable ["BIS_COIN_fundsOld",_cashValues];
		_logic setvariable ["BIS_COIN_tooltip",_tooltipType + _tooltip];

		if (_restart) then {
			_logic setvariable ["BIS_COIN_restart",false];
			//showcommandingmenu "";
		};
	};
	_oldMenu = commandingmenu;

	sleep 0.01;
};


//--- Camera no longer exists - terminate and start cleanup
//////////////////////////////////////////////////
// startLoadingScreen [localize "str_coin_exit" + " " + localize "str_coin_name","RscDisplayLoadMission"];
//////////////////////////////////////////////////

BIS_CONTROL_CAM cameraeffect ["terminate","back"];
camdestroy BIS_CONTROL_CAM;
BIS_CONTROL_CAM = nil;
BIS_CONTROL_CAM_Handler = nil;
1122 cuttext ["","plain"];
_player = bis_coin_player;
_player setvariable ["bis_coin_logic",nil];
bis_coin_player = objnull;
_preview = _logic getvariable "BIS_COIN_preview";
if !(isnil "_preview") then {deletevehicle _preview};
//_logic setvariable ["BIS_COIN_mousepos",nil];
_logic setvariable ["BIS_COIN_preview",nil];
_logic setvariable ["BIS_COIN_selected",nil];
_logic setvariable ["BIS_COIN_params",nil];
_logic setvariable ["BIS_COIN_lastdir",nil];
_logic setvariable ["BIS_COIN_tooltip",nil];
_logic setvariable ["BIS_COIN_fundsOld",nil];
_logic setvariable ["BIS_COIN_restart",nil];
_logic setvariable ["BIS_COIN_nvg",nil];
showcommandingmenu "";

//--- Behold the placeholders
BIS_COIN_QUIT = nil;
_border = missionnamespace getvariable "BIS_COIN_border";
if (!(isNil "_border")) then {{deletevehicle _x} foreach _border;};
missionnamespace setvariable ["BIS_COIN_border",nil];

//////////////////////////////////////////////////
// endLoadingScreen;
//////////////////////////////////////////////////
