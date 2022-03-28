private "_w";
_w = _this select 0 addWaypoint [_this select 1, _this select 2];
_w setWaypointType (_this select 3);
_w setWaypointDescription "glowing-octo-shame Waypoint created dynamically";
_w setWaypointStatements ["true",
	"if(!isNil {this})then{group this setVariable ['_grp_wp_completed', time]}"
];
diag_log format ["Log: [fnc_addWaypoint] %1, %2", _this, _w];
_w;
