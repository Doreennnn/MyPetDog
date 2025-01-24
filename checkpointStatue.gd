extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


#func _on_area_3d_body_entered(body: Node3D) -> void:
	#Checkpoint.last_position = global_position

static var last_position: Vector3 =Vector3()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		last_position = body.global_transform.origin
		
