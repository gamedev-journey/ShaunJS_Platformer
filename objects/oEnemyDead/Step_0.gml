if (done == 0)
{
	vertical_speed += player_gravity;


	// Horizontal Collision
	if (place_meeting(x + horizontal_speed, y, oWall))
	{
		while (!place_meeting(x + sign(horizontal_speed), y, oWall))
		{
			x += sign(horizontal_speed);
		}
		horizontal_speed = 0;
	}

	x += horizontal_speed;

	// Vertical Collision
	if (place_meeting(x, y + vertical_speed, oWall))
	{
		if (vertical_speed > 0)
		{
			done = 1;
			image_index = 1;
		}
		while (!place_meeting(x, y + sign(vertical_speed), oWall))
		{
			y += sign(vertical_speed);
		}
		vertical_speed = 0;
	}

	y += vertical_speed;
}