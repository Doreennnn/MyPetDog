extends Control

@export var target_position: Vector3 = Vector3(-28,11.368,0.055)
@export var player_node_path: String = "level/Player"

	
var player_node: CharacterBody3D

func _ready():
	await get_tree().create_timer(4.0, false).timeout
	get_tree().change_scene_to_file("res://Scenes/good_dog.tscn")

			
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_BACKSPACE:
			get_tree().change_scene_to_file("res://Scenes/level.tscn")
			var player = get_node_or_null(player_node_path)
			if player and player is CharacterBody3D:
				player.global_transform.origin = target_position
			
			#await get_tree().scene_loaded
			#var player = get_node_or_null(player_node_path)
			#if player and player is CharacterBody3D:
				#player.global_transform.origin = target_position
			
