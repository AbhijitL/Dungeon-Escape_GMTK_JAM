extends Node


var num = 0;
export var transition_time : float = 0.7;
onready var npc_timer = $Timer/NPCTimer;

func _ready():
	npc_timer.wait_time = transition_time;
	update_pointer_positions(0);
	npc_timer.start();

func update_pointer_positions(object_number):
	var npc : Node2D = $NPC;
	var place : Position2D = $Positions.get_child(object_number);

	$Tween.interpolate_property(npc,"position",npc.position,
		place.position,transition_time,Tween.TRANS_SINE,Tween.EASE_IN_OUT);
	$Tween.start();



func _on_NPCTimer_timeout():
	print("Tine")
	if num >= $Positions.get_child_count():
		npc_timer.stop();
		pass;
	else:
		update_pointer_positions(num)
		num += 1;
		npc_timer.start();
