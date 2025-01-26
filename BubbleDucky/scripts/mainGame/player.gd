extends CharacterBody2D

const speed = 2500
var health = 100.00
var defence = 10
var level = 1
var experience = 0.0
var exp_increments = range(40, 10000, 40)
var multiplier = 1

@onready var damage 

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	$Health.value = health+defence
	$Experience.value = 0
	$Experience.max_value = exp_increments[level]
	$Level.text = "Level: " + str(level)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("KEY_D"):
		position.x += speed * delta
	if Input.is_action_pressed("KEY_A"):
		position.x -= speed * delta
	if Input.is_action_pressed("KEY_S"):
		position.y += speed * delta
	if Input.is_action_pressed("KEY_W"):
		position.y -= speed * delta
	if(!(Input.is_action_pressed("KEY_D") or Input.is_action_pressed("KEY_A") or Input.is_action_pressed("KEY_S") or Input.is_action_pressed("KEY_W"))):
		velocity = Vector2(0, 0)
	move_and_slide()

func die():
	get_tree().change_scene_to_file("res://scenes/endScreen/EndScreen.tscn")
	self.queue_free()

func do_damage(damage):
	health -= (damage * multiplier) - defence
	$Health.value = health
	print(health)
	print()
	if(health <= 0):
		self.queue_free()
		die()
		
func get_exp(exp): 
	if level != exp_increments.size() - 1:
		for i in range(exp):
			experience+=1
			if experience >= exp_increments[level]:
				experience-=exp_increments[level]
				level+=1
			if level == exp_increments.size()-1:
				experience=0.0
		print(experience)
		$Experience.value = experience
		$Level.text = "Level: " + str(level)
		$Experience.max_value = exp_increments[level]
	
