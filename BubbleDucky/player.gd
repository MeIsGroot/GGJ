extends CharacterBody2D

const speed = 250
var health = 100.00
var defence = 10
var multiplier = 1

@onready var damage 

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	$Health.value = health+defence

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

func die():
	self.queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	damage = area.get_parent().get_damage()
	health -= (damage * multiplier) - defence
	$Health.value = health
	print(health)
	if(health < 0):
		die()
