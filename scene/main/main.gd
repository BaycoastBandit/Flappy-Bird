extends Control

@onready var bg: = get_node("bg")
@onready var sky: = get_node("sky")
@onready var player: = get_node("player")
@onready var spawn_pipe_timer: Timer = get_node("CanvasLayer/pipe_spawner/Timer")
@onready var hub: = get_node("HUD/ScoreContainer")

var countdown = 3

func _on_gameover():
	spawn_pipe_timer.stop()
	player.player_move(false)
	get_tree().call_group("pipes", "stop_moving")
	bg.stop_moving()
	sky.stop_moving()
	$HUD.gameover_display()

func _on_start_game():
	player.player_visible(true)
	while countdown >= 0:
		hub.update_score(countdown)
		await get_tree().create_timer(1.0).timeout
		countdown -= 1
	player.player_move(true)
	player.ready_anim_play(false)
	spawn_pipe_timer.start()
