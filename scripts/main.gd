extends Node



export(Array, PackedScene) var enemies


export var time : float = 6.0
export var time_multiplier : float = 1.0

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$lose_menu.set_deferred("visible", true)
	$Player.set_deferred("visible", false)
	$playing_menu.set_deferred("visible", false)
	main_menu()
	main_data.set_high_score(0)


func _process(delta):
	if (main_data.get_game_state() == main_data.game_state.main_menu):
		if (main_data.get_has_state_started() == false):
			main_data.set_has_state_started(true)
			main_menu()
	
	elif (main_data.get_game_state() == main_data.game_state.playing):
		if($pause_menu.visible == true):
			$pause_menu.set_deferred("visible", false)
		
		if (main_data.get_has_state_started() == false):
			main_data.set_has_state_started(true)
			start_game()
		
		if ($spawn_timer.is_stopped()):
			var this_time = time * time_multiplier
			$spawn_timer.start(this_time)
			print_debug(str(this_time) + "       multi: " + str(time_multiplier))
			
		if (Input.is_action_just_pressed("pause")):
			main_data.set_has_state_started(false)
			pause_game()
			main_data.set_game_state(main_data.game_state.paused)
			get_tree().paused = !get_tree().paused
			
	
	elif (main_data.get_game_state() == main_data.game_state.paused):
		if (main_data.get_has_state_started() == false):
			main_data.set_has_state_started(true)
			pause_game()
	
	elif (main_data.get_game_state() == main_data.game_state.dead):
			$spawn_timer.stop()
			lose_game()
			
	




func spawn_enemies():
	randomize()
	var i = rng.randi_range(0, enemies.size()-1)
	var enemy = enemies[i].instance()
	var pos = $spawn_point.position
	enemy.spawn(pos, 0)
	get_parent().add_child(enemy)



func main_menu():
	$Player.set_deferred("visible", false)
	$playing_menu.set_deferred("visible", false)
	$lose_menu.set_deferred("visible", false)
	$pause_menu.set_deferred("visible", false)
	
	$main_menu.set_deferred("visible", true)


func start_game():
	# hide main_menu
	$main_menu.set_deferred("visible", false)
	$lose_menu.set_deferred("visible", false)
	$pause_menu.set_deferred("visible", false)
	
	# show playing menu
	$Player.set_deferred("visible", true)
	$playing_menu.set_deferred("visible", true)
	
	if (main_data.new_score == true):
		main_data.new_score = false
		main_data.set_old_high_score(main_data.get_high_score())
	
	main_data.set_score(0)
	$spawn_timer.start(2)
	$score_keeper/CollisionShape2D.set_deferred("disabled", false)
	


func pause_game():
	get_tree().paused = true
	$pause_menu.set_deferred("visible", true)

func lose_game():
	#stop everything and show lose screen
	$Player.set_deferred("visible", false)
	$playing_menu.set_deferred("visible", false)
	$score_keeper/CollisionShape2D.set_deferred("disabled", true)
	
	if(main_data.get_old_high_score() < main_data.get_high_score()):
		main_data.new_score = true
	
	$lose_menu.set_deferred("visible", true)


func _on_garbage_collection_body_entered(body):
	print_debug("should have deleted")
	body.queue_free()


func _on_spawn_timer_timeout():
	spawn_enemies()
	if (time_multiplier > 0.17):
		time_multiplier -= 0.01


func _on_score_keeper_body_entered(body):
	main_data.set_score(main_data.get_score() + 1)
	if (main_data.get_score() > main_data.get_high_score()):
		main_data.set_high_score(main_data.get_score())
