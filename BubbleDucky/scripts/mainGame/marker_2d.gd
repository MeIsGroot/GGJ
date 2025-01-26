extends Marker2D

@onready var bullet = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Shoot"):
		var bullet_instance = bullet.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = global_position
