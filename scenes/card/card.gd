class_name Card

extends Button

signal set_selected_card

var tween_hover: Tween
var tween_return_hand: Tween
var following_mouse: bool = false


func _process(_delta: float) -> void:
	follow_mouse()


func _on_gui_input(event: InputEvent):
	handle_mouse_click(event)
	# Don't compute rotation when moving the card
	if following_mouse:
		return
	if not event is InputEventMouseMotion:
		return


func follow_mouse():
	if not following_mouse:
		return
	var mouse_pos: Vector2 = get_global_mouse_position()
	global_position = mouse_pos - (size / 2.0)


func update_position_slot(slot_position):
	global_position = slot_position - (size / 2.0)


func handle_mouse_click(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	if event.button_index != MOUSE_BUTTON_LEFT:
		return

	if event.is_pressed():
		following_mouse = true
		emit_signal("set_selected_card", self)
	else:
		# drop card
		following_mouse = false
		on_return_hand()


func on_return_hand():
	if tween_return_hand and tween_return_hand.is_running():
		tween_return_hand.kill()
	tween_return_hand = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_return_hand.tween_property(self, "position", Vector2.ZERO, 0.5)


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
