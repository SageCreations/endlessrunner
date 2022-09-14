extends KinematicBody2D


var x_vel : int = 1
var y_vel : int = 0

export var flying_type : bool
export var static_type : bool
export var grounded_type : bool


var dir = true

# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug("Xpos: " + str(position.x) + "      Ypos: " + str(position.y))
	
	
	randomize()
	main_data.set_speed_multiplier(rand_range(1.0, 1.7))



func _physics_process(delta):
	if (flying_type):
		pass
		#if ($switch_dir_timer.is_stopped()):
		#	$switch_dir_timer.start()
		#if (dir):
		#	y_vel += 50*  sin(1 * delta) + 2
		#else: 
		#	y_vel -=  2*(50*sin(1 * delta) + 2)
	elif (static_type):
		pass
		
	elif (grounded_type):
		y_vel += main_data.get_gravity()
		
	x_vel = main_data.get_speed() * main_data.get_speed_multiplier()
	move_and_slide(Vector2(x_vel, y_vel), Vector2(0, -1))
	

func spawn(var pos : Vector2, var rot):
	position = pos
	rotation = rot



func _on_Area2D_body_entered(body):
	if (body.get_name() == "Player"):
		main_data.set_game_state(main_data.game_state.dead)


func _on_switch_dir_timer_timeout():
	dir = !dir


