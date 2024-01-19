extends StaticBody2D

var move_speed = 100
var acceleration = 0
var direction = 1
var travel_distance = 0
var start_pos= 0
var end_pos = 0
var bullet = preload("res://bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = position.x
	end_pos = position.x + 231
	
func instance_object():
	var object = bullet.instantiate()
	owner.add_child(object)
	object.transform = $Marker2D.global_transform


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x  > end_pos:
		direction = -1
		position.y += 10
		travel_distance = 0
	elif position.x < start_pos:
		direction = 1
		position.y += 10
	position.x += direction*move_speed * delta
	travel_distance += 1



func _on_timer_timeout():
	instance_object()
