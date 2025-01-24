extends Control

@export var music_1: AudioStream
@export var music_2: AudioStream
var music_player_1: AudioStreamPlayer
var music_player_2: AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music_player_1 = AudioStreamPlayer.new()
	music_player_2 = AudioStreamPlayer.new()
	add_child(music_player_1)
	add_child(music_player_2)
	
	music_player_1.stream = music_1
	music_player_2.stream = music_2

	music_player_1.play()
	music_player_2.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event) -> void:
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_ENTER:
			get_tree().change_scene_to_file("res://Scenes/credits.tscn")
