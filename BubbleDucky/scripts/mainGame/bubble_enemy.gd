extends CharacterBody2D

var damage = 15
var speed = 250
var player

func _ready() -> void:
	var main = get_parent()
	player = main.get_node("Player")

func _physics_process(delta):
	if player:
		# If a player exists, follow them
		var player_position = player.global_position
		var direction = (player_position - global_position).normalized()  # Get the direction
		velocity = direction * speed  # Set the velocity to move towards the player
		move_and_collide(velocity * delta)
	
func get_damage():
	return damage

func set_damage(number):
	damage+=number

func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent().has_node("Camera2D")):
		self.queue_free()
