extends Node3D
@onready var camera_pivot = $CameraPivot

var rotation_speed = 8
var player

	
func _process(delta: float) -> void:
	camera_pivot.rotation_degrees.y += delta * rotation_speed


func _enter_tree() -> void:
	if Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position
