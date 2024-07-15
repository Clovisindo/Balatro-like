class_name Card

extends Button

signal set_selected_card
signal clean_selected_card

@export var following_mouse: bool = false

var tween_hover: Tween
var tween_return_hand: Tween
var new_position: Vector2
var state:bool = false
var hold_counter : float = 0.0
var hold_time : float = 0.3
var dragging : bool = false

func _process(delta: float) -> void:
	follow_mouse()
	if Input.is_action_pressed("ui_left"):
		hold_counter += delta
		#dragging = true
	else:
		hold_counter = 0.0
		#dragging = false
	if dragging and hold_counter >= hold_time:
		dragging = false
		following_mouse = true
		self.update_new_position(self.position)
		emit_signal("set_selected_card", self)



func follow_mouse():
	if not following_mouse:
		return
	var mouse_pos: Vector2 = get_global_mouse_position()
	global_position = mouse_pos - (size / 2.0)


func _on_gui_input(event: InputEvent):
	handle_mouse_click(event)
	if following_mouse:
		return
	if not event is InputEventMouseMotion:
		return


func handle_mouse_click(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	if event.button_index != MOUSE_BUTTON_LEFT:
		return
	
	if Input.is_action_just_pressed("ui_left"):
		state = !state
		on_change_state(state)
		dragging = true
	#if Input.is_action_pressed("ui_left") and hold_counter >= hold_time:
		#
		#following_mouse = true
		#emit_signal("set_selected_card", self)
	elif Input.is_action_just_released("ui_left") and hold_counter >= hold_time:
		#dragging = false
		# drop card
		following_mouse = false
		emit_signal("clean_selected_card")
		on_return_hand()


func update_new_position(_position):
	new_position = _position


func on_return_hand():
	if tween_return_hand and tween_return_hand.is_running():
		tween_return_hand.kill()
	tween_return_hand = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_return_hand.tween_property(self, "position", new_position, 0.5)


func _on_mouse_exited():
	pass
	# # Reset scale
	# if tween_hover and tween_hover.is_running():
	# 	tween_hover.kill()
	# tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	# tween_hover.tween_property(self, "scale", Vector2.ONE, 0.55)


func _on_mouse_entered():
	pass
	# if tween_hover and tween_hover.is_running():
	# 	tween_hover.kill()
	# tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	# tween_hover.tween_property(self, "scale", Vector2(1.2, 1.2), 0.5)


func on_change_state(state_bool):
	if state_bool:
		if tween_hover and tween_hover.is_running():
			tween_hover.kill()
		tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
		tween_hover.tween_property(self, "scale", Vector2(1.2, 1.2), 0.5)
	else:
		if tween_hover and tween_hover.is_running():
			tween_hover.kill()
		tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
		tween_hover.tween_property(self, "scale", Vector2.ONE, 0.55)
