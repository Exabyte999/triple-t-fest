/// Collision with oFireball

var _damage = 1;
hp -= _damage;
hp = max(hp, 0);

// Spawn damage popup
var _text = string(hp) + "/" + string(max_hp) + " hp";
ds_list_add(damage_popups, [x, y - 16, _text, 1.5]);

// Small knockback
var _kb_dir = point_direction(other.x, other.y, x, y);
var _kx = lengthdir_x(3, _kb_dir);
var _ky = lengthdir_y(3, _kb_dir);
if (!place_meeting(x + _kx, y, oWall)) x += _kx;
if (!place_meeting(x, y + _ky, oWall)) y += _ky;

// Destroy fireball
with (other) {
    instance_destroy();
}