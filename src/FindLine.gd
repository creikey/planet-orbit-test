extends Node2D

export (NodePath) var planet_path
export (NodePath) var player_path

onready var planet_node = get_node(planet_path)
onready var player_node = get_node(player_path)

func _ready():
	set_process(true)

func _process(delta):
	update()

func _draw():
#	var p_an_distance = asin((player_node.global_position.x - planet_node.global_position.x)/planet_node.radius)
#	if(player_node.global_position.y < planet_node.global_position.y):
#		p_an_distance *= -1
#		p_an_distance += PI
	var p_an_distance = get_angle(planet_node.global_position, planet_node.radius, player_node.global_position)
	var p_pos = Vector2(sin(p_an_distance)*planet_node.radius, cos(p_an_distance)*planet_node.radius) + planet_node.global_position
	draw_line(planet_node.global_position, p_pos, Color(255,0,0), 5.0)

func get_angle(base_coord, in_radius, in_coord):
	var an_distance = asin((in_coord.x - base_coord.x)/in_radius)
	if(in_coord.y < base_coord.y):
		an_distance *= -1
		an_distance += PI
	return an_distance