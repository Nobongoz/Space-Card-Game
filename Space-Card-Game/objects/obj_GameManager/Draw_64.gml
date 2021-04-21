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