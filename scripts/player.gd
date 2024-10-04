extends CharacterBody2D

const MAX_SPEED = 200
var direction = Vector2.ZERO

func _ready():
	pass

func move():
	var movement_vector = get_moment_vector()
	direction = movement_vector.normalized()
	
	velocity = direction * MAX_SPEED
	move_and_slide()

func _physics_process(delta: float) -> void:
	move()

func get_moment_vector():
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	return Vector2(x, y)
