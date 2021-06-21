private  ["_logic"];
_logic = _this select 3 select 0;
private  ["_COIN_items"];
_COIN_items = _this select 3 select 1;

private["_gosa_COIN_areasize"];
_gosa_COIN_areasize = [_this select 3 select 2, _this select 3 select 2];

if ([[_logic], gosa_objectsCoinMHQ] call gosa_fnc_CheckIsKindOfArray) then {
	gosa_objectCoin = _logic;
}else{
	gosa_objectCoin = objNull;
};

uinamespace setvariable ["COIN_displayMain",finddisplay 46];


gosa_CONTROL_CAM_Handler = {
	_mode = _this select 0;
	_input = _this select 1;
	if !(isNil "gosa_CONTROL_CAM") then {_camera = gosa_CONTROL_CAM};
	_terminate = false;

	if (_mode == "mousedown") then {
		_key = _input select 1;
		if (_key == 1 && 65665 in actionkeys "MenuBack") then {_terminate = true};

		if (_key == 0 && 65536 in actionKeys "DefaultAction") then {
			if (!isNil{gosa_Coin_Allow} && !isNil{gosa_Coin_selectedType} && !isNil{gosa_Coin_preview_pos} && !isNil{gosa_Coin_preview} && commandingmenu == "") then {
				gosa_Coin_Allow=nil;
				_pos = gosa_Coin_preview_pos;
				_dir = direction gosa_Coin_preview;
				deletevehicle gosa_Coin_preview;
				deletevehicle gosa_objectCoin;
				_building = gosa_Coin_selectedType createvehicle [(gosa_posDefaultHiden select 0) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2)), (gosa_posDefaultHiden select 1) + ((random gosa_posDefaultHidenRandom) - (gosa_posDefaultHidenRandom/2))];
				_building setdir _dir;
				_building setVectorUp surfaceNormal _pos;
				_building setpos _pos;
				if (gosa_Coin_selectedType isKindOf "Warfare_HQ_base_unfolded") then {
					gosa_COIN_QUIT = true;
				} else {
					showcommandingmenu "#USER:gosa_Coin_categories_0";
					gosa_Coin_selectedType = nil;
				};
			};
		};
	};


	if (_mode == "keydown") then {
		_key = _input select 1;

		if (_key in actionkeys "MenuBack") then {_terminate = true};

		if (_key in actionKeys "NightVision") then {
			gosa_COIN_nvg = !gosa_COIN_nvg;
			camusenvg gosa_COIN_nvg;
		};
	};

	if (_mode == "keyup") then {
		_key = _input select 1;
	};

	if (_terminate) then {

			if (commandingmenu == "#USER:gosa_Coin_categories_0") then {
				gosa_COIN_QUIT = true;
			} else {
				if (commandingmenu == "") then {
					gosa_COIN_menu_restart = true;
				};
			};
	};
};

//_createBorder = {
	// _logic = _this;
	//_oldBorder = missionnamespace getvariable "BIS_COIN_border";
	//if (!isnil "_oldBorder") then {
		//{deletevehicle _x} foreach _oldBorder;
	//};
	//missionnamespace setvariable ["BIS_COIN_border",nil];

	_border = [];
	_center = position _logic;
	_size = _gosa_COIN_areasize select 0;
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
//_size = sqrt (((_size *4)^2)/(_width^2));

/*
	_pi = 3.14159265358979323846;
	_perimeterOrig = (_size * 2 * _pi);
	_perimeterOrig = _perimeterOrig + _width - (_perimeterOrig % _width);

	_total = _perimeterOrig / _width;
	_perimeter = _perimeterOrig / _width;
	_minD = 2 * sqrt ((_size/2)^2 - _total);
	_size = _minD;
*/

//hintc str [_total,_size];
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
	//missionnamespace setvariable ["BIS_COIN_border",_border];
//};
//_createBorderScope = _logic spawn _createBorder;

if (isnil "gosa_CONTROL_CAM") then {
  private["_camera"];
	_camera = "camconstruct" camcreate [position player select 0,position player select 1,15];
	_camera cameraeffect ["internal","back"];
	_camera camPrepareFOV 0.900;
	_camera campreparefocus [-1,-1];
	_camera camCommitPrepared 0;
  cameraEffectEnableHUD true;
	_camera setdir direction player;
	[_camera,-30,0] call BIS_fnc_setPitchBank;
	_camera camConstuctionSetParams ([position _logic] + _gosa_COIN_areasize);

  gosa_COIN_menu = "#USER:gosa_Coin_categories_0";
	gosa_COIN_nvg = if (currentVisionMode player > 0) then {true} else {false};
  camusenvg gosa_COIN_nvg;

	gosa_COIN_EH_keydown =		(uinamespace getvariable "COIN_displayMain") displayaddeventhandler [
  "KeyDown",		"if !(isnil 'gosa_CONTROL_CAM_Handler') then {['keydown',_this] call gosa_CONTROL_CAM_Handler;}"];
	gosa_COIN_EH_keyup =			(uinamespace getvariable "COIN_displayMain") displayaddeventhandler [
  "KeyUp",		"if !(isnil 'gosa_CONTROL_CAM_Handler') then {['keyup',_this] call gosa_CONTROL_CAM_Handler;}"];
	gosa_COIN_EH_mousebuttondown =	(uinamespace getvariable "COIN_displayMain") displayaddeventhandler [
  "MouseButtonDown",	"if !(isnil 'gosa_CONTROL_CAM_Handler') then {['mousedown',_this] call gosa_CONTROL_CAM_Handler;}"];

  gosa_CONTROL_CAM = _camera;

  1122 cutrsc ["constructioninterface","plain"];
};





private["_categories"];
_colorGreen = "#(argb,8,8,3)color(0,1,0,0.3,ca)";
_colorRed = "#(argb,8,8,3)color(1,0,0,0.3,ca)";
_colorGray = "#(argb,8,8,3)color(1,1,1,0.1,ca)";
_colorGray = "#(argb,8,8,3)color(0,0,0,0.25,ca)";

while {!isnil "gosa_CONTROL_CAM"} do {
	if (!isnil "gosa_COIN_QUIT") exitwith {

		sleep 0.75;

		if !(isnil "gosa_CONTROL_CAM") then {gosa_CONTROL_CAM cameraeffect ["terminate","back"];camdestroy gosa_CONTROL_CAM;};
		gosa_CONTROL_CAM = nil;
		1122 cuttext ["","plain"];
		showcommandingmenu "";

		(uinamespace getvariable "COIN_displayMain") displayRemoveEventHandler ["KeyDown",gosa_COIN_EH_keydown];
		(uinamespace getvariable "COIN_displayMain") displayRemoveEventHandler ["KeyUp",gosa_COIN_EH_keyup];
		(uinamespace getvariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonDown",gosa_COIN_EH_mousebuttondown];

		if !(isnil "gosa_Coin_preview") then {deletevehicle gosa_Coin_preview;};
		gosa_Coin_preview = nil;

		if (!(isNil "_border")) then {{deletevehicle _x} foreach _border;};

		gosa_COIN_QUIT = nil;
		gosa_COIN_menu_restart = nil;
		gosa_Coin_selectedType = nil;

	};


	if (isNil{_categories} or !isNil{gosa_COIN_menu_restart}) then {
	  _categories = [];
	  {
	      if !(_x select 1 in _categories) then {
	        _categories set [count _categories, _x select 1];
	      };
	  } forEach _COIN_items;

	  _categoriesMenu = [];
	  for "_i" from 0 to (count _categories - 1) do {
	    _categoriesMenu = _categoriesMenu + [_i];
	  };

	  [["Categories",true],"gosa_Coin_categories",[_categoriesMenu,_categories],"#USER:gosa_Coin_%1_items_0","",""] call BIS_fnc_createmenu;

	  for "_i" from 0 to (count _categories - 1) do {
	    _category = _categories select _i;
	    _arrayNames = [];
	    _arrayNamesLong = [];
	    _arrayEnable = [];
	    _arrayParams = [];
	    {
	      _itemclass = _x select 0;
	      _itemcategory = _x select 1;
	      if (typename _itemcategory == typename "") then {
	        _itemcategory = _categories find _itemcategory;
	      } else {100};

	      if (_itemcategory < count _categories) then {
	        _itemcost = _x select 2;
	        _itemname = if (count _x > 3) then {_x select 3} else {gettext (configfile >> "CfgVehicles" >> _itemclass >> "displayName")};
	        if (_itemcategory == _i) then {
	          _text = _itemname + " - " + "$" + str _itemcost;
	          _arrayNames = _arrayNames + [_text];
	          _arrayNamesLong = _arrayNamesLong + [_text + "                   "];
	          _arrayEnable = _arrayEnable + [1];
	          _arrayParams = _arrayParams + [[_x,_i]];
	        };
	      };
	    } foreach _COIN_items;

			[[_category,true],format ["gosa_Coin_%1_items",_i],[_arrayNames,_arrayNamesLong,_arrayEnable],"","
				_item = '%1';
				_id = %2;
				_array = (call compile '%3') select _id;
				gosa_Coin_selectedType = (_array select 0 select 0);
				showcommandingmenu '';
				",_arrayParams] call BIS_fnc_createmenu;
		};

		showcommandingmenu "#USER:gosa_Coin_categories_0";

		if !(isnil "gosa_Coin_preview") then {deletevehicle gosa_Coin_preview;};

		gosa_COIN_menu_restart = nil;
		gosa_Coin_preview = nil;
		gosa_Coin_selectedType = nil;

	};


	if (!isNil{gosa_Coin_selectedType}) then {
	  _color = _colorGreen;
	  if (isNil{gosa_Coin_preview}) then {
	    gosa_Coin_preview = objNull;
	  };
	  if (typeof gosa_Coin_preview != gettext (configfile >> "CfgVehicles" >> gosa_Coin_selectedType >> "ghostpreview")) then {
	    deletevehicle gosa_Coin_preview;
	    gosa_Coin_preview = gettext (configfile >> "CfgVehicles" >> gosa_Coin_selectedType >> "ghostpreview") createVehicleLocal (screentoworld [0.5,0.5]);
	    gosa_CONTROL_CAM camsettarget gosa_Coin_preview;
	    gosa_CONTROL_CAM camcommit 0;

	    gosa_Coin_preview setObjectTexture [0,_colorGray];

	  } else {
	    if (
	      ([position gosa_Coin_preview,_logic] call BIS_fnc_distance2D) > (_gosa_COIN_areasize select 0)
	    ) then {
	      _color = _colorGray
	    } else {

	      _dist = (sizeof typeof gosa_Coin_preview) / 2 min 4;
	      if (gosa_Coin_selectedType isKindOf "StaticWeapon") then {
	          _dist = 0.25;
	      };

				private["_pos"];
				_pos = position gosa_Coin_preview;
	      _isFlat = _pos isflatempty [
	        _dist,	//--- Minimal distance from another object
	        -1,				//--- If 0, just check position. If >0, select new one
	        -1,				//--- Max gradient
	        _dist,	//--- Gradient area
	        0,				//--- 0 for restricted water, 2 for required water,
	        false,				//--- True if some water can be in 25m radius
	        gosa_Coin_preview			//--- Ignored object
	      ];
	      if (count _isFlat == 0) then {_color = _colorRed; gosa_Coin_Allow=nil}else{gosa_Coin_Allow=_pos};
				gosa_Coin_preview_pos = _pos;
			};
			gosa_Coin_preview setObjectTexture [0,_color];

			_colorGUI = [1,1,1,0.1];
			if (_color == _colorGreen) then {_colorGUI = [0.3,1,0.3,0.3]};
			if (_color == _colorRed) then {_colorGUI = [1,0.2,0.2,0.4]};

			((uiNamespace getvariable "gosa_CONTROL_CAM_DISPLAY") displayctrl 112201) ctrlsettextcolor _colorGUI;
			((uiNamespace getvariable "gosa_CONTROL_CAM_DISPLAY") displayctrl 112201) ctrlcommit 0;
		};
	};

	sleep 0.01;
};
