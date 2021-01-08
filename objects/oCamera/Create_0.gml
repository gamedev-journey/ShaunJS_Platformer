cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;
xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
camera_buffer = 32;

mountainLayer = layer_get_id("Mountains");
treeLayer = layer_get_id("Trees");