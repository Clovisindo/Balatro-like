class_name Card

extends Control

var c_logic:CardLogic
var c_visual:CardVisual
var new_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	c_logic = get_node("CardLogic")
	c_visual = get_node("CardVisual")
	#c_visual._init(c_logic)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#global_position = c_logic.position


func update_new_position(_position):
	new_position = _position
