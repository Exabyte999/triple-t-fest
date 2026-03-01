if (transitioning || bar_height > 0) {
    var _cx = camera_get_view_x(view_camera[0]);
    var _cy = camera_get_view_y(view_camera[0]);
    var _cw = camera_get_view_width(view_camera[0]);
    var _ch = camera_get_view_height(view_camera[0]);
    
    var _bh = round(bar_height);
    
    // Dim overlay
    draw_set_alpha(transition_alpha * 0.4);
    draw_set_colour(c_black);
    draw_rectangle(_cx, _cy, _cx + _cw, _cy + _ch, false);
    
    // Black bars
    draw_set_alpha(1);
    draw_set_colour(c_black);
    draw_rectangle(_cx, _cy, _cx + _cw, _cy + _bh, false);
    draw_rectangle(_cx, _cy + _ch - _bh, _cx + _cw, _cy + _ch, false);
    
    // --- "YOU WIN!!!!" text ---
    if (win_triggered && transition_phase == 2) {
        draw_set_alpha(1);
        draw_set_colour(c_yellow);
        draw_set_font(-1); // replace with your font if you have one
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        // Pulsing scale effect
        var _pulse = 1 + 0.1 * sin(current_time / 150);
        var _text_x = _cx + _cw / 2;
        var _text_y = _cy + _ch / 2;
        
        draw_text_transformed(_text_x, _text_y, "YOU WIN!!!!", 3 * _pulse, 3 * _pulse, 0);
        
        // Countdown display
        var _remaining = (win_display_max - win_display_timer) / game_get_speed(gamespeed_fps);
        draw_set_colour(c_white);
        draw_text_transformed(_text_x, _text_y + 40, string_format(_remaining, 1, 1) + "s", 1.5, 1.5, 0);
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
    
    draw_set_alpha(1);
    draw_set_colour(c_white);
}


// --- Intro message ---
if (show_intro) {
    var _cx = camera_get_view_x(view_camera[0]);
    var _cy = camera_get_view_y(view_camera[0]);
    var _cw = camera_get_view_width(view_camera[0]);
    var _ch = camera_get_view_height(view_camera[0]);
    
    var _text_x = _cx + _cw / 2;
    var _text_y = _cy + 40;
    
    // Dark background bar behind text
    draw_set_alpha(intro_alpha * 0.6);
    draw_set_colour(c_black);
    draw_rectangle(_cx, _text_y - 20, _cx + _cw, _text_y + 25, false);
    
    // Main text
    draw_set_alpha(intro_alpha);
    draw_set_colour(c_yellow);
    draw_set_font(-1); // replace with your font if you have one
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var _pulse = 1 + 0.05 * sin(current_time / 200);
    draw_text_transformed(_text_x, _text_y, "Kill 7 zombies to win!", 2 * _pulse, 2 * _pulse, 0);
    
    // Subtitle
    draw_set_colour(c_white);
    draw_text_transformed(_text_x, _text_y + 22, "TRIPLE T IN THE SEWERS", 1, 1, 0);
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    draw_set_colour(c_white);
}