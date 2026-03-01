if !instance_exists(oCamera){
	instance_create_layer(1,1,"Player",oCamera);	
}
instance_create_layer(random(room_width),random(room_height),"Player",oPlayer);
if !instance_exists(oStaff){
	instance_create_layer(oPlayer.x,oPlayer.y,"Staff",oStaff);	
}
if !instance_exists(oCursor){
	instance_create_layer(1,1,"Cursor",oCursor);	
}
if !instance_exists(oLevelGen){
	instance_create_layer(1,1,"Player",oLevelGen);	
}
audio_play_sound(snTrack,1,true);