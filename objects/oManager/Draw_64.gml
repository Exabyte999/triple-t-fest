/// Draw GUI Event

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// --- Regenerate button ---
if (btn_hover) {
    draw_set_colour(c_gray);
} else {
    draw_set_colour(c_dkgray);
}
draw_set_alpha(0.8);
draw_roundrect(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);

draw_set_alpha(1);
draw_set_colour(c_white);
draw_roundrect(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, true);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
draw_text(btn_x + btn_w * 0.5, btn_y + btn_h * 0.5, "New Room");

// --- Kill counter ---
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_colour(c_white);
draw_set_alpha(1);

// Background box
var _kill_text = "Kills: " + string(zombies_killed);
var _tw = string_width(_kill_text) + 24;
var _th = string_height(_kill_text) + 12;
var _kx = _gui_w * 0.5;
var _ky = 10;

draw_set_alpha(0.6);
draw_set_colour(c_black);
draw_roundrect(_kx - _tw * 0.5, _ky, _kx + _tw * 0.5, _ky + _th, false);

draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_kx, _ky + _th * 0.5, _kill_text);

// --- Death text ---
if (player_dead) {
    draw_set_alpha(0.7);
    draw_set_colour(c_black);
    draw_rectangle(0, _gui_h * 0.5 - 30, _gui_w, _gui_h * 0.5 + 30, false);
    
    draw_set_alpha(1);
    draw_set_colour(c_red);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_gui_w * 0.5, _gui_h * 0.5, "YOU DIED");
}

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);
draw_set_alpha(1);