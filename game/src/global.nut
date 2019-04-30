////////////
// GLOBAL //
////////////

::gvGameMode <- 0;
::Game <- {
	//Global variables for gameplay
	//Stored in player save files
};
::gvCon <-{
	//Configuration data
	//Loaded automatically at startup
	//Default values defined in case
	//config file does not exist

	ctrl = {
		p0 = {
			mode = 0;
			left = [k_left, jd_left],
			right = [k_right, jd_right],
			up = [k_up, jd_up],
			down = [k_down, jd_down],
			jump = [k_s, jb_a],
			atk = [k_d, jb_x],
			spec0 = [k_w, jb_y],
			spec1 = [k_a, jb_b],
			spec2 = [k_f, jb_r],
			dash = [k_lshift, jb_l]
		},
		p0 = {
			mode = 1,
			left = [k_left, jd_left],
			right = [k_right, jd_right],
			up = [k_up, jd_up],
			down = [k_down, jd_down],
			jump = [k_s, jb_a],
			atk = [k_d, jb_x],
			spec0 = [k_w, jb_y],
			spec1 = [k_a, jb_b],
			spec2 = [k_f, jb_r],
			dash = [k_lshift, jb_l]
		}
	}
};
