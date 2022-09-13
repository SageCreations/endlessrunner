extends Node

enum game_state {
	playing,
	dead,
	paused,
	main_menu
} 

var started_state : bool
func get_has_state_started(): return started_state
func set_has_state_started(var x : bool): started_state = x

var current_game_state = game_state.main_menu
func get_game_state(): return current_game_state
func set_game_state(var state): current_game_state = state

var gravity : float = 20
func get_gravity(): return gravity
func set_gravity(var x : float): gravity = x

var speed : float = -200.0
func get_speed(): return speed
func set_speed(var x : float): speed = x

var speed_multiplier : float = 1.0
func get_speed_multiplier(): return speed_multiplier
func set_speed_multiplier(var x : float): speed_multiplier = x

var score : int = 0
func get_score(): return score
func set_score(var x : int): score = x

var high_score : int = 0
func get_high_score(): return high_score
func set_high_score(var x : int): high_score = x

var old_high_score : int = 0
func get_old_high_score(): return old_high_score
func set_old_high_score(var x : int): old_high_score = x
var new_score : bool = false

var pause : bool = false
func get_pause_status(): return pause
func set_pause_status(var x : bool): 
	pause = x
	if (x == false): set_has_state_started(false)
