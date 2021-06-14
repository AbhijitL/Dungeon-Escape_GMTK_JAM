extends KinematicBody2D



const MAX_DETECTION_RANGE : int = 180;
const FOV_TOLERANCE : int = 360;
const GREEN : Color = Color8(0,128,0);
const RED : Color = Color(1.0,0.25,0.25);

onready var torch : Light2D = $Light2D;

var player : Node2D;

func _ready():
	player = get_node("/root").find_node("Player",true,false);

func _process(delta):
	if player_in_fov() and player_in_los():
		torch.color = GREEN;
		get_tree().call_group("PlayerVisible","player_seen");
	else:
		torch.color = RED;

func player_in_fov():
	var npc_facing_direction : Vector2 = Vector2(1,0).rotated(global_rotation);
	var direction_to_player = (player.position - global_position).normalized();
	if abs(direction_to_player.angle_to(npc_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true;
	else:
		return false;

func player_in_los():
	var space : Physics2DDirectSpaceState = get_world_2d().direct_space_state;
	var los_obstacle = space.intersect_ray(global_position,player.global_position,[self],collision_mask);

	if not los_obstacle:
		return false;

	var distance_to_player = player.global_position.distance_to(global_position);
	var player_in_range = distance_to_player < MAX_DETECTION_RANGE;

	if los_obstacle.collider == player and player_in_range:
		return true;
	else:
		return false;
