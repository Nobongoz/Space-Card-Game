/// @description Insert description here
// You can write your code in this editor

if(global.moving == false && moved == false && hand > 0)
{
	global.moving = true;
	moving = true;
}
else if(hand == 0)
{
	depth = -stackPos;
	var spot_x = global.deck_x;
	var spot_y = global.deck_y;
	x = x * (x_move_speed / 10) + spot_x * (1 - (x_move_speed / 10));
	y = y * (y_move_speed / 10) + spot_y * (1 - (y_move_speed / 10)) - (stackPos * stack_space);
}
else if(hand > 0 || hand < 0)
{
	depth = abs(x - y) * -1;
}
if(moving == true)
{
	switch(hand)
	{
		case 1:
	
		global.moving = true;
		var spot_x = (global.CPU_hand_x + ((card_space - 1) * place));
		var spot_y = global.CPU_hand_y;
		x = x * (x_move_speed / 10) + spot_x * (1 - (x_move_speed / 10));
		y = y * (y_move_speed / 10) + spot_y * (1 - (y_move_speed / 10));
		if(abs(y - spot_y) < 10 && abs(x - spot_x) < 10)
		{
			moved = true;
			moving = false;
			global.moving = false;
			x = spot_x;
			y = spot_y;
		}
	
		break;
	
		case 2:
	
		global.moving = true;
		var spot_x = (global.player_hand_x + ((card_space - 1) * place));
		var spot_y = global.player_hand_y;
		x = x * (x_move_speed / 10) + spot_x * (1 - (x_move_speed / 10));
		y = y * (y_move_speed / 10) + spot_y * (1 - (y_move_speed / 10));
		if(abs(y - spot_y) < 10 && abs(x - spot_x) < 10)
		{
			moved = true;
			moving = false;
			global.moving = false;
			x = spot_x;
			y = spot_y;
		}
	
		break;
		
	}
}

switch(hand)
{
	case 1:
	face_up = false;
	if(picked == true && global.current_phase == global.phase_CPU_chooses)
	{
		var spot_x = (global.CPU_hand_x + ((card_space - 1) * place));
		var spot_y = global.CPU_hand_y + 75;
		x = x * (x_move_speed / 10) + spot_x * (1 - (x_move_speed / 10));
		y = y * (y_move_speed / 10) + spot_y * (1 - (y_move_speed / 10));
		
		image_xscale = image_xscale * (y_move_speed / 10) + card_growth * (1 - (y_move_speed / 10));
		image_yscale = image_yscale * (y_move_speed / 10) + card_growth * (1 - (y_move_speed / 10));
		
		if(abs(y - spot_y) < 10 && abs(x - spot_x) < 10 && global.CPU_plays == 0)
		{
			global.current_phase = global.phase_player_chooses;
		}
		if(used == false)
		{
			used = true;
			switch(type)
			{
				case global.rock:
				global.CPU_upgrades++;
				sprite_index = spr_rock;
				break;
				case global.paper:
				global.CPU_healing++;
				sprite_index = spr_paper;
				break;
				case global.scissors:
				global.CPU_attack++;
				sprite_index = spr_scissors;
				break;
			}
		}
	}
	
	break;
	
	case 2:
	face_up = true;
	if((picked || position_meeting(mouse_x, mouse_y, id)) && global.current_phase == global.phase_player_chooses)
	{
		var spot_x = (global.player_hand_x + ((card_space - 1) * place));
		var spot_y = global.player_hand_y - raise_height;
		x = x * (x_move_speed / 10) + spot_x * (1 - (x_move_speed / 10));
		y = y * (y_move_speed / 10) + spot_y * (1 - (y_move_speed / 10));
		image_xscale = image_xscale * (y_move_speed / 10) + card_growth * (1 - (y_move_speed / 10));
		image_yscale = image_yscale * (y_move_speed / 10) + card_growth * (1 - (y_move_speed / 10));
		if(mouse_check_button_pressed(mb_left) && picked == false)
		{
			picked = true;
			global.player_plays--;
			if(global.player_plays == 0)
			{
				suspense = true;
				alarm[0] = 1 * room_speed;
				global.current_phase = global.phase_result;
			}
		}
	}
	else if (global.current_phase == global.phase_player_chooses)
	{
		var spot_x = (global.player_hand_x + ((card_space - 1) * place));
		var spot_y = global.player_hand_y;
		x = x * (x_move_speed / 10) + spot_x * (1 - (x_move_speed / 10));
		y = y * (y_move_speed / 10) + spot_y * (1 - (y_move_speed / 10));
		image_xscale = image_xscale * (y_move_speed / 10) + 1 * (1 - (y_move_speed / 10));
		image_yscale = image_yscale * (y_move_speed / 10) + 1 * (1 - (y_move_speed / 10));
	}
	
	break;
}

switch(global.current_phase)
{
	case global.phase_dealing:
	used = false;
	break;
	
	case global.phase_CPU_chooses:
	
	break;
	
	case global.phase_player_chooses:
	
	if(face_up == true)
	{
		switch(type)
		{
			case global.rock:
			sprite_index = spr_rock;
			break;
			case global.paper:
			sprite_index = spr_paper;
			break;
			case global.scissors:
			sprite_index = spr_scissors;
			break;
		}
	}
	
	break;
	
	case global.phase_play:
	
	if(picked && hand == 2)
	{
		var spot_x = (global.player_hand_x + ((card_space - 1) * place));
		var spot_y = global.player_hand_y - raise_height;
		x = x * (x_move_speed / 10) + spot_x * (1 - (x_move_speed / 10));
		y = y * (y_move_speed / 10) + spot_y * (1 - (y_move_speed / 10));
		image_xscale = image_xscale * (y_move_speed / 10) + card_growth * (1 - (y_move_speed / 10));
		image_yscale = image_yscale * (y_move_speed / 10) + card_growth * (1 - (y_move_speed / 10));
	}
	else
	{
		//sprite_index = spr_back;
	}
	if(suspense == false && picked && hand == 2 && global.player_plays == 0)
	{
		global.current_phase = global.phase_result;
	}
	
	break;
	
	case global.phase_result:
	
	if(picked == true)
	{
		switch(type)
		{
			case global.rock:
			sprite_index = spr_rock;
			break;
			case global.paper:
			sprite_index = spr_paper;
			break;
			case global.scissors:
			sprite_index = spr_scissors;
			break;
		}
		if(used == false && hand == 2)
		{
			used = true
			switch(type)
			{
				case global.rock:
				global.player_upgrades++;
				sprite_index = spr_rock;
				break;
				case global.paper:
				global.player_healing++;
				sprite_index = spr_paper;
				break;
				case global.scissors:
				global.player_attack++;
				sprite_index = spr_scissors;
				break;
			}
		}
	}
	
	break;
	
	case global.phase_discard:
	
	if(hand > 0)
	{
		sprite_index = spr_back;
		var spot_x = global.discard_pile_x;
		var spot_y = global.discard_pile_y;
		x = x * (x_move_speed / 10) + spot_x * (1 - (x_move_speed / 10)) + discardspread_x;
		y = y * (y_move_speed / 10) + spot_y * (1 - (y_move_speed / 10)) + discardspread_y;
		image_xscale = image_xscale * (y_move_speed / 10) + 1 * (1 - (y_move_speed / 10));
		image_yscale = image_yscale * (y_move_speed / 10) + 1 * (1 - (y_move_speed / 10));
		
		picked = false;
	}
	
	break;
	
	case global.phase_reshuffle:
	
	break;
}


/*
if(hand == 2)
{
	type = global.paper;
}
else
{
	type = global.scissors;
}

if(mouse_check_button(mb_right))
{
	switch(type)
	{
		case global.rock:
		sprite_index = spr_rock;
		break;
		case global.paper:
		sprite_index = spr_paper;
		break;
		case global.scissors:
		sprite_index = spr_scissors;
		break;
	}
}
*/