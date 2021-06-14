extends TextureProgress

signal PlayerDied;
export var sus_multiplier : int = 6;

func _ready():
	value = 100;

func _process(delta):
	value -= step;
	if value <= 0:
		value = 0;

func player_seen():
	value += step * sus_multiplier;
	


func _on_HealthProgress_value_changed(value : float):
	if value == min_value:
		emit_signal("PlayerDied");