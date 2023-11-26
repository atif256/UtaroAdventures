extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -390.0
const double_jump: float = -250
@onready var sprite_2d = $Sprite2D
#var GetSword =0
var score =0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped: bool = false




func _physics_process(delta):
	#label
	#bar.text = "Collectibles: " + str(score / 20)
	#animation
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"
	else:
		has_double_jumped = false

	# Handle Jump.a
	#jump = ui_accept
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif not has_double_jumped:
			velocity.y = double_jump
			has_double_jumped = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# ui_left and ui_right
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 15)

	move_and_slide()
	
	var isLeft = velocity.x <0
	sprite_2d.flip_h = isLeft
	
