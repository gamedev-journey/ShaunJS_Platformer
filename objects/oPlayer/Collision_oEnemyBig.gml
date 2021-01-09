with (oGun) instance_destroy();

instance_change(oPlayerDead, true);

direction = point_direction(other.x, other.y, x, y);
horizontal_speed = lengthdir_x(8, direction);
vertical_speed = lengthdir_y(6, direction) - 6;
if (sign(horizontal_speed) != 0) image_xscale = sign(horizontal_speed);