class_name CardVisual

extends  TextureRect

@export var card_logic:NodePath
var card : CardLogic


func _ready() -> void:
	card = get_node(card_logic)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	follow_smooth(delta)
	


func follow_smooth(delta):
	var verticalOffset
	if !card.dragging:
		verticalOffset = (Vector2.UP * 0)
	else:
		verticalOffset = (Vector2.UP * 5)
		
	self.position = self.position.lerp(card.position ,0.1)
	
	#Vector3 verticalOffset = (Vector3.up * (parentCard.isDragging ? 0 : curveYOffset));
	#transform.position = Vector3.Lerp(transform.position, cardTransform.position + verticalOffset, followSpeed * Time.deltaTime);
