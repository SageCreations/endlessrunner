extends Control


func _on_Button_pressed():
	main_data.set_has_state_started(false)
	main_data.set_game_state(main_data.game_state.playing)
