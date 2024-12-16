extends ParallaxBackground

@onready var sky: Sprite2D = get_node("sky/sprite2d")

const scroll_speed = 100

func _ready() -> void:
	sky.texture = load("res://assets/Sprite/FlappyAsset/background-" + str(randi_range(1, 2)) + ".png")

func _process(delta: float) -> void:
	scroll_offset.x -= scroll_speed * delta


func stop_moving() -> void:
	set_process(false)
