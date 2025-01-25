extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$BubbleDucky.play


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#Button press calls
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/mainGame/MAIN.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/mainMenu/settings.tscn")


func _on_quit_pressed():
	get_tree().quit()
