extends Node

func _on_PlayButton_pressed():
	$Control/AudioStreamPlayer.play();
	SceneTransition.change_scene("res://Levels/Tutorial/TutorialScene.tscn");

func _on_ExitButton_pressed():
	$Control/AudioStreamPlayer.play();
	if OS.get_name() == "HTML5":
		$Control/Credit.text = "Close the tab quit lol."
	else:
		get_tree().quit();