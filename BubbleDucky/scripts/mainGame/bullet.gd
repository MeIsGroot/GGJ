extends Area2D

var flag = 1
var travelled_distance = 0
var mouse_pos
var object_pos

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	if(flag == 1 and Input.is_action_pressed("Shoot")):
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
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
