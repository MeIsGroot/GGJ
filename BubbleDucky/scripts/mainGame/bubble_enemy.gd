extends CharacterBody2D
@onready var _animated_sprite = $Anim
var damage = 15
var speed = 250
var health = 10
var exp = 20
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
	
func pop(area):
	area.get_parent().do_damage(damage)
	$Anim.play("pop")
	area.get_parent().get_exp(exp)
	$PopTimer.start()	
	reduce_count()

func pop_w():
	$Anim.play("pop")
	player.get_exp(exp)
	$PopTimer.start()
	reduce_count()

func take_damage(damage):
	self.health -= damage
	if(self.health<=0):
		pop_w()

#timer to make sure pop anim plays
func _on_pop_timer_timeout():
	self.queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.get_parent().has_node("Camera2D")):
		pop(area)
		
func reduce_count():
	get_parent().reduce_count()
