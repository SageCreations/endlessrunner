extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (main_data.new_score == true):
		$ColorRect/Control/Label.text = "New High Score: " + str(main_data.get_high_score())
		
	else:
		$ColorRect/Control/Label.text = ("Score: " + str(main_data.get_score()) 
		+ "\nBest High Score: " + str(main_data.get_high_score()))
	
	
	
func _on_retry_button_pressed():
	main_data.set_has_state_started(false)
	main_data.set_game_state(main_data.game_state.playing)


func _on_menu_button_pressed():
	main_data.set_has_state_started(false)
	main_data.set_game_state(main_data.game_state.main_menu)
