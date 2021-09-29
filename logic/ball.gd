extends Area2D

const DEFAULT_SPEED = 200

var _speed = DEFAULT_SPEED
var direction = Vector2.DOWN
var moving = false
signal reset

onready var _initial_pos = position

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		moving = true
	if moving:
		_speed += delta * 2
		position += _speed * delta * direction


func reset():
	#var dir_choice = randi() % 4
	#match dir_choice:
	#	0:
	#		direction = Vector2.LEFT
	#	1:
	#		direction = Vector2.UP
	#	2:
	#		direction = Vector2.RIGHT
	#	3:
	#		direction = Vector2.DOWN
	direction = Vector2(0, 0)
	while direction.length_squared() == 0:
		direction.x = rand_range(-1, 1)
		direction.y = rand_range(-1, 1)
	direction = direction.normalized()
	position = _initial_pos
	_speed = DEFAULT_SPEED
	emit_signal("reset")
