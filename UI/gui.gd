extends CanvasLayer

func _ready():
	if get_tree().paused:
		get_tree().paused = false;
	if $Control/Paused.visible:
		$Control/Paused.visible = false;

func _on_HealthProgress_PlayerDied():
	$Control/Paused.visible = true;
	$AnimationPlayer.play("Dead");
	$Control/AudioStreamPlayerDead.play();

func _on_RetryButton_pressed():
	$Control/AudioStreamPlayer.play();
	get_tree().reload_current_scene();
	

func _input(event):
	if event.is_action_pressed("pause_menu"):
		get_tree().paused = not get_tree().paused;
		if not get_tree().paused:
			$Control/Paused.visible = false;
		else:
			$Control/Paused.visible = true;


func _on_ExitButton_pressed():
	$Control/AudioStreamPlayer.play();
	if OS.get_name() == "HTML5":
		$Control/Paused/CloseTHeTab.visible = true;
	else:
		get_tree().quit();

