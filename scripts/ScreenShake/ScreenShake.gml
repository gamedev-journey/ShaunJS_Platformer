// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenShake(){
with (oCamera)
{
	if (argument[0] > shake_remain)
	{
		shake_magnitude = argument[0];
		shake_remain = argument[0];
		shake_length = argument[1];
	}
}
}