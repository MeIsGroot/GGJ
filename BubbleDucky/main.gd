extends Node2D


@onready var timer = $Timer
@onready var player = $Player
@onready var screensize = get_viewport_rect().size

var count = 0
var rng = RandomNumberGenerator.new()
var enemy_scene = preload("res://bubble_enemy.tscn")  # Preload once for efficiency
var spawn_margin = 100  # Distance outside the screen for spawning


func _ready() -> void:
	count = 0
	timer.timeout.connect(_on_timeout)
	timer.start()  # Ensure the timer starts if not already configured in the editor

func _process(delta: float) -> void:
	pass

func _on_timeout():
	if count < 50:
		# Generate spawn position outside the viewable area
		var spawn_position = get_spawn_outside_viewable_area()
		
		# Instantiate and configure the enemy
		var enemy = enemy_scene.instantiate()
		enemy.position = spawn_position
		add_child(enemy)
		
		if enemy.has_method("start"):
			enemy.start()
		
		# Increment the counter and restart the timer
		count += 1
		timer.start()
	else:
		pass

func get_spawn_outside_viewable_area() -> Vector2:
	# Get a random side: top, bottom, left, or right
	var side = rng.randi_range(0, 3)
	var x
	var y
	if side == 0:  # Top
		x = rng.randf_range(-spawn_margin, screensize.x + spawn_margin)
		y = -spawn_margin
	elif side == 1:  # Bottom
		x = rng.randf_range(-spawn_margin, screensize.x + spawn_margin)
		y = screensize.y + spawn_margin
	elif side == 2:  # Left
		x = -spawn_margin
		y = rng.randf_range(-spawn_margin, screensize.y + spawn_margin)
	elif side == 3:  # Right
		x = screensize.x + spawn_margin
		y = rng.randf_range(-spawn_margin, screensize.y + spawn_margin)
	
	return Vector2(x, y)
