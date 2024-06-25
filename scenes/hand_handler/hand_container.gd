class_name HandHandler
extends HBoxContainer

var selected_card: Card
var cards_slots


func _ready():
	cards_slots = $".".get_children()
	for card_slot in cards_slots:
		var card = card_slot.get_child(0)
		if card is Card:
			card.set_selected_card.connect(select_card)


func select_card(card):
	selected_card = card


func swap_cards(index):
	var focused_parent = selected_card
	var crossed_parent = cards_slots[index]
