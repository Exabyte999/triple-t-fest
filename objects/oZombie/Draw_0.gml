/// Draw Event

draw_self();

// --- Draw damage popups ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var _i = 0; _i < ds_list_size(damage_popups); _i++) {
    var _popup = damage_popups[| _i];
    var _px = _popup[0];
    var _py = _popup[1];
    var _txt = _popup[2];
    var _alpha = clamp(_popup[3], 0, 1);

    // Shadow
    draw_set_alpha(_alpha * 0.8);
    draw_set_colour(c_black);
    draw_text(_px + 1, _py + 1, _txt);

    // Main text
    draw_set_alpha(_alpha);
    var _ratio = hp / max_hp;
    if (_ratio > 0.5) draw_set_colour(c_white);
    else if (_ratio > 0.25) draw_set_colour(c_yellow);
    else draw_set_colour(c_red);
    draw_text(_px, _py, _txt);
}

draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);