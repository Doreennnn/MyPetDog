extends StaticBody3D

@export var paper_material: StandardMaterial3D
var toggle = false

func _ready():
	$MeshInstance3D.material_override = paper_material
	
func interact():
	get_node("/root/" + get_tree().current_scene.name + "/paper_pickup").play()
	toggle = !toggle
	get_node("/root/" + get_tree().current_scene.name + "/sprint/paper9").visible = toggle
	get_node("/root/" + get_tree().current_scene.name + "/Player").movable = !toggle
	get_node("/root/" + get_tree().current_scene.name + "/Player/head").movable = !toggle
	
