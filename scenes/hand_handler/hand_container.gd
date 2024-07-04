class_name HandHandler
extends HBoxContainer

var selected_card: Card
var cards_slots: Array[Node]
var cards_array: Array

var is_crossing: bool = false


func _ready() -> void:
	cards_slots = $".".get_children()
	for card_slot in cards_slots:
		var card = card_slot.get_node("Card")
		if card is Card:
			cards_array.append(card)
			card.set_selected_card.connect(select_card)


func _process(_delta:float) -> void:
	if selected_card == null:
		return

	if is_crossing:
		return

	for i in cards_slots.size():
		if selected_card.position.x > cards_slots[i].position.x:
			if (parent_index(selected_card.get_parent()) < parent_index(cards_slots[i])):
				swap_cards(i)
				break
		if selected_card.position.x < cards_slots[i].position.x:
			if (parent_index(selected_card.get_parent()) > parent_index(cards_slots[i])):
				swap_cards(i)
				break


func select_card(card):
	selected_card = card

func parent_index(card_slot):
	var path:String = card_slot.get_path()
	if ( path.contains("slot")):
		return card_slot.get_index()
	# else:
	# 	return 0


func swap_cards(index):
	is_crossing = true

	#cogemos los nodos de las cartas afectadas para moverlas entre los huecos
	var selected_parent: Control = selected_card.get_parent()
	var crossed_parent = cards_slots[index]
	var crossed_card: Card = cards_slots[index].get_child(0)

	#movemos la carta afectada de hueco
	crossed_card.reparent(selected_parent,false)

	#funciona esto de coger la posicion?
	# crossed_card.update_position_slot(crossed_parent.position)

	#eliminamos en el original de selected y añadimos en su nuevo hueco
	selected_card.reparent(crossed_parent,false)

	is_crossing = false
