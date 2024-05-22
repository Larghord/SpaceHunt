extends CharacterBody3D


var speed:float = 5.0
var is_forward:bool = false
var is_backward:bool = false
var is_idle:bool = true

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	var input_dir:Vector2 = Input.get_vector("left", "right", "forward_thrust", "backward_thrust")
	var direction:Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		print(velocity.z)
		if velocity.z > 0:
			is_forward = false
			is_backward = true
			is_idle = false
		elif velocity.z < 0:
			is_forward = true
			is_backward = false
			is_idle = false
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		is_forward = false
		is_backward = false
		is_idle = true

	move_and_slide()
