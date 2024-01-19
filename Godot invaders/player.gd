extends ch

var move_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Right"):
		position.x = position.x + move_speed * delta
	elif Input.is_action_pressed("Left"):
		position.x -= move_speed * delta
