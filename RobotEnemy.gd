extends Area2D

signal take_damage

onready var health = get_node("Health")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("take_damage", health, "change_health")
	

