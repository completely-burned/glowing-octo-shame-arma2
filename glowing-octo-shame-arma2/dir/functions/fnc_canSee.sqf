/* проверка возможности видить в темноте
 * проверяет приборы ночного видения и тепловизоров
 * TODO: наличие подобных прицелов
 * наличие осветительных ракет
 * устанавливает уровень
 * TODO: в данный момент до 7 максимум
 * TODO: проверять нужно по внутренним параметрам игры
 * TODO: так-же можно проверять луну, фонари, пожар и прочие источники света
 */

diag_log format["Log: [fnc_canNVG] weapons %1", weapons _this];
if ("NVGoggles" in weapons _this) exitwith {6};

diag_log format["Log: [fnc_canNVG] magazines %1", magazines _this];
if ("FlareWhite_GP25" in magazines _this) exitwith {3};
if ("FlareWhite_M203" in magazines _this) exitwith {3};

0;
