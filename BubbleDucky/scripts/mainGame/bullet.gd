extends Area2D

var flag = 1
var travelled_distance = 0
var mouse_pos
var object_pos
var penetration = 2
var SPEED = 1000
var RANGE = 1200
var damage = 5

func _physics_process(delta):
	
	if(flag == 1 and Input.is_action_pressed("shoot")):
		flag = 0
		mouse_pos = get_global_mouse_position()
		object_pos = global_position
	
	var direction_vector = mouse_pos - object_pos
	var direction = direction_vector.normalized()
	
	rotation = direction.angle()
		
	position += Vector2(cos(rotation), sin(rotation)) * SPEED * delta
	
	travelled_distance += 1000 * delta
	
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if(penetration <= 0):
		queue_free()
	else:
		if(body.has_method("take_damage")):
			body.take_damage(damage)

func get_damage():
	print(damage)
	return damage

func take_damage(damage):
	penetration -= 1
