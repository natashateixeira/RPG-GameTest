//Input do player
key_left = keyboard_check (vk_left);
key_right = keyboard_check (vk_right);
key_jump = keyboard_check_pressed(vk_up);

//Calcular movimento
var move = key_right - key_left;

hsp = move * walksp;
vsp = vsp + grv;

//Calculo do pulo
//reseta o pulo
if (place_meeting(x, y + 1, obj_wall)) {
    jump_count = 0;
}
//pulo + contador (ate 2)
if (key_jump && jump_count < max_jumps)
{
	vsp = -7;
	jump_count += 1;
}


//Colisao horizontal
if (place_meeting (x+hsp,y,obj_wall))

{
	while(!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x = x + sign (hsp);
	}	
	hsp = 0;
}

x = x + hsp;

//Colisao vertical
if (place_meeting (x,y+vsp,obj_wall))

{
	while(!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y = y + sign (vsp);
	}	
	vsp = 0;
}

y = y + vsp;


//Animação

if (!place_meeting(x, y + 1, obj_wall))
{
	if (sprite_index != spr_player_jump)
	{
		sprite_index = spr_player_jump
		image_index = 0;
	}
	image_speed = 0.5;
}
else
{
	image_speed = 0.3;
	if (hsp == 0)
	{
		sprite_index = spr_player
	}
	else
	{
		sprite_index = spr_player_run
	}
}

if (hsp != 0) image_xscale = sign(hsp);