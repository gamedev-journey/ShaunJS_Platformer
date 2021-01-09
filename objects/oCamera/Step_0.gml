if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
	
	if ((follow).object_index == oPlayerDead)
	{
		x = xTo;
		y = yTo;
	}
}

x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x, view_w_half + camera_buffer, room_width - view_w_half - camera_buffer);
y = clamp(y, view_h_half + camera_buffer, room_height - view_h_half - camera_buffer);

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

if (layer_exists(mountainLayer))
{
	layer_x(mountainLayer, x/2);
}

if (layer_exists(treeLayer))
{
	layer_x(treeLayer, x/4);
}