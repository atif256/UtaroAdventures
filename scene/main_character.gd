extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -390.0
const double_jump: float = -250
#@onready var sprite_2d = $Sprite2D
@onready var animated_sprite: AnimatedSprite2D = $Sprite2D
#var score =0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped: bool = false
var direction: Vector2 = Vector2.ZERO

#action var
var basic_att: bool = true

#animation state
var current_animation: String = "idle with sword"

func _physics_process(delta):

	#animation
	if (velocity.x > 1 || velocity.x < -1):
		current_animation = "running"
	else:
		#current_animation = "idle with sword"
		current_animation = "basic attack"


	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		current_animation = "jumping"
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
			
			



	#To handle mouse click - perform basic attack using sword
	if Input.is_action_just_pressed("Basic attack") and basic_att:
		print("attack with sword")
		#current_animation = "basic attack"
		basic_att = false
		#basic_attack_timer = basic_attack_duration
		$Timer.wait_time = 0.8
		$Timer.start()



	animated_sprite.animation = current_animation

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# ui_left and ui_right
	direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 15)
# to change the animation of the player to the left if left button is press
	move_and_slide()
	update_facing_direction()
	update_animation()


func _on_timer_timeout():
	basic_att = true


func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true

func update_animation():
	if Input.is_action_just_pressed("Basic attack"):
		current_animation = "basic attack"
		
		
