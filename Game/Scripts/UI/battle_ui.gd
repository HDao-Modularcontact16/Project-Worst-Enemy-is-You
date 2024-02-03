extends CanvasLayer

enum State {ActionPicking = 0, AttackMoves, Done}
@onready var actionPickingUI = $ActionPicking
@onready var attackMovesUI = $AttackMovesDisplay
@onready var battleText = $BattleText/ColorRect/Label
var state

func _ready():
	state = State.ActionPicking
	
func _process(_delta):
	if state == State.ActionPicking:
		actionPickingUI.visible = true
		attackMovesUI.visible = false
		battleText.text = "What does Bunny want to do?"

	if state == State.AttackMoves:
		actionPickingUI.visible = false
		attackMovesUI.visible = true
		
	if state == State.Done:
		actionPickingUI.visible = false
		attackMovesUI.visible = false


func _on_attack_pressed():
	state = State.AttackMoves


func _on_protect_pressed():
	state = State.Done


func _on_item_pressed():
	state = State.Done


func _on_slash_mouse_entered():
	battleText.text = "15hp, 5hp recoil damage, 100% accuracy
	Slashes the enemy with your hoe"

func _on_high_jump_kick_mouse_entered():
	battleText.text = "30hp, 15hp recoil damage if miss, 10hp recoil damge if hit, 90% accuracy
	Jump high up in the air and crash down"


func _on_magic_carrot_shots_mouse_entered():
	battleText.text = "7hp recoil damage, 100% accuracy
	Shoot out 3 magic carrots, each dealing 8hp"
