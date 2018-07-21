extends RigidBody

# class member variables go here, for example:
var speed = 2000
var jumpHeight = 10
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3(0,0,0)

func _ready():
	set_mode(MODE_CHARACTER)
	pass

func _integrate_forces(state):
	var camera = get_node("../Camera")
	# set_rotation_degrees(Vector3(0,camera.get_rotation_degrees().y,0))
	rotate_y(camera.get_rotation().y - get_rotation().y)

	direction = Vector3(0, 0, 0)
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_select"):
		direction.y += 1
	direction = direction.normalized()
	direction = direction * speed
	if velocity == null:
		velocity = Vector3()
	velocity.y += gravity
	velocity.x = direction.x
	velocity.z = direction.z
	velocity = set_linear_velocity(velocity)


	if Input.is_action_pressed("ui_jump"):
		set_axis_velocity(Vector3(0,jumpHeight,0))
