extends Control

@onready var label_2 = $container/timerContainer/Label2 as Label
@onready var score_counter = $container/scoreContainer/score_counter as Label
@onready var timer = $Timer as Timer

var minutes = 0
var seconds = 0
@export_range(0,5) var default_minutes := 1
@export_range(0,59) var default_seconds := 00

signal time_is_up()

# Called when the node enters the scene tree for the first time.
func _ready():
	score_counter.text = str("%03d" % Globals.score)
	label_2.text = str("%02d" % default_minutes) + ":" + str("%02d" % default_seconds)
	reset_clock_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score_counter.text = str("%03d" % Globals.score)
	if minutes == 0 and seconds == 0:
		emit_signal("time_is_up")

func _on_timer_timeout():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	seconds -= 1
	
	label_2.text = str("%02d" % minutes) + ":" + str("%02d" % seconds)

func reset_clock_timer():
	minutes = default_minutes
	seconds = default_seconds


func _on_restart_btn_pressed():
	get_tree().change_scene_to_file("res://levels/level1.tscn")
	Globals.score = 0

func _on_exit_btn_pressed():
	get_tree().quit()
