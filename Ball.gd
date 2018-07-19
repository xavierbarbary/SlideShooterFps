extends RigidBody

# class member variables go here, for example:
var speed = 2000
var jumpHeight = 10
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3(0,0,0)

func _ready():
	pass

func _physics_process(delta):
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
	direction = direction * speed * delta
	if velocity == null:
		velocity = Vector3()
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	velocity = set_angular_velocity(velocity)

	if Input.is_action_pressed("ui_jump"):
		velocity.y = jumpHeight
