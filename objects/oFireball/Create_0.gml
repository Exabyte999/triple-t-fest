explo = false;
speed = 8;
direction = point_direction(x,y,mouse_x,mouse_y);
image_angle = (point_direction(x,y,mouse_x,mouse_y)-90);
image_speed = 1.5;
audio_play_sound(snFireball,2,false);