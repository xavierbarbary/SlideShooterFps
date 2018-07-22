extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$".".connect("button_down", self, "on_button_down")
	$".".connect("button_up", self, "on_button_up")

#func _process(delta):
#	pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

func on_button_down():
	if get_text() == "FPS":
		Engine.set_target_fps(0.1)
		Engine.set_time_scale(10)
	if get_text() == "Rotate Left":
		Input.action_press("ui_left")

	if get_text() == "Rotate Right":
		Input.action_press("ui_right")

	if get_text() == "Move Forward":
		Input.action_press("ui_up")

	if get_text() == "Move Backwards":
		Input.action_press("ui_down")

func on_button_up():
	if get_text() == "FPS":
		Engine.set_target_fps(0)
		Engine.set_time_scale(1)
	if get_text() == "Rotate Left":
		Input.action_release("ui_left")

	if get_text() == "Rotate Right":
		Input.action_release("ui_right")

	if get_text() == "Move Forward":
		Input.action_release("ui_up")

	if get_text() == "Move Backwards":
		Input.action_release("ui_down")
