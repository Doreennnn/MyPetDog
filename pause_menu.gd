extends Control

var _is_paused:bool = false:
	set = set_paused
	
func _unhandled_input(event:InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self._is_paused = !_is_paused
	if event.is_action_pressed("quit"):
		get_tree().quit()
	
func set_paused(value:bool) ->void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused

	
func _on_resume_pressed() -> void:
	_is_paused = false


func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_confirm_pressed():
	AudioServer.set_bus_volume_db(0,linear_to_db($AudioOptions/VboxContainer/Master2.value))
	AudioServer.set_bus_volume_db(0,linear_to_db($AudioOptions/VboxContainer/SFX2.value))
	AudioServer.set_bus_volume_db(0,linear_to_db($AudioOptions/VboxContainer/Music2.value))
