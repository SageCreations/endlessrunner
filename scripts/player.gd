extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var y_vel = 0
export var jump_force = 300
export var max_y_vel = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (y_vel > max_y_vel):
		y_vel = max_y_vel
	else: 
		y_vel += main_data.get_gravity()
	
	if (is_on_floor()):
		$AnimatedSprite.play("walk")
		y_vel = 1
		if(Input.is_action_just_pressed("jump")):
			y_vel = -jump_force
			$jump.play()
	else:
		$AnimatedSprite.play("in_air")
	
	move_and_slide(Vector2(0, y_vel), Vector2(0, -1))
	#position.y += y_vel * delta
