const kylong = 34560.0; // 32km per tile, 1080 tiles wide
const kylat = 23040.0; // 32km per tile, 720 tiles high

::mercator_distance <- function(x1, y1, x2, y2) {
	//Convert coordinates from mercator to lat/lon
	local lon1 = x1 / kylong;
	local lat1 = y1 * atan(exp(y / kylong)) - _pi / 2.0;
	local lon2 = x2 / kylong;
	local lat2 = y2 * atan(exp(y2 / kylong)) - _pi / 2.0;

	//Haversine formula
	local dlon = lon2 - lon1;
	local dlat = lat2 - lat1;
	local a = sin(dlat / 2) * sin(dlat / 2) + cos(lat1) * cos(lat2) * sin(dlon / 2) * sin(dlon / 2);
	local c = 2 * atan2(sqrt(a), sqrt(1.0 - a));

	return kylong * c; //Distance in meters
}