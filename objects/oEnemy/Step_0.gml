
vertical_speed += player_gravity;


// Horizontal Collision
if (place_meeting(x + horizontal_speed, y, oWall))
{
	while (!place_meeting(x + sign(horizontal_speed), y, oWall))
	{
		x += sign(horizontal_speed);
	}
	horizontal_speed = -horizontal_speed;
}

x += horizontal_speed;

// Vertical Collision
if (place_meeting(x, y + vertical_speed, oWall))
{
	while (!place_meeting(x, y + sign(vertical_speed), oWall))
	{
		y += sign(vertical_speed);
	}
	vertical_speed = 0;
}

y += vertical_speed;

//Animation
if (!place_meeting(x, y + 1, oWall))
{
	sprite_index = sEnemyJump;
	image_speed = 0;
	if (sign(vertical_speed) > 0)
	{
		image_index = 1;
	}
	else
	{
		image_index = 0;
	}
}
else
{
	image_speed = 1;
	if (horizontal_speed == 0)
	{
		sprite_index = sEnemy;
	}
	else
	{
		sprite_index = sEnemyRun;
	}
}

if (horizontal_speed != 0)
{
	image_xscale = sign(horizontal_speed);
}
