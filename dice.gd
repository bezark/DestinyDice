extends PanelContainer

class_name Dice
@onready var text: Label = $MarginContainer/Text
@onready var sigil: Sigil

@export var faces : Array[Face]

var rolling = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	roll()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rolling:
		roll()


func roll():
	var result = faces.pick_random()
	if result.text:
		text.text = result.text
	sigil = result.sigil
	$MarginContainer/Sigil.texture = sigil.icon
