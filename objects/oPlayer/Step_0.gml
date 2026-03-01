/// Add to VERY TOP of oPlayer Step Event

/// Add to VERY TOP of oPlayer Step Event

if (instance_exists(oManager) && (oManager.transitioning || oManager.player_dead)) {
    exit;
}

if (instance_exists(oManager) && oManager.transitioning) {
    exit;
}

// --- Input ---
var right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));
var up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));

var hmove = right - left;
var vmove = down - up;

// diagonal movement
if (hmove != 0 && vmove != 0) {
    hmove *= 0.707;
    vmove *= 0.707;
}

// HORIZONTAL MOVEMENT
if (hmove != 0) {
    hsp += hmove * accel;
    hsp = clamp(hsp, -move_spd, move_spd);
} 
else {
    if (abs(hsp) < fric) {
        hsp = 0;
    } 
    else {
        hsp -= sign(hsp) * fric;
    }
}

// VERTICAL MOVEMENT
if (vmove != 0) {
    vsp += vmove * accel;
    vsp = clamp(vsp, -move_spd, move_spd);
} 
else {
    if (abs(vsp) < fric) {
        vsp = 0;
    } 
    else {
        vsp -= sign(vsp) * fric;
    }
}

// Cap diagonal speed
var total_spd = point_distance(0, 0, hsp, vsp);
if (total_spd > move_spd) {
    var dir = point_direction(0, 0, hsp, vsp);
    hsp = lengthdir_x(move_spd, dir);
    vsp = lengthdir_y(move_spd, dir);
}

// --- SAFETY CHECK: If already inside a wall, push out ---
while (place_meeting(x, y, oWall)) {
    // Try to nudge out in all directions
    var _pushed = false;
    if (!place_meeting(x - 1, y, oWall)) { x -= 1; _pushed = true; }
    else if (!place_meeting(x + 1, y, oWall)) { x += 1; _pushed = true; }
    else if (!place_meeting(x, y - 1, oWall)) { y -= 1; _pushed = true; }
    else if (!place_meeting(x, y + 1, oWall)) { y += 1; _pushed = true; }
    
    if (!_pushed) break; // avoid infinite loop if completely stuck
}

// Horizontal collision
if (hsp != 0) {
    if (place_meeting(x + hsp, y, oWall)) {
        while (!place_meeting(x + sign(hsp), y, oWall)) {
            x += sign(hsp);
        }
        hsp = 0;
    }
}

// Vertical collision
if (vsp != 0) {
    if (place_meeting(x, y + vsp, oWall)) {
        while (!place_meeting(x, y + sign(vsp), oWall)) {
            y += sign(vsp);
        }
        vsp = 0;
    }
}

// Apply movement
x += hsp;
y += vsp;

// Animation
if (hmove != 0 || vmove != 0) {
    sprite_index = sPlayerWalk;
} else {
    sprite_index = sPlayer;
}

// Facing
if (mouse_x != x) {
    image_xscale = sign(mouse_x - x);
}