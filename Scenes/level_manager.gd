extends Node3D

var player
@export var player_node_path: String = "level/Player"
@export var target_position: Vector3 = Vector3(-21.55, 7.816, -0.714)
@export var music: AudioStream
var music_player: AudioStreamPlayer
func _ready():
	player = get_node("/root/" + get_tree().current_scene.name + "/Player")
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	

	music_player.stream = music
	music_player.play() 
	
func _process(delta):
	get_tree().call_group("monster", "update_target_location", player.global_transform.origin)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/victory.tscn")

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_Z and Input.is_key_pressed(KEY_CTRL):
			var player = get_node_or_null("Player")
			if player and player is CharacterBody3D:
				player.global_transform.origin = target_position
