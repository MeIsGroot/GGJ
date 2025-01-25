extends CharacterBody2D

var speed = 500
var player

func _ready() -> void:
	var main = get_parent()
	player = main.get_node("Player")

func _physics_process(delta):
	# If a player exists, follow them
	var player_position = player.global_position
	var direction = (player_position - global_position).normalized()  # Get the direction
	velocity = direction * speed  # Set the velocity to move towards the player
	move_and_collide(velocity * delta)
