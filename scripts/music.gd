extends AudioStreamPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_deferred("volume_db", main_data.get_volume())
