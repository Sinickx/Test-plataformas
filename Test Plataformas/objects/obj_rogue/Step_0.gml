/// @description Inserte aquí la descripción
#region // verificar si esta saltando o cayendo
if vspeed > 0{
	Fall = true;
}
else{
	Fall = false;
}
if vspeed < 0{
	Up = true;
}
else{
	Up = false;
}
#endregion

#region // Gravedad 
if place_free(x, y+1){
	gravity = 1;
}
else{
	gravity = 0;
}

if vspeed >=20 {vspeed = 20;}//limitar la velocidad Vertical
#endregion

#region // Movimientos y Salto
var Der = keyboard_check(vk_right);
var Izq = keyboard_check(vk_left);

if Izq {Der = false;}
if Der {Izq = false;}

var S = keyboard_check_pressed(vk_space);

if S && !place_free(x, y+1){
	sprite_index = spr_rogue_jump;
	vspeed = -Salto;
}

if Der && place_free(x+V, y){
	x += V; //Moverlo
	
	if Fall
		sprite_index = spr_rogue_fall;
	else
		if Up
			sprite_index = spr_rogue_jump;
		else
			sprite_index = spr_rogue_walk;
	
	image_speed = 0.7;
	image_xscale = 1;
}

if Izq && place_free(x-V, y){
	x -= V; //Moverlo
	
	if Fall
		sprite_index = spr_rogue_fall;
	else
		if Up
			sprite_index = spr_rogue_jump;
		else
			sprite_index = spr_rogue_walk;
	
	image_speed = 0.7;
	image_xscale = -1;
}

#endregion

#region // sprites en salto
if !keyboard_key{
	if Fall == true
		sprite_index = spr_rogue_fall;
	else
		if Up
			sprite_index = spr_rogue_jump;
		else
			sprite_index = spr_rogue_stand;
	
	image_speed = 0.7;
	//image_index = 0;
}
#endregion

