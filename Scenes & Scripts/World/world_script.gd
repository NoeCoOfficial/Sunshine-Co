extends Control


func SmoothMouseENTER(node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "position:y", 472, 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)



func set_center_offset(node):
	var nodesize = node.get_size()
	set_pivot_offset(Vector2(nodesize / 2)) 


# Called when the node enters the scene tree for the first time.
func _ready():
	set_center_offset($MainScreen/MainScreenTabs/FarmsTabBTN)
	set_center_offset($MainScreen/MainScreenTabs/UpgradesTabBTN)
	set_center_offset($MainScreen/MainScreenTabs/SpaceTabBTN)
	set_center_offset($MainScreen/MainScreenTabs/HQTabBTN)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass






















func _on_farms_tab_btn_button_down():
	pass # Replace with function body.


func _on_farms_tab_btn_button_up():
	pass # Replace with function body.


func _on_farms_tab_btn_pressed():
	pass # Replace with function body.


func _on_farms_tab_btn_mouse_entered():
	SmoothMouseENTER($MainScreen/MainScreenTabs/FarmsTabBTN)


func _on_farms_tab_btn_mouse_exited():
	pass # Replace with function body.



func _on_hq_tab_btn_button_up():
	pass # Replace with function body.

func _on_hq_tab_btn_mouse_entered():
	SmoothMouseENTER($MainScreen/MainScreenTabs/HQTabBTN)
