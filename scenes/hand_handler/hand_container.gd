class_name HandHandler
extends HBoxContainer


var selectedCard:Card
var cards:Array[Card]

func _ready():
	# cards = $"".get_children()
	pass


func swap_cards(index):
	var focusedParent = selectedCard
	var crossedParent = cards[index]
