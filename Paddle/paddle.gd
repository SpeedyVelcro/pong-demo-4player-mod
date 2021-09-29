extends Area2D

const MOVE_SPEED = 200
const MOVE_TO_CENTER_SPEED = 1.0
enum Side {LEFT, RIGHT, TOP, BOTTOM}
export(Side) var player

var _ball_dir
var _up # Left for horizontal paddles
var _down # Right for horizontal paddles
var start_position
var paddles_started = false

onready var _screen_size_y = get_viewport_rect().size.y
onready var _screen_size_x = get_viewport_rect().size.x

func _ready():
	start_position = position
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
	if Input.is_action_just_pressed("ui_select"):
		paddles_started = true
	# Move up and down based on input.
	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
	var move = input * MOVE_SPEED * delta
	if player == Side.LEFT or player == Side.RIGHT:
		position.y += move
	else:
		position.x += move
	position.y = clamp(position.y, 64, _screen_size_y - 64)
	position.x = clamp(position.x, 64, _screen_size_x - 64)
	# Drift to center
	if paddles_started:
		match player:
			Side.LEFT:
				position += Vector2.RIGHT * delta * MOVE_TO_CENTER_SPEED
			Side.RIGHT:
				position += Vector2.LEFT * delta * MOVE_TO_CENTER_SPEED
			Side.TOP:
				position += Vector2.DOWN * delta * MOVE_TO_CENTER_SPEED
			Side.BOTTOM:
				position += Vector2.UP * delta * MOVE_TO_CENTER_SPEED


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


func _on_Ball_reset():
	position = start_position
