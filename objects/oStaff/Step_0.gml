if (!instance_exists(oPlayer)) exit;

// --- Cooldown tick ---
if (cooldown_timer > 0) {
    cooldown_timer -= 1 / game_get_speed(gamespeed_fps);
    if (cooldown_timer < 0) cooldown_timer = 0;
}

// --- Get player facing direction ---
var _facing = oPlayer.image_xscale;

// --- Position staff on player, flip offset based on facing ---
x = oPlayer.x + (offset_x * _facing);
y = oPlayer.y;

// --- Rotate toward mouse ---
var _dir = point_direction(x, y, mouse_x, mouse_y);
image_angle = _dir;

// --- Mirror staff when facing left ---
if (_facing == -1) {
    image_yscale = -1;
} else {
    image_yscale = 1;
}

// --- Always draw in front of player ---
depth = oPlayer.depth - 1;

// --- Shoot fireball on click ---
if (mouse_check_button_pressed(mb_left) && cooldown_timer == 0) {
    cooldown_timer = cooldown_max;
    
    // 11 pixels above the staff origin along its rotation
    var _dist = 11;
    var _spawn_dir = image_angle + 90;
    
    // If staff is mirrored, flip the perpendicular direction
    if (image_yscale == -1) {
        _spawn_dir = image_angle - 90;
    }
    
    var _sx = x + lengthdir_x(_dist, _spawn_dir);
    var _sy = y + lengthdir_y(_dist, _spawn_dir);
    
    var _fb = instance_create_layer(_sx, _sy, "Fireballs", oFireball);
    _fb.direction = point_direction(_sx, _sy, mouse_x, mouse_y);
    _fb.image_angle = _fb.direction;
}