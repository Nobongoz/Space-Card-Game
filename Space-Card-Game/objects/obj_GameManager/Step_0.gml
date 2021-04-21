/// @description Insert description here
// You can write your code in this editor

if(global.current_phase == global.phase_CPU_chooses)
{
	show_debug_message("CPU Choosing");
}

//show_debug_message(global.current_phase);
//Phases
switch(global.current_phase)
{
	case global.phase_dealing:
	
	if(global.CPU_upgrades > 12)
	{
		global.CPU_upgrades = 12;
	}
	if(global.player_upgrades > 12)
	{
		global.player_upgrades = 12;
	}
	
	global.CPU_plays = round(global.CPU_upgrades / 2);
	if(global.CPU_upgrades == 1)
	{
		global.CPU_plays = 1;
	}
	CPU_hand_size = global.CPU_upgrades;
	
	
	global.player_plays = round(global.player_upgrades / 2);
	if(global.player_upgrades == 1)
	{
		global.player_plays = 1;
	}
	player_hand_size = global.player_upgrades;
	
	calc = false;
	
	//restock CPU Hand
	if(ds_list_size(CPU_hand) < CPU_hand_size && global.moving == false && ds_list_size(deck) > 0 && order == 1)
	{
		var card = deck[| ds_list_size(deck) - 1];
		ds_list_delete(deck, ds_list_size(deck) - 1);
		ds_list_add(CPU_hand, card);
		
		card.hand = 1;
		card.place = ds_list_size(CPU_hand);
	}
	if(ds_list_size(player_hand) < player_hand_size && global.moving == false && ds_list_size(deck) > 0 && order == 0) 	//Restock Player Hand
	{
		var pcard = deck[| ds_list_size(deck) - 1];
		ds_list_delete(deck, ds_list_size(deck) - 1);
		ds_list_add(player_hand, pcard);
		
		pcard.hand = 2;
		pcard.place = ds_list_size(player_hand);
	}
	else if(global.moving == false && (ds_list_size(deck) == 0 || ((ds_list_size(player_hand) == player_hand_size && ds_list_size(CPU_hand) == CPU_hand_size))))
	{
		global.current_phase = global.phase_CPU_chooses;
	}
	
	
	if(global.moving == false)
	{
		if(order == 1)
		{
			order = 0;
		}
		else
		{
			order = 1;
		}
	}
	
	break;
	
	case global.phase_CPU_chooses:
		
	if(global.CPU_plays >= ds_list_size(CPU_hand))
	{
		for(i = 0; i < ds_list_size(CPU_hand); i++)
		{
			var card = CPU_hand[| i];
			card.picked = true;
		}
		
		global.CPU_plays = 0;
	}
	
	if(global.CPU_plays > 0)
	{
		CPU_card = CPU_hand[| random_range(0, ds_list_size(CPU_hand) - 1)];
		if(CPU_card.picked == false)
		{
			CPU_card.picked = true;
			global.CPU_plays--;
		}
	}
	
	
	break;
	
	case global.phase_player_chooses:
	
	if((abs(global.player_upgrades - global.player_plays)) == ds_list_size(player_hand))
	{
		global.current_phase = global.phase_result;
	}
	
	break;
	
	case global.phase_play:
	
	break;
	
	case global.phase_result:
	
	if(suspense == false)
	{
		suspense = true;
		alarm[0] = 2 * room_speed;
	}
	
	if(calc == false)
	{
		calc = true;
		global.CPU_HP = global.CPU_HP - global.player_attack;
		global.CPU_HP = global.CPU_HP + global.CPU_healing;
		
		global.player_HP = global.player_HP - global.CPU_attack;
		global.player_HP = global.player_HP + global.player_healing;
	}
	
	break;
	
	case global.phase_discard:
	
	if(suspense == false)
	{
		suspense = true;
		alarm[0] = 0.5 * room_speed;
	}

	break;
	
	case global.phase_reshuffle:
	
	if(cardsMoved < deck_size && ds_list_size(discard_pile) > 0)
	{
		var card = discard_pile[| 0];
		ds_list_delete(discard_pile, 0);
		ds_list_add(deck, card);
		card.hand = 0;
		card.face_up = false;
		card.place = 0;
		card.moving = false;
		card.moved = false;
		//discard_pile[| cardsMoved]
		cardsMoved++;
	}
	else if (ds_list_size(deck == deck_size) && reset == false)
	{
		ds_list_shuffle(deck);
		global.current_phase = global.phase_dealing;
	}
	
	break;
}
for(i = 0; i < ds_list_size(deck); i++)
{
	card = deck[| i];
	card.stackPos = i;
}