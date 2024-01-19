extends CharacterBody2D
 
var can_shoot = true  
var left = 0
var right = 0
var shoot = false            

const SPEED = 300.0
var bullet = preload("res://bullet2.tscn")



func _process(delta):
	if can_shoot == true:
		if Input.is_action_pressed("Shoot") or shoot == true:
			instance_object()
			can_shoot = false 
		
		
func instance_object():
	var object = bullet.instantiate()
	owner.add_child(object)
	object.transform = $Marker2D.global_transform
	
func _physics_process(delta):
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction :
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if left == -1 :
		velocity.x = left * SPEED
	elif right == 1:
		velocity.x = right * SPEED


	move_and_slide()

func _on_timer_timeout():
	can_shoot = true


func _on_button_button_down():
	left = -1
	
func _on_button_button_up():
	left = 0

func _on_button_2_button_down():
	right = 1


func _on_button_2_button_up():
	right = 0


func _on_button_3_pressed():
	shoot = true
