/// Step Event

// --- Intro message timer ---
if (show_intro) {
    intro_timer++;
    if (intro_timer >= intro_max) {
        intro_alpha -= intro_fade_speed;
        if (intro_alpha <= 0) {
            intro_alpha = 0;
            show_intro = false;
        }
    }
}


// --- Regenerate button ---
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

btn_hover = (_mx >= btn_x && _mx <= btn_x + btn_w && _my >= btn_y && _my <= btn_y + btn_h);

if (btn_hover && mouse_check_button_pressed(mb_left) && !transitioning) {
    transitioning = true;
    transition_phase = 1;
    transition_alpha = 0;
    bar_height = 0;
}

// --- Player death ---
if (player_dead) {
    death_timer++;
    if (death_timer >= death_max && !transitioning) {
        transitioning = true;
        transition_phase = 1;
        transition_alpha = 0;
        bar_height = 0;
        player_dead = false;
        death_timer = 0;
    }
}

// --- Win condition: 5 kills ---
if (zombies_killed >= 7 && !win_triggered && !transitioning) {
    win_triggered = true;
    transitioning = true;
    transition_phase = 1;
    transition_alpha = 0;
    bar_height = 0;
}

// --- Transition ---
if (transitioning) {
    switch (transition_phase) {
        case 1:
            bar_height += 4;
            transition_alpha += 0.05;
            
            if (bar_height >= 120) {
                bar_height = 120;
                transition_alpha = 1;
                transition_phase = 2;
                transition_hold_timer = 0;
            }
            break;
        
        case 2:
            transition_hold_timer++;
            
            if (win_triggered) {
                // Show "YOU WIN" for 3 seconds, then regenerate
                win_display_timer++;
                
                if (win_display_timer >= win_display_max) {
                    // Regenerate world
                    with (oZombie) { instance_destroy(); }
                    with (oFireball) { instance_destroy(); }
                    generate_level();
                    
                    with (oPlayer) {
                        visible = true;
                        image_alpha = 1;
                    }
                    global.playerHp = 3;
                    zombies_killed = 0;
                    
                    win_triggered = false;
                    win_display_timer = 0;
                    transition_phase = 3;
                }
            } else {
                // Normal regenerate (button or death)
                if (transition_hold_timer == 1) {
                    audio_play_sound(snLevelup, 1, false);
                    with (oZombie) { instance_destroy(); }
                    with (oFireball) { instance_destroy(); }
                    generate_level();
                    
                    with (oPlayer) {
                        visible = true;
                        image_alpha = 1;
                    }
                    global.playerHp = 3;
                }
                
                if (transition_hold_timer >= transition_hold_max) {
                    transition_phase = 3;
                }
            }
            break;
        
        case 3:
            bar_height -= 4;
            transition_alpha -= 0.05;
            
            if (bar_height <= 0) {
                bar_height = 0;
                transition_alpha = 0;
                transition_phase = 0;
                transitioning = false;
            }
            break;
    }
}