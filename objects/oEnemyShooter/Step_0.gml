//Mouvements du personnage

vspd = vspd + grav;

//Collisions verticales

if (place_meeting(x, y + vspd, oMur)) {
	while (!place_meeting(x, y + sign(vspd), oMur)) {
		y = y + sign(vspd);
	}
	vspd = 0;	
}

y = y + vspd;

if (hspd != 0) {
	image_xscale = sign(hspd);
}

// Interaction avec le joueur

if (place_meeting(x, y, oPlayer) && oPlayer.invincible == false) {
	global.hp -= 1;
	oPlayer.invincible = true;
	oPlayer.alarm[0] = 30;
}

// Interaction avec le fouet
if (place_meeting(x, y, oWhip)) {
	hp -= 1;
}

if (is_firing == false) {
	is_firing = true;
	sprite_index = sEnemyShooter;
	instance_create_layer(x, y, "Enemy", oProjectile);
	alarm[0] = choose(45, 60, 75);
}