extends CharacterBody2D

const SPEED = 1000.0
@onready var _animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	_animated_sprite.play("default")

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("KEY_A", "KEY_D", "KEY_W", "KEY_S")
	velocity = transform.x * input_direction.x * SPEED + transform.y * input_direction.y * SPEED
	
	move_and_slide()
