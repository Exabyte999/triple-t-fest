/// Create Event

persistent = true;

transitioning = false;
transition_alpha = 0;
transition_phase = 0;
transition_hold_timer = 0;
transition_hold_max = 30;
bar_height = 0;
depth = -9999;

// Regenerate button
btn_x = 10;
btn_y = 10;
btn_w = 140;
btn_h = 36;
btn_hover = false;

// Kill tracking
zombies_killed = 0;

// Death
player_dead = false;
death_timer = 0;
death_max = 90;

// --- Win state ---
win_triggered = false;
win_display_timer = 0;
win_display_max = 180; // 3 seconds at 60fps

// --- Intro message ---
show_intro = true;
intro_timer = 0;
intro_max = 240; // 4 seconds at 60fps
intro_alpha = 1;
intro_fade_speed = 0.02;