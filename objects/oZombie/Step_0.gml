/// Step Event

if (instance_exists(oManager) && (oManager.transitioning || oManager.player_dead)) {
    exit;
}

if (instance_exists(oPlayer)) {
    var _dist = point_distance(x, y, oPlayer.x, oPlayer.y);
    
    if (_dist < detect_range) {
        var _dir = point_direction(x, y, oPlayer.x, oPlayer.y);
        var _mx = lengthdir_x(spd, _dir);
        var _my = lengthdir_y(spd, _dir);
        
        if (!place_meeting(x + _mx, y, oWall)) {
            x += _mx;
        }
        if (!place_meeting(x, y + _my, oWall)) {
            y += _my;
        }
        
        if (oPlayer.x < x) facing = -1; else facing = 1;
        image_xscale = facing;
    }
    
    // Kill player on contact
    if (place_meeting(x, y, oPlayer) && !oManager.player_dead) {
        oManager.player_dead = true;
        oManager.death_timer = 0;
        
        // Play death sound
        audio_play_sound(snDeath, 1, false);
        
        // Hide player
        with (oPlayer) {
            visible = false;
        }
    }
}

for (var _i = ds_list_size(damage_popups) - 1; _i >= 0; _i--) {
    var _popup = damage_popups[| _i];
    _popup[1] -= 0.5;
    _popup[3] -= 0.02;
    damage_popups[| _i] = _popup;
    if (_popup[3] <= 0) {
        ds_list_delete(damage_popups, _i);
    }
}

if (hp <= 0) {
	audio_play_sound(snZomded,1,false);
    // Add to kill count
    if (instance_exists(oManager)) {
        oManager.zombies_killed++;
    }
    
    if (instance_exists(oManager) && !oManager.transitioning && !oManager.player_dead) {
        oManager.transitioning = true;
        oManager.transition_phase = 1;
        oManager.transition_alpha = 0;
        oManager.bar_height = 0;
    }
    instance_destroy();
}