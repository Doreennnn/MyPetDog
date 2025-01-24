extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	

	music_player.stream = music
	music_player.play() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _input(event) -> void:
	if event is InputEventKey and event.is_pressed():
		if event.is_control_pressed() and event.keycode == KEY_Q:
			get_tree().change_scene_to_file("res://Scenes/credits.tscn")
@export var music: AudioStream

var music_player: AudioStreamPlayer
