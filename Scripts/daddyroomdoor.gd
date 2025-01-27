extends StaticBody3D

var interactable = true  
var opened = false  

func interact():
	if get_parent().get_parent().locked == true and get_parent().get_parent().key == null:
		get_parent().get_parent().locked = false  
	if interactable == true && get_parent().get_parent().locked == false:
		interactable = false  
		opened = !opened  
		if opened == false:
			$close.play()
			$AnimationPlayer.play("close")
		if opened == true:
			$open.play()
			$AnimationPlayer.play("open")
		await get_tree().create_timer(1.0, false).timeout
		interactable = true
	if interactable == true && get_parent().get_parent().locked == true:
		$locked.play()
		interactable = false
		$AnimationPlayer.play("locked")
		await get_tree().create_timer(1.0, false).timeout
		interactable = true
