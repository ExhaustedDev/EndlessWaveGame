extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var max_health
export(int) var current_health

signal health_changed(value)
signal health_maxed
signal health_minned



func change_health(amount):
	current_health = min(max(0, current_health + amount), max_health)
	emit_signal("health_changed", current_health)
