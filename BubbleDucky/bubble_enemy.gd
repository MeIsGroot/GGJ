extends CharacterBody2D

var speed = 25

# Get player node
@export var player : Node2D

func _physics_process(delta):
	# If a player exists, follow them
	var player_position = player.global_position
	var direction = (player_position - global_position).normalized()  # Get the direction
	velocity = direction * speed  # Set the velocity to move towards the player
	move_and_collide(velocity * delta)
