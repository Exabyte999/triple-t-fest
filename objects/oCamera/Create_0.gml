// Camera setup
cam = camera_create();
view_camera[0] = cam;
view_enabled = true;
view_visible[0] = true;

// Camera dimensions
cam_w = 640;
cam_h = 360;

camera_set_view_size(cam, cam_w, cam_h);

// Current position
cam_x = 0;
cam_y = 0;

// Velocity for physics-based movement
cam_vx = 0;
cam_vy = 0;

// Physics parameters
follow_strength = 0.2;   // How strongly the camera is pulled toward target (spring stiffness)
damping = 0.62;           // Velocity damping (lower = more floaty, higher = snappier)
lookahead_amount = 10;    // How far ahead to look in the player's direction
deadzone_w = 20;          // Deadzone half-width (camera won't move if player is within this)
deadzone_h = 15;          // Deadzone half-height

// Snap to player initially
if (instance_exists(oPlayer)) {
    cam_x = oPlayer.x - cam_w * 0.5;
    cam_y = oPlayer.y - cam_h * 0.5;
}