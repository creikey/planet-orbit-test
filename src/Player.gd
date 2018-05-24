tool
extends Node2D

export (NodePath) var planet_path
export var size = 10.0 setget _set_size
export var color = Color() setget _set_color
export var move_speed = 5.0

var counter = 0.0

onready var planet_node = get_node(planet_path)

func _ready():
	if(Engine.editor_hint):
		set_process(false)
	else:
		set_process(true)

func _draw():
	draw_rect(Rect2(Vector2(), Vector2(size,size)), color)

func _set_size(new_size):
	size = new_size
	update()

func _set_color(new_color):
	color = new_color
	update()

func _process(delta):
	global_position = Vector2(sin(counter)*planet_node.radius, cos(counter)*planet_node.radius) + planet_node.global_position
	rotation = -counter
	counter += move_speed*delta*2*PI
	counter = fmod(counter, 2*PI)