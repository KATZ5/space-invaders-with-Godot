extends Area2D

var move_speed = 150
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= move_speed *delta


func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
		$".".queue_free()
	if body.is_in_group("bullet1"):
		body.queue_free()
		$".".queue_free()   
