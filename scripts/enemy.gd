extends KinematicBody2D


var x_vel : int = 1
var y_vel : int = 0

export var flying_type : bool
export var static_type : bool
export var grounded_type : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug("Xpos: " + str(position.x) + "      Ypos: " + str(position.y))

func _physics_process(delta):
	
	
	if (flying_type):
		#specific stuff for flying enemies
		pass
	elif (static_type):
		#specific stuff for static objects
		pass
	elif (grounded_type):
		#specific stuff for grounded enemies
		pass
	
	
	x_vel = main_data.get_speed() * main_data.get_speed_multiplier()
	move_and_slide(Vector2(x_vel, y_vel), Vector2(0, -1))
	

func spawn(var pos : Vector2, var rot):
	position = pos
	rotation = rot



func _on_Area2D_body_entered(body):
	if (body.get_name() == "Player"):
		main_data.set_game_state(main_data.game_state.dead)
