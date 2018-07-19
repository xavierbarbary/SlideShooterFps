extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var view_sensitivity = 0.25
var yaw = 0
var pitch = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_current(true)
	pass


func _input(event):
	if event is InputEventMouseMotion:
		yaw = fmod(yaw - event.relative.x * view_sensitivity, 360)
		pitch = max(min(pitch - event.relative.y * view_sensitivity, 85), -85)
		print(deg2rad(pitch))
		print(deg2rad(yaw))
		set_rotation(Vector3(deg2rad(pitch), deg2rad(yaw), 0))
		# camera.set_rotation(Vector3(deg2rad(pitch), deg2rad(yaw), 0))
