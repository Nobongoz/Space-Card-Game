/// @description Insert description here
// You can write your code in this editor

randomize();

//Enumerators for Card Types
global.rock = 0;
global.paper = 1;
global.scissors = 2;

//Phases
global.phase_dealing = 0;
global.phase_CPU_chooses = 1;
global.phase_player_chooses = 2;
global.phase_play = 3;
global.phase_result = 4;
global.phase_discard = 5;
global.phase_reshuffle = 6;

global.current_phase = global.phase_dealing;

calc = false;

//deck Pos
global.deck_x = x;
global.deck_y = y;

//Played Cards
suspense = false;
global.moving = false;

order = 1;

//Deck and cards
deck_size = 50;
CPU_hand_size = 1;
player_hand_size = 1;

cardsMoved = 0;

reset = false;

deck = ds_list_create();
player_hand = ds_list_create();
CPU_hand = ds_list_create();
discard_pile = ds_list_create();

//Player Stats
global.player_HP = 50;
global.player_healing = 0;
global.player_attack = 0;
global.player_upgrades = 1;
global.player_plays = 1;


//CPU Stats
global.CPU_HP = 50;
global.CPU_healing = 0;
global.CPU_attack = 0;
global.CPU_upgrades = 1;
global.CPU_plays = 1;

//Set up deck
for(i = 0; i < deck_size; i++)
{
	var newCard = instance_create_layer(x, y, "Instances", obj_Card);
	if((i + 1) % 3 == 0)
	{
		newCard.type = global.rock;
	}
	else if((i + 1) % 2 == 0)
	{
		newCard.type = global.paper;
	}
	else
	{
		newCard.type = global.scissors;
	}
	
	newCard.face_up = false;
	newCard.dealt = false;
	
	ds_list_add(deck, newCard);
	
	ds_list_shuffle(deck);
	newCard.stackPos = i;
}