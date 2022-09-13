extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$score.text = "Score: " + str(main_data.get_score())
	$high_score.text = "High Score: " + str(main_data.get_high_score())
