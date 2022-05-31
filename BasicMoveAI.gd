extends Node

var target = null

var speed = 5
var is_active
# Called when the node enters the scene tree for the first time.
func _ready():
	is_active = true

func _process(delta):
	if is_active and get_dist_to(target) > 2:
		var dir = get_dir_to(target)
		var movement = Vector2(dir.x * speed, dir.y * speed)
		get_parent().position += movement

func get_dir_to(target)-> Vector2:
	var dir = get_parent().position.direction_to(target.position)
	return dir

func get_dist_to(target):
	return get_parent().position.distance_squared_to(target.position)

func set_target(object):
	target = object

func set_active(value: bool):
	is_active = value
