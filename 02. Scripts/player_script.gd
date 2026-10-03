extends CharacterBody3D


@onready var Char_Sprite: AnimatedSprite3D = $Player_AnimSprite


const SPEED = 7
const JUMP_VELOCITY = 7

func _ready() -> void:
	Char_Sprite.play("idle")
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the -35.3ºmovement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	### ANIMATIONS H Flipping
	#print(direction)
	
	if Input.is_action_just_pressed("Left"):
		Char_Sprite.flip_h = false
		Char_Sprite.play("walk")
	if Input.is_action_just_pressed("Right"):
		Char_Sprite.flip_h = true
		Char_Sprite.play("walk")
	if Input.is_action_just_pressed("Up"):
		Char_Sprite.play("back")
		
	if direction:
		
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		Char_Sprite.play("idle")
	move_and_slide()
