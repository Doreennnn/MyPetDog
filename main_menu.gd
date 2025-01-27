extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_bark_button_pressed() -> void:
	$"bark button/AudioStreamPlayer2D".play()
