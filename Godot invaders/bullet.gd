extends Area2D

var move_speed = 150


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += move_speed *delta


func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
	if  body.is_in_group("br"):
		print("br")
		body.queue_free()
		$".".queue_free()
