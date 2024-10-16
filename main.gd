extends Control

@onready var dice_box: HBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/DiceBox
@onready var destiny: Label = $PanelContainer/MarginContainer/VBoxContainer/Destiny

# Called when the node enters the scene tree for the first time.

	

func roll_dice():
	for dice in dice_box.get_children():
		dice.rolling = true
	
	
func tabulate_results():
	var decree = []
	var sigils = []
	for dice in dice_box.get_children():
		dice.rolling = false
		decree.append(dice.text.text)
		sigils.append(dice.sigil)
	destiny.text = " ".join(decree)
	if all_items_same(sigils):
		miracle(sigils[0])
	

func miracle(sigil : Sigil):
	$MiracleLayer/Miracle/PanelContainer/MarginContainer/VBoxContainer/Title.text = sigil.miracle_title
	$MiracleLayer/Miracle/PanelContainer/MarginContainer/VBoxContainer/TextureRect.texture = sigil.icon
	$MiracleLayer/Miracle/PanelContainer/MarginContainer/VBoxContainer/Decree.text = sigil.miracle_description
	$MiracleLayer.show()
	pass

func all_items_same(arr: Array) -> bool:
	return arr.all(func(item): return item == arr[0])

func _on_button_button_down() -> void:
	$AnimationPlayer.play("RollDice")


func _on_miracle_button_button_down() -> void:
	$MiracleLayer.hide()
	pass # Replace with function body.
