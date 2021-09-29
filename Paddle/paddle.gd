extends Area2D

const MOVE_SPEED = 200
enum Side {LEFT, RIGHT, TOP, BOTTOM}
export(Side) var player

var _ball_dir
var _up # Left for horizontal paddles
var _down # Right for horizontal paddles

onready var _screen_size_y = get_viewport_rect().size.y
onready var _screen_size_x = get_viewport_rect().size.x

func _ready():
	match player:
		Side.LEFT:
			_up = "left_move_up"
			_down = "left_move_down"
			_ball_dir = 1
		Side.RIGHT:
			_up = "right_move_up"
			_down = "right_move_down"
			_ball_dir = -1
		Side.TOP:
			_up = "top_move_left"
			_down = "top_move_right"
			_ball_dir = 1
		Side.BOTTOM:
			_up = "bottom_move_left"
			_down = "bottom_move_right"
			_ball_dir = -1

func _process(delta):
	# Move up and down based on input.
	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
	var move = input * MOVE_SPEED * delta
	if player == Side.LEFT or player == Side.RIGHT:
		position.y += move
	else:
		position.x += move
	position.y = clamp(position.y, 64, _screen_size_y - 64)
	position.x = clamp(position.x, 64, _screen_size_x - 64)


func _on_area_entered(area):
	if area.name == "Ball":
		# Assign new direction.
		var parallel_speed = randf() * 2 - 1
		var new_velocity
		if player == Side.LEFT or player == Side.RIGHT:
			new_velocity = Vector2(_ball_dir, parallel_speed)
		else:
			new_velocity = Vector2(parallel_speed, _ball_dir)
		area.direction = new_velocity.normalized()
