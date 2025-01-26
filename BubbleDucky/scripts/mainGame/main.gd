extends Node2D

@onready var timer = $Timer
@onready var player

var count = 0
var rng = RandomNumberGenerator.new()
var enemy_scene = preload("res://scenes/mainGame/bubble_enemy.tscn")  # Preload once for efficiency
var min_margin = 3000

func _ready() -> void:
	count = 0
	timer.timeout.connect(_on_timeout)
	timer.start()  # Ensure the timer starts if not already configured in the editor

func _on_timeout():
	player = $Player
	if count < 50:
		# Generate spawn position outside the viewable area
		var posx = player.global_position.x
		var posy = player.global_position.y
		
		var randx = RandomNumberGenerator.new().randf_range(posx-min_margin, posx+min_margin)
		var randy = RandomNumberGenerator.new().randf_range(posy-min_margin, posy+min_margin)
		
		while(randx - randx > min_margin or posx - randx > min_margin):
			randx = RandomNumberGenerator.new().randf_range(posx-min_margin, posx+min_margin)
		
		while(randy - randy > min_margin or posy - randy > min_margin):
			randy = RandomNumberGenerator.new().randf_range(posy-min_margin, posy+min_margin)
		
		# Instantiate and configure the enemy
		var enemy = enemy_scene.instantiate()
		enemy.position = Vector2(randx, randy)
		
		add_child(enemy)
		if enemy.has_method("start"):
			enemy.start()
		
		# Increment the counter and restart the timer
		count += 1
		timer.start()
	else:
		pass
