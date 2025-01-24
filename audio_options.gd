extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Master2.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$VBoxContainer/SFX2.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$VBoxContainer/Music2.value = db_to_linear(AudioServer.get_bus_volume_db(2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_master_2_mouse_exited() -> void:
	pass # Replace with function body.


func _on_sfx_2_mouse_exited() -> void:
	pass # Replace with function body.


func _on_music_2_mouse_exited() -> void:
	pass # Replace with function body.
