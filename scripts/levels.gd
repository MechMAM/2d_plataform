extends Node2D

@onready var hud = $HUD as CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	var hudControl = hud.get_node("Control")
	hudControl.time_is_up.connect(end_game)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func end_game():
	get_tree().change_scene_to_file("res://cenas/game_ending.tscn")
