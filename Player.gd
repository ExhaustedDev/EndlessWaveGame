extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var speed = 15

onready var animation = get_node("AnimatedSprite")

var move_vec = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	move_vec.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_vec.y  = Input.get_action_strength("down") - Input.get_action_strength("up")
	set_anim(move_vec)
	position += move_vec.normalized() * speed


func set_anim(movement: Vector2):
	var flipped = false
	var anim_string
	if movement == Vector2.ZERO:
		anim_string = "idle"
		animation.play(anim_string)
		return
	else: anim_string = "walk"
	if movement.y > 0: anim_string += "_down"
	elif movement.y < 0: anim_string += "_up"
	if movement.x != 0: anim_string += "_right"
	animation.flip_h = true if movement.x < 0 else false
	animation.play(anim_string)
	return
