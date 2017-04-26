if(!isMultiplayer)then{
	while {true} do {
		if(rating player < 0)then{
		   player addRating (0 - rating player);
		};
		sleep 1;
	};
};
