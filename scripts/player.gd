extends CharacterBody2D

const ACCELERATION_SMOOTHING = 25
const MAX_SPEED = 150
var direction = Vector2.ZERO

func _ready():
	pass

func move(delta):
	var movement_vector = get_moment_vector()
	direction = movement_vector.normalized()
	
	var target_velocity = direction * MAX_SPEED
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	
	move_and_slide()

func _physics_process(delta: float) -> void:
	move(delta)

func get_moment_vector():
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	return Vector2(x, y)
