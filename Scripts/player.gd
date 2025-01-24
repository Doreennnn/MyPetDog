extends CharacterBody3D

var ORIGINAL_SPEED
var SPEED = 3.0
var sprint_drain_amout = 0.1
var sprint_refresh_amout = 0.1
var SPRINT_SPEED = 7.0
const JUMP_VELOCITY = 4.5
var sprint_slider
var movable = false

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var walk_sound: AudioStream
@export var run_sound: AudioStream
var walk_audio_player: AudioStreamPlayer3D
var run_audio_player: AudioStreamPlayer3D

func _ready():
	ORIGINAL_SPEED = SPEED
	sprint_slider = get_node("/root/" + get_tree().current_scene.name + "/sprint/sprint_slider") 
	walk_audio_player = AudioStreamPlayer3D.new()
	run_audio_player = AudioStreamPlayer3D.new()
	add_child(walk_audio_player)
	add_child(run_audio_player)
	walk_audio_player.stream = walk_sound
	run_audio_player.stream = run_sound
	
func _process(delta):
	if SPEED == SPRINT_SPEED:
		sprint_slider.value = sprint_slider.value - sprint_drain_amout * delta
		if sprint_slider.value == sprint_slider.min_value:
			SPEED = ORIGINAL_SPEED
			stop_run_sound()
			SPEED = ORIGINAL_SPEED
	if SPEED != SPRINT_SPEED:
		if sprint_slider.value < sprint_slider.max_value:
			sprint_slider.value = sprint_slider.value + sprint_refresh_amout * delta
		if sprint_slider.value == sprint_slider.max_value:
			sprint_slider.visible = false
				

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if movable == true:
			# Handle jump.
			if Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = JUMP_VELOCITY
				
			var input_dir = Input.get_vector("left", "right", "forward", "backward")
			var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
			if direction:
				velocity.x = direction.x * SPEED
				velocity.z = direction.z * SPEED
				if Input.is_action_just_pressed("sprint"):
					sprint_slider.visible = true
					SPEED = SPRINT_SPEED
					play_run_sound()
				if Input.is_action_just_released("sprint"):
					SPEED = ORIGINAL_SPEED
					stop_run_sound()
				if not is_playing_walk_sound():
					play_walk_sound()
					
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				velocity.z = move_toward(velocity.z, 0, SPEED)
				stop_walk_sound()
				
			move_and_slide()
					
				
func play_walk_sound() -> void:
	# Play walking sound if it's not already playing
	if not walk_audio_player.playing:
		walk_audio_player.play()

func stop_walk_sound() -> void:
	# Stop walking sound
	if walk_audio_player.playing:
		walk_audio_player.stop()

func is_playing_walk_sound() -> bool:
	# Check if walking sound is already playing
	return walk_audio_player.playing

func play_run_sound() -> void:
	# Play running sound if it's not already playing
	if not run_audio_player.playing:
		run_audio_player.play()

func stop_run_sound() -> void:
	# Stop running sound
	if run_audio_player.playing:
		run_audio_player.stop()
		
	
	
