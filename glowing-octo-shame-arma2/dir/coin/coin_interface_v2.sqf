
/*
 * Интерфейс строительства.
 * TODO: Нужна очередь и визуальное строительство.
 * TODO: Устранить конфликт возрождающихся тс на месте строительства.
*/
diag_log format ["Log: [coin_interface] %1", _this];

private["_camera","_areasize","_player","_preview",
	"_display","_cfgVeh","_dist","_itemcost","_time",
	"_ctrl","_alt","_shift","_itemname",
	"_menu_root",
	"_colorGreen","_colorRed","_colorGray",
	"_EH_keydown","_EH_keyup","_EH_mousebuttondown","_EH_mousebuttonup"];

_cfgVeh = LIB_cfgVeh;

_logic = (_this select 3 select 1 select 0);

// объект радом с  котором строится
BIS_coin_logic = _logic;
/*
if (isNil "BIS_coin_logic") then {
	BIS_coin_logic = gosa_menu select 0;
};
_logic = BIS_coin_logic;
*/

_player = player;

_menu_root = _logic getVariable "BIS_COIN_menu";
if (isNil "_menu_root") then {
	_menu_root = "#USER:BIS_Coin_categories_0";
	_logic setVariable ["BIS_COIN_menu", _menu_root];
};
_areasize = _logic getVariable "BIS_COIN_areasize";
if (isNil "_areasize") then {
	_areasize = [50, 20];
	_logic setVariable ["BIS_COIN_areasize", _areasize];
};


// При смерти будет (bis_coin_player != player)
bis_coin_player = _player;
_player setvariable ["bis_coin_logic", _logic];

//- Здесь нажатия клавиш обрабатываются.
uinamespace setvariable ["COIN_displayMain", finddisplay 46];

//--- Terminate of system is already running
BIS_COIN_QUIT = nil;

//////////////////////////////////////////////////
// startLoadingScreen [localize "str_coin_name","RscDisplayLoadMission"];
//////////////////////////////////////////////////

if (isnil "BIS_CONTROL_CAM") then {
	_camera = "camconstruct" camcreate
		[position _player select 0, position _player select 1,15];
	_camera cameraeffect ["internal","BACK"];
	_camera camPrepareFOV 0.900;
	_camera campreparefocus [-1,-1];
	_camera camCommitPrepared 0;
	cameraEffectEnableHUD true;
	_camera setdir direction _player;
	_camera camCommand "atl off";
	[_camera,-30,0] call BIS_fnc_setPitchBank;
	_camera camConstuctionSetParams ([position _logic] + _areasize);
};

BIS_CONTROL_CAM = _camera;
BIS_CONTROL_CAM_LMB = false;
BIS_CONTROL_CAM_RMB = false;
showcinemaborder false;

// Круг
//1122 cutrsc ["constructioninterface","plain"];

_EH_keydown=
		(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["KeyDown",
		"if !(isnil 'BIS_CONTROL_CAM_Handler') then {
			BIS_temp = ['keydown',_this,commandingmenu] spawn BIS_CONTROL_CAM_Handler;
			BIS_temp = nil;
		}"];
	_EH_keyup=
		(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["KeyUp",
		"if !(isnil 'BIS_CONTROL_CAM_Handler') then {
			BIS_temp = ['keyup',_this] spawn BIS_CONTROL_CAM_Handler;
			BIS_temp = nil;
		}"];
	_EH_mousebuttondown=
		(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["MouseButtonDown",
		"if !(isnil 'BIS_CONTROL_CAM_Handler') then {
			BIS_temp = ['mousedown',_this,commandingmenu] spawn BIS_CONTROL_CAM_Handler;
			BIS_temp = nil;
			BIS_CONTROL_CAM_onMouseButtonDown = _this;
			if (_this select 1 == 1) then {
				BIS_CONTROL_CAM_RMB = true
			};
			if (_this select 1 == 0) then {
				BIS_CONTROL_CAM_LMB = true
			};
		}"];
	_EH_mousebuttonup=
		(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["MouseButtonUp",
		"if !(isnil 'BIS_CONTROL_CAM_Handler') then {
			BIS_CONTROL_CAM_RMB = false;
			BIS_CONTROL_CAM_LMB = false;
		}"];
	//(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["MouseMoving",		"if !(isnil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['mousemoving',_this] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil;}"];
	//(uinamespace getvariable "COIN_displayMain") displayaddeventhandler ["MouseHolding",	"if !(isnil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['mouseholding',_this] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil;}"];

BIS_CONTROL_CAM_keys = [];


_logic setvariable ["BIS_COIN_selected",objnull];
	_logic setvariable ["BIS_COIN_params",[]];
	_logic setvariable ["BIS_COIN_tooltip",""];
	_logic setvariable ["BIS_COIN_restart",false];

// TODO: поддержка тепловизора

//--- Open menu
_logic spawn {
	private ["_logic","_params"];
	_logic = _this;
	//waituntil {!isnil {_this getvariable "BIS_COIN_fundsOld"} || isnil "BIS_CONTROL_CAM"};
	while {!isnil "BIS_CONTROL_CAM"} do {
		waituntil {
			sleep 0.01;
			_params = _logic getvariable "BIS_COIN_params";
			if (isNil "_params") then {_params = []};
			if (isNil "_params") then {_params = []};
			(commandingmenu == "" && count _params <= 0 && !BIS_CONTROL_CAM_RMB)
			|| isnil "BIS_CONTROL_CAM"
		};
		if (isnil "BIS_CONTROL_CAM") exitwith {};
		showcommandingmenu (_logic getvariable "BIS_COIN_menu");
		sleep 0.01;
	};
};

BIS_CONTROL_CAM_Handler = {
	diag_log format ["Log: [BIS_CONTROL_CAM_Handler] %1", _this];
	//if !(isNil "BIS_CONTROL_CAM") then {};
	_camera = BIS_CONTROL_CAM;
	_logic = BIS_coin_logic;
	//if (isnil "_logic") exitwith {};

	_mode = _this select 0;
	_input = _this select 1;

	_terminate = false;

	if !(isNull _logic) then {

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
			if (_key in _keysCancel) then {_terminate = true;};

		};
		//--- Key UP
		if (_mode == "keyup") then {
			_key = _input select 1;
			if (_key in BIS_CONTROL_CAM_keys) then {BIS_CONTROL_CAM_keys = BIS_CONTROL_CAM_keys - [_key]};
		};


		//-- Deselect or Close
		if (_terminate) then {
			_menu = _this select 2;

			//- Close
				_menu_root = _logic getVariable "BIS_COIN_menu";
				if (_menu == _menu_root) then {
					// Выход.
					if !(isNil "BIS_CONTROL_CAM") then {
						BIS_COIN_QUIT = true;
					};
				} else {
					// Переход в меню выше.
					_preview = _logic getvariable "BIS_COIN_preview";
					if !(isnil "_preview") then {deletevehicle _preview};
					_logic setvariable ["BIS_COIN_preview",nil];
					_logic setvariable ["BIS_COIN_params",[]];
				};
		};

	};

	//coinn = coinn + 1;
};

//--- Стена.
#ifndef __ARMA3__
	_createBorder = {
		_logic = _this;
		_size = _logic getvariable "BIS_COIN_areasize" select 0;

		// _oldBorder
		_border = missionnamespace getvariable "BIS_COIN_border";
		if !(isnil "_border") then {
			{deletevehicle _x} foreach _border;
		};
		missionnamespace setvariable ["BIS_COIN_border",nil];

		_border = [];
		_center = position _logic;
		_width = 9.998; //200/126
		_width = 9.996; //150/96
		_width = 9.992; //100/64
		_width = 9.967; //50/32
		_width = 9.917; //30/20
		_width = 9.83; //20/14
		_width = 9.48; //10/8
		_width = 10 - (0.1/(_size * 0.2));
		_width = 10;

		_pi = pi;
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
	_createBorderScope = _logic call _createBorder;
#endif

//////////////////////////////////////////////////
// endLoadingScreen;
//////////////////////////////////////////////////


/*******************************************************************************************************************************************************
/*** LOOOP *********************************************************************************************************************************************
/******************************************************************************************************************************************************/
_canAffordCount = 0;
_canAffordCountOld = 0;
_limitHOld = -1;
_limitVOld = -1;
_loaded = false;
_localtime = time;
//_preview = objNull;
_itemcost = 0;

_keysCancel		= actionKeys "MenuBack";
_keysRepair		= actionKeys "User13";
_keysSell		= actionKeys "User14";
_keysBanned		= [1];
_keysSelectAll		= actionKeys "SelectAll";
//--- Basic colors
_colorGreen = "#(argb,8,8,3)color(0,1,0,0.3,ca)";
_colorRed = "#(argb,8,8,3)color(1,0,0,0.3,ca)";
_colorGray = "#(argb,8,8,3)color(1,1,1,0.1,ca)";
_colorGray = "#(argb,8,8,3)color(0,0,0,0.25,ca)";

while {sleep 0.01; !isnil "BIS_CONTROL_CAM"
	&& player == bis_coin_player
	&& isnil "BIS_COIN_QUIT"} do
{
	// FIXME: что это?
	if (isnull (uinamespace getvariable 'BIS_CONTROL_CAM_DISPLAY') && !_loaded) then {
		cameraEffectEnableHUD true;
		// Круг
		//1122 cutrsc ["constructioninterface","plain"];
		_loaded = true;
		_logic setvariable ["BIS_COIN_restart",true];
		_localtime = time;
	};
	if ((time - _localtime) >= 1 && _loaded) then {_loaded = false};
	_logic = BIS_coin_logic;

	_mode = "mousemoving";
	//_input = _logic getvariable "BIS_COIN_mousepos";
	_camera = BIS_CONTROL_CAM;

	_areasize = _logic getvariable "BIS_COIN_areasize";
	_limitH = _areasize select 0;
	_limitV = _areasize select 1;
	_limitHOld = _limitH;
	_limitVOld = _limitV;

	//--- Mouse moving or holding
	if (true) then {

		//_x = _input select 1;
		//_y = _input select 2;

		//-- Нажатые клавиши.
		_keys = BIS_CONTROL_CAM_keys;
		_ctrl = (29 in _keys) || (157 in _keys);
		_shift = (42 in _keys) || (54 in _keys);
		_alt = (56 in _keys);

		//-- Выбранный объект.
		_params = _logic getvariable "BIS_COIN_params";
		_tooltip = "empty";
		_tooltipType = "empty";
		_selected = objnull;
		//--- Выбран объект.
		if (count _params > 0) then {
			_color = _colorGreen;

			// TODO: Construction

			//--- Class, Category, Cost, (preview class), (display name)
			_itemclass = _params select 0;
			//_itemcategory = _params select 1;
			_itemname = if (count _params > 3) then {
				_params select 3;
			} else {
				gettext (_cfgVeh >> _itemclass >> "displayName");
			};

			//- Preview.
			_itemclass_preview = gettext (_cfgVeh >> _itemclass >> "GhostPreview");
			if (_itemclass_preview == "") then {
				_itemclass_preview = _itemclass + "Preview";
			};
			if (configName (_cfgVeh >> _itemclass_preview) == "") then {
				_itemclass_preview = _itemclass;
			};


			//--- Preview building
			_preview = camtarget _camera;
			if (typeof _preview != _itemclass_preview) then {
				//--- No preview
				deletevehicle _preview;
				_preview = _logic getvariable "BIS_COIN_preview";
				if !(isnil "_preview") then {deletevehicle _preview};
				_preview = _itemclass_preview createvehicle (screentoworld [0.5,0.5]);
				diag_log format ["Log: [coin_interface] _preview = %1", _preview];
				_camera camsettarget _preview;
				_camera camcommit 0;
				_logic setvariable ["BIS_COIN_preview", _preview];

				_preview setObjectTexture [0, _colorGray];
				//_preview setvariable ["BIS_COIN_color", _colorGray];

				//--- Execute designer defined code
				//_code = _logic getvariable "BIS_COIN_onSelect";
				//[_itemclass,_preview] call _code;
				//[_logic, _preview,_itemclass] spawn _code;

				//--- Exception - preview not created
				if (isNull _preview) then {
					_logic setvariable ["BIS_COIN_preview",nil];
					_logic setvariable ["BIS_COIN_params",[]];
					diag_log format ["Log: [coin_interface] ERROR: Failed to create '%1' (preview of '%2')", _itemclass_preview, _itemclass];
				};

			} else {
				//--- Check zone
				if ([position _preview, _logic] call BIS_fnc_distance2D > _limitH) then 
				{
					_color = _colorGray;
				} else {
					// Автоматическое удаление разбитого статичного оружия при наводке.
					{if !(alive _x) then {deleteVehicle _x}} forEach (position _preview nearObjects ["StaticWeapon", 2.5]);

					// TODO: Проверка наличия денег.

					_dist = (sizeof typeof _preview) / 2 min 4;
					if (_itemclass isKindOf "StaticWeapon") then {_dist = 0.25};

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
					if (count _isFlat <= 0) then {_color = _colorRed};
				};
				_preview setObjectTexture [0, _color];
				//_preview setvariable ["BIS_COIN_color",_color];

				_tooltip = _itemclass;
				_tooltipType = "preview";

				//--- Temporary solution
				_colorGUI = [1,1,1,0.1];
				if (_color == _colorGreen) then {_colorGUI = [0.3,1,0.3,0.3]};
				if (_color == _colorRed) then {_colorGUI = [1,0.2,0.2,0.4]};

				// FIXME: Что это?
				//_display = uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY";
				//_center = (uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201;
				((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY")
					displayctrl 112201) ctrlsettextcolor _colorGUI;
				((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY")
					displayctrl 112201) ctrlcommit 0;
			};

			//-- Размещение.
			if (!isnull _preview &&
					((BIS_CONTROL_CAM_LMB
						&& 65536 in (actionKeys "DefaultAction"))
						|| {_x in (actionKeys "DefaultAction")}
							count BIS_CONTROL_CAM_keys > 0)
					&& _color == _colorGreen) then 
			{
				_pos = position _preview;
				_dir = direction _preview;
				deletevehicle _preview;
				_logic setvariable ["BIS_COIN_preview",nil];
				_logic setvariable ["BIS_COIN_params",[]];

				// TODO: Remove funds

				//-- Покупка.
				[_logic,_itemclass,_pos,_dir,_shift,_itemcost] call {
					_logic = _this select 0;
					_itemclass = _this select 1;
					_pos = _this select 2;
					_dir = _this select 3;
					_shift = _this select 4;
					_itemcost = _this select 5;

					// TODO: "BIS_COIN_onPurchase"

					//--- Build
					// TODO: Безопасное размещение.
					_building = _itemclass createvehicle _pos;
					_building setdir _dir;
					#ifdef __A2OA__
					_building setVectorUp surfaceNormal _pos;
					#endif
					_building setpos _pos;
					//if (gettext (_cfgVeh >> _itemclass >> "placement") == "vertical") then {_building setpos _pos}; //--- Vertical
					if (gettext (_cfgVeh >> _itemclass >> "namesound") == "fence" || _itemclass iskindof "StaticWeapon") then {_building setpos _pos}; //--- Vertical

					//- Дедубликация.
					_time = time+5;
					waituntil {time > _time or count (_pos nearObjects [_itemclass, 1]) > 0};

					// TODO: Register building

					// TODO: "BIS_COIN_onConstruct"
					/*
					_code = {
						//-- удаляем мобильный штаб и выходим
						if ((_this select 0) isKindOf "LandVehicle") then {
							BIS_COIN_QUIT = true;
							[_this select 1] call gosa_fnc_coin_variable;
							deleteVehicle (_this select 0);
						};
					};
					*/
					//[_logic, _building,_itemclass,_pos,_dir] spawn _code;
				};

				//--- Temporary solution
				_colorGUI = [1,1,1,0.1];
				//_display = uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY";
				//_center = (uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201;
				((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY")
					displayctrl 112201) ctrlsettextcolor _colorGUI;
				((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY")
					displayctrl 112201) ctrlcommit 0;
			};

		//--- Нет выбранного объекта.
		} else {
			_colorGUI = [1,1,1,0.1];

			//_buildings = _logic getvariable "BIS_COIN_buildings";
			if (true) then {
				//--- Selection, под курсором
				_worldpos = screentoworld [0.5,0.5];
				_selected = objnull;
				{
					_size = ((sizeof typeof _x) / 3) max 2;
					if (_x distance _worldpos < _size) exitwith {
						_selected = _x;
						_logic setvariable ["BIS_COIN_selected", _selected];
					};
					_logic setvariable ["BIS_COIN_selected",objnull];
				} foreach nearestObjects [_worldpos, [
						"WarfareBBaseStructure", "BASE_WarfareBFieldhHospital","StaticWeapon"
					], 20];

				//--- Selected building
				if !(isNull _selected) then {
					_colorGUI = [1,1,1,0.3];

					_tooltip = typeof _selected;
					_tooltipType = "selected";

					//--- Custom actions
					if (count _keys > 0 && !_ctrl) then {

						//--- Repair
						if ({_x in _keysRepair} count _keys > 0) then {
							[_logic,_selected] spawn {
								// TODO: "BIS_COIN_onRepair"
								(_this select 1) setdamage 0;
							};
						};

						//--- Продажа.
						if ({_x in _keysSell} count _keys > 0) then {
							[_logic, _selected] spawn {
								// TODO: "BIS_COIN_onSell"
								if !(_this select 1 isKindOf "WarfareBDepot"
									or _this select 1 isKindOf "WarfareBAirport") then
								{
									deletevehicle (_this select 1);
								};
							};
						};
					};
				};
			};

			//_display = uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY";
			//_center = (uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY") displayctrl 112201;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY")
				displayctrl 112201) ctrlsettextcolor _colorGUI;
			((uiNamespace getvariable "BIS_CONTROL_CAM_DISPLAY")
				displayctrl 112201) ctrlcommit 0;
		};

		// TODO: Обновление GUI.
		// TODO: Обновление меню.
		// TODO: Restart interface.
	};
};


//--- Camera no longer exists - terminate and start cleanup
//////////////////////////////////////////////////
// startLoadingScreen [localize "str_coin_exit" + " " + localize "str_coin_name","RscDisplayLoadMission"];
//////////////////////////////////////////////////

(uinamespace getvariable "COIN_displayMain") displayRemoveEventHandler ["KeyDown", _EH_keydown];
(uinamespace getvariable "COIN_displayMain") displayRemoveEventHandler ["KeyUp", _EH_keyup];
(uinamespace getvariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonDown", _EH_mousebuttondown];
(uinamespace getvariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonUp", _EH_mousebuttonup];

BIS_CONTROL_CAM cameraeffect ["terminate","back"];
camdestroy BIS_CONTROL_CAM;
sleep 1;
BIS_CONTROL_CAM_Handler = nil;
BIS_CONTROL_CAM = nil;
// Круг
//1122 cuttext ["","plain"];

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
if !(isNil "_border") then {{deletevehicle _x} foreach _border};
missionnamespace setvariable ["BIS_COIN_border",nil];

//////////////////////////////////////////////////
// endLoadingScreen;
//////////////////////////////////////////////////
