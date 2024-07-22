class_name HandHandler
extends HBoxContainer

var selected_card: Card
var cards_slots: Array[Node]

var is_crossing: bool = false


func _ready() -> void:
	cards_slots = $".".get_children()
	for card in cards_slots:
		if card is Card:
			card.c_logic.set_selected_card.connect(set_selected_card)
			card.c_logic.clean_selected_card.connect(clear_selected_card)


func _process(_delta: float) -> void:
	if selected_card == null:
		return
	if is_crossing:
		return

	for i in cards_slots.size():
		if selected_card.position.x > cards_slots[i].position.x:
			if parent_index(selected_card) < parent_index(cards_slots[i]):
				swap_cards(i)
				break
		if selected_card.position.x < cards_slots[i].position.x:
			if parent_index(selected_card) > parent_index(cards_slots[i]):
				swap_cards(i)
				break


func set_selected_card(card):
	selected_card = card


func clear_selected_card():
	selected_card = null


func parent_index(card_slot):
	if card_slot is Card:
		return card_slot.get_index()


func swap_cards(index):
	is_crossing = true

	var origin_position = cards_slots[index].position
	self.move_child(selected_card, index)
	selected_card.c_logic.update_new_position(origin_position)

	is_crossing = false
	
	cards_slots = $".".get_children()
