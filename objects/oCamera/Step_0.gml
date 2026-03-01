if (!instance_exists(oPlayer)) exit;

// --- Mouse look offset ---
// How much the camera shifts toward the mouse (0 = none, 1 = fully to mouse)
var _mouse_influence = 0.3;

// Get mouse position in the world (not GUI)
var _mx = mouse_x;
var _my = mouse_y;

// Blend between player position and mouse position
var _target_x = lerp(oPlayer.x, _mx, _mouse_influence);
var _target_y = lerp(oPlayer.y, _my, _mouse_influence);

// --- Lookahead based on player velocity ---
var _player_vx = 0;
var _player_vy = 0;

if (variable_instance_exists(oPlayer, "hsp")) {
    _player_vx = oPlayer.hsp;
} else {
    _player_vx = oPlayer.hspeed;
}

if (variable_instance_exists(oPlayer, "vsp")) {
    _player_vy = oPlayer.vsp;
} else {
    _player_vy = oPlayer.vspeed;
}

_target_x += _player_vx * lookahead_amount;
_target_y += _player_vy * lookahead_amount;

// --- Current camera center ---
var _cam_cx = cam_x + cam_w * 0.5;
var _cam_cy = cam_y + cam_h * 0.5;

// --- Deadzone check ---
var _dx = _target_x - _cam_cx;
var _dy = _target_y - _cam_cy;

if (abs(_dx) < deadzone_w) _dx = 0;
else _dx -= sign(_dx) * deadzone_w;

if (abs(_dy) < deadzone_h) _dy = 0;
else _dy -= sign(_dy) * deadzone_h;

// --- Spring physics ---
var _force_x = _dx * follow_strength;
var _force_y = _dy * follow_strength;

cam_vx += _force_x;
cam_vy += _force_y;

cam_vx *= damping;
cam_vy *= damping;

if (abs(cam_vx) < 0.01) cam_vx = 0;
if (abs(cam_vy) < 0.01) cam_vy = 0;

// --- Update position ---
cam_x += cam_vx;
cam_y += cam_vy;

// --- Clamp to room bounds ---
cam_x = clamp(cam_x, 0, room_width - cam_w);
cam_y = clamp(cam_y, 0, room_height - cam_h);

// --- Apply to camera ---
camera_set_view_pos(cam, round(cam_x), round(cam_y));