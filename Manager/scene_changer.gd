extends Node

var scene : String;

func change_scene(new_scene):
	scene = new_scene;
	$Control/AnimationPlayer.play("Transition");
	

func _new_scene():
	get_tree().change_scene(scene);

