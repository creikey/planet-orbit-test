tool
extends Node2D

export var radius = 50.0 setget _set_radius
export var color = Color() setget _set_color

func _draw():
	draw_circle(Vector2(), radius, color)

func _set_radius(new_radius):
	radius = new_radius
	update()

func _set_color(new_color):
	color = new_color
	update()