// Draw the staff itself
draw_self();

// Draw cooldown text next to staff
//if (cooldown_timer > 0) {
//    var _text = string_format(cooldown_timer * 1000, 1, 0) + "ms";
    
//    // Offset the text to the right (or left) of the staff
//    var _facing = oPlayer.image_xscale;
//    var _tx = x + (20 * _facing);
//    var _ty = y - 16;
    
//    draw_set_font(-1);
//    draw_set_halign(fa_center);
//    draw_set_valign(fa_middle);
//    draw_set_color(c_yellow);
//    draw_text(_tx, _ty, _text);
    
//    // Reset draw settings
//    draw_set_halign(fa_left);
//    draw_set_valign(fa_top);
//    draw_set_color(c_white);
//}