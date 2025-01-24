extends StaticBody3D

# Material to use for the paper when interacting
@export var paper_material: StandardMaterial3D 

# Toggle to track whether the paper is visible or not
var toggle = false  

func _ready():
	# Set the material of the MeshInstance3D to the specified paper_material
	$MeshInstance3D.material_override = paper_material  

func interact():
	get_node("/root/" + get_tree().current_scene.name + "/paper_pickup").play()
	# Toggle the visibility state
	toggle = !toggle  
	
	# Show or hide the paper in the "sprint" folder of the current scene
	get_node("/root/" + get_tree().current_scene.name + "/sprint/paper").visible = toggle  
	
	# Enable or disable the player's movement based on the toggle state
	get_node("/root/" + get_tree().current_scene.name + "/Player").movable = !toggle  
	
	# Enable or disable the player's head movement based on the toggle state
	get_node("/root/" + get_tree().current_scene.name + "/Player/head").movable = !toggle  
