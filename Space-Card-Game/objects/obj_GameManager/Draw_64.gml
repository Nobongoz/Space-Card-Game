/// @description Insert description here
// You can write your code in this editor

draw_set_valign(fa_center);
draw_set_halign(fa_left);
draw_set_font(fnt_thefont);

draw_sprite(spr_heal_icon, 0, 45, 35);
draw_text_colour(80, 35, string(global.CPU_HP) + " +(" + string(global.CPU_healing) + ")", c_white, c_white, c_white, c_white, 1);

draw_sprite(spr_attack_icon, 0, 350, 35);
draw_text_colour(385, 35, string(global.CPU_attack), c_white, c_white, c_white, c_white, 1);

draw_sprite(spr_upgrade_icon, 0, 555, 35);
draw_text_colour(590, 35, string(global.CPU_upgrades) + "/12", c_white, c_white, c_white, c_white, 1);


//Player HUD
draw_sprite(spr_heal_icon, 0, 45, room_height - 35);
draw_text_colour(80, room_height - 35, string(global.player_HP) + " +(" + string(global.player_healing) + ")", c_white, c_white, c_white, c_white, 1);

draw_sprite(spr_attack_icon, 0, 350, room_height - 35);
draw_text_colour(385, room_height - 35, string(global.player_attack), c_white, c_white, c_white, c_white, 1);

draw_sprite(spr_upgrade_icon, 0, 555, room_height - 35);
draw_text_colour(590, room_height - 35, string(global.player_upgrades) + "/12", c_white, c_white, c_white, c_white, 1);

if(game_over == true)
{
	draw_set_halign(fa_center);
	switch(winner)
	{
		case 0:
		draw_text_colour(room_width / 2, room_height / 2, "Defeat", c_white, c_white, c_red, c_red, 1);
		break;
		case 1:
		draw_text_colour(room_width / 2, room_height / 2, "Victory!", c_white, c_white, c_aqua, c_aqua, 1);
		break;
		case 2:
		draw_text_colour(room_width / 2, room_height / 2, "Tie", c_white, c_white, c_lime, c_lime, 1);
		break;
	}
	
	if(win_timer_up == false)
	{
		win_timer_up = true;
		alarm[2] = win_timer * room_speed;
	}
}