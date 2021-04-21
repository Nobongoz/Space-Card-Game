/// @description Suspense Timer

if(global.current_phase == global.phase_discard)
{
	temp_CPU_hand = ds_list_size(CPU_hand);
	
	for(i = 0; i < temp_CPU_hand; i++)
	{
		var card = CPU_hand[| ds_list_size(CPU_hand) - 1];
		ds_list_delete(CPU_hand, ds_list_size(CPU_hand) - 1);
		ds_list_add(discard_pile, card);
		
		card.hand = -1;
		card.face_up = false;
		card.place = 0;
	}
	
	temp_player_hand = ds_list_size(player_hand);
	
	for(i = 0; i < temp_player_hand; i++)
	{
		var card = player_hand[| ds_list_size(player_hand) - 1];
		ds_list_delete(player_hand, ds_list_size(player_hand) - 1);
		ds_list_add(discard_pile, card);
		
		card.hand = -1;
		card.face_up = false;
		card.place = 0;
	}
	
	
	if(ds_list_size(deck) == 0 || ((ds_list_size(deck) / 2) - 1) < 12)
	{
		cardsMoved = 0;
		alarm[1] = 1 * room_speed;
		reset = true;
		global.current_phase = global.phase_reshuffle;	
	}
	else
	{
		global.current_phase = global.phase_dealing;
	}
}


if(global.current_phase == global.phase_result)
{
	
	global.current_phase = global.phase_discard;
}


suspense = false;