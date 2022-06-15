#define __A2OA__

while {gosa_loglevel > 0} do {
	#ifdef __A2OA__
	systemChat localize "STR_gosa_debug_notice";
	#else
		player groupChat localize "STR_gosa_debug_notice";
	#endif
	sleep (2 * 60);
};
