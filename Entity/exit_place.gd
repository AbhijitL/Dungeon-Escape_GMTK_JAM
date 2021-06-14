extends Node2D

export var this_scene : String = "";

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		SceneTransition.change_scene(this_scene);
