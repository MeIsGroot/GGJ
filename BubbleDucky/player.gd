extends CharacterBody2D

const speed = 1000.0

func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("KEY_D"):
		position.x += speed * delta
	if Input.is_action_pressed("KEY_A"):
		position.x -= speed * delta
	if Input.is_action_pressed("KEY_S"):
		position.y += speed * delta
	if Input.is_action_pressed("KEY_W"):
		position.y -= speed * delta
	
	move_and_slide()
