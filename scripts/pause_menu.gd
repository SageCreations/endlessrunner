extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_resume_button_pressed():
	main_data.set_game_state(main_data.game_state.playing)
	get_tree().paused = !get_tree().paused
