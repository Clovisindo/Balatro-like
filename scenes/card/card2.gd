extends Button

@export var following_mouse: bool = false
var card_visual: TextureRect
var card_shadow: Panel

var tween_hover: Tween
var tween_return_hand: Tween
var tween_shake: Tween
var state: bool = false
var dragging: bool = false


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	follow_mouse()


func follow_mouse():
	if not following_mouse:
		return
	var mouse_pos: Vector2 = get_global_mouse_position()
	global_position = mouse_pos - (size / 2.0)


func _on_gui_input(event: InputEvent):
	handle_mouse_click(event)
	#if following_mouse:
	#return
	#if not event is InputEventMouseMotion:
	#return

func handle_mouse_click(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	if event.button_index != MOUSE_BUTTON_LEFT:
		return

	if Input.is_action_pressed("ui_left"):
		#comprobamos si es una pulsacion larga o no
		if Input.is_action_pressed("ui_left"):  #activar dragging
			dragging = true
			print("draggins set a true")
		else:  #change state card
			dragging = false
			print("draggins set a false")

		if dragging:
			#enter hovered
			following_mouse = true

	if Input.is_action_just_released("ui_left") and dragging:
		# drop card exit hovered
		following_mouse = false
		dragging = false
