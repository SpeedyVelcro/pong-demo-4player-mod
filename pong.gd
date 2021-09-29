extends Node2D

enum {PLAYER_LEFT, PLAYER_RIGHT, PLAYER_TOP, PLAYER_BOTTOM}
var score = [0, 0, 0, 0]
const GOAL_VALUE = 1
var score_label = {}

func _ready():
	score_label[PLAYER_LEFT] = get_node("LeftScoreLabel")
	score_label[PLAYER_RIGHT] = get_node("RightScoreLabel")
	score_label[PLAYER_TOP] = get_node("TopScoreLabel")
	score_label[PLAYER_BOTTOM] = get_node("BottomScoreLabel")

func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		$LeftInstruction.set_visible(false)
		$RightInstruction.set_visible(false)
		$TopInstruction.set_visible(false)
		$BottomInstruction.set_visible(false)

func _on_LeftWall_lost_ball():
	add_score_except(PLAYER_LEFT, GOAL_VALUE)

func _on_RightWall_lost_ball():
	add_score_except(PLAYER_RIGHT, GOAL_VALUE)

func _on_TopWall_lost_ball():
	add_score_except(PLAYER_TOP, GOAL_VALUE)

func _on_BottomWall_lost_ball():
	add_score_except(PLAYER_BOTTOM, GOAL_VALUE)

func set_score(player : int, value : int):
	score[player] = value
	score_label[player].set_text(str(value))

func get_score(player : int):
	return score[player]

func add_score(player : int, value : int = 1):
	set_score(player, get_score(player) + value)

func add_score_except(player : int, value : int = 1):
	if player != PLAYER_LEFT:
		add_score(PLAYER_LEFT, value)
	if player != PLAYER_RIGHT:
		add_score(PLAYER_RIGHT, value)
	if player != PLAYER_TOP:
		add_score(PLAYER_TOP, value)
	if player != PLAYER_BOTTOM:
		add_score(PLAYER_BOTTOM, value)
