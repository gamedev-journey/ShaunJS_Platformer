//Get player input
if (hasControl)
{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));

	if (key_left) || (key_right) || (key_jump)
	{
		controller = 0;
	}

	if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(0, gp_face1))
	{
		key_jump = 1;
		controller = 1;
	}
}
else
{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}

// Calculate movement
var move = key_right - key_left;

horizontal_speed = move * walking_speed;

vertical_speed += player_gravity;

if (place_meeting(x, y + 1, oWall)) && (key_jump)
{
	vertical_speed = jump_speed;
}

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
	sprite_index = sPlayerJump;
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
	if (sprite_index == sPlayerJump)
	{
		audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2));
		audio_play_sound(snLanding, 4, false);
	}
	image_speed = 1;
	if (horizontal_speed == 0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerRun;
	}
}

if (horizontal_speed != 0)
{
	image_xscale = sign(horizontal_speed);
}
