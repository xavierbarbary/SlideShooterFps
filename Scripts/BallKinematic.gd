
extends KinematicBody

# Member variables
var g = -9.8
var vel = Vector3()
const MAX_SPEED = 20
const JUMP_SPEED = 7
const ACCEL= 5
const DEACCEL= 4
const MAX_SLOPE_ANGLE = 30


func _physics_process(delta):
	var dir = Vector3() # Where does the player intend to walk to
	var cam_xform = get_node("Camera").get_global_transform()

	if Input.is_action_pressed("ui_up"):
		dir += -cam_xform.basis[2]
	if Input.is_action_pressed("ui_down"):
		dir += cam_xform.basis[2]
	if Input.is_action_pressed("ui_left"):
		dir += -cam_xform.basis[0]
	if Input.is_action_pressed("ui_right"):
		dir += cam_xform.basis[0]

	dir.y = 0
	dir = dir.normalized()

	vel.y += delta * g

	var hvel = vel
	hvel.y = 0

	var target = dir * MAX_SPEED
	var accel
	if dir.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL

	hvel = hvel.linear_interpolate(target, accel * delta)

	vel.x = hvel.x
	vel.z = hvel.z

	vel = move_and_slide(vel, Vector3(0,1,0))

	if is_on_floor() and Input.is_action_pressed("ui_jump"):
		vel.y = JUMP_SPEED


func _on_tcube_body_enter(body):
	if body == self:
		get_node("../ty").show()
