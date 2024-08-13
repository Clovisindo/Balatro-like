class_name Card

extends Button

signal set_selected_card
signal clean_selected_card

@export var following_mouse: bool = false
var card_visual: TextureRect
var card_shadow: Panel

var tween_hover: Tween
var tween_return_hand: Tween
var new_position: Vector2
var state: bool = false
var dragging: bool = false

#const
const select_state_pos_y: int = -50


func _ready() -> void:
	card_visual = get_node("Node/CardVisual")
	card_shadow = get_node("Node/CardVisual/Shadow")


func _process(delta: float) -> void:
	follow_mouse()
	follow_card_visual()


func _physics_process(delta: float) -> void:
	follow_card_visual_move(delta)


func follow_mouse():
	if not following_mouse:
		return
	var mouse_pos: Vector2 = get_global_mouse_position()
	global_position = mouse_pos - (size / 2.0)


func follow_card_visual():
	card_visual.global_position = lerp(card_visual.global_position, self.global_position, 0.1)


func follow_card_visual_move(delta):
	var mouse_pos: Vector2 = get_local_mouse_position()
	if dragging:
		var lerp_val_x: float = clamp(remap(mouse_pos.x, 0.0, card_visual.size.x, 0, 1), 0, 1)
		card_visual.rotation = lerp_angle(deg_to_rad(-60), deg_to_rad(60), lerp_val_x)
	else:
		card_visual.rotation = lerp(card_visual.rotation, 0.0, delta)


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
		await get_tree().create_timer(0.2).timeout
		if Input.is_action_pressed("ui_left"):  #activar dragging
			dragging = true
			print("draggins set a true")
		else:  #change state card
			dragging = false
			print("draggins set a false")

		if dragging:
			#enter hovered
			on_enter_hovered()
			emit_signal("set_selected_card", self)
		else:  #change state card
			state = !state
			on_change_state(state)

	if Input.is_action_just_released("ui_left") and dragging:
		# drop card exit hovered
		on_exit_hovered()
		emit_signal("clean_selected_card")
		on_return_hand()


func update_new_position(_position):
	new_position = _position


func on_return_hand():
	do_tween_return_hand()


func on_exit_hovered():
	following_mouse = false
	card_shadow.visible = false
	dragging = false
	do_tween_hover_exit()
	card_visual.z_index = 0


func on_enter_hovered():
	following_mouse = true
	card_shadow.visible = true
	card_visual.z_index = 1
	do_tween_hover_enter()
	self.update_new_position(self.position)


func on_change_state(state_bool):
	if state_bool:
		if tween_hover and tween_hover.is_running():
			tween_hover.kill()
		tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
		tween_hover.tween_property(self, "position:y", select_state_pos_y, 0.5)
	else:
		if tween_hover and tween_hover.is_running():
			tween_hover.kill()
		tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
		tween_hover.tween_property(self, "position:y", Vector2.ONE.y, 0.5)


func do_tween_return_hand():
	if tween_return_hand and tween_return_hand.is_running():
		tween_return_hand.kill()
	tween_return_hand = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	if state:
		tween_return_hand.tween_property(self, "position:y", new_position.y + select_state_pos_y, 0.5)
		tween_return_hand.parallel().tween_property(self, "position:x", new_position.x, 0.5)
	else:
		tween_return_hand.tween_property(self, "position", new_position, 0.5)


func do_tween_hover_enter():
	if tween_hover and tween_hover.is_running():
		tween_hover.kill()
	tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_hover.tween_property(card_visual, "scale", Vector2(1.2, 1.2), 0.5)


func do_tween_hover_exit():
	if tween_hover and tween_hover.is_running():
		tween_hover.kill()
	tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_hover.tween_property(card_visual, "scale", Vector2.ONE, 0.55)
