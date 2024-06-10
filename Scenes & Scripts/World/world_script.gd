extends Control


func SmoothMouseUP(node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(1, 1), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
	
func SmoothMouseDOWN(node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(0.95, 0.95), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)

func SmoothMouseEXIT(node):
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property(node, "scale", Vector2(1, 1), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
	tween.tween_property(node, "position:y", 462, 0.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func SmoothMouseENTER(node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "position:y", 472, 0.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)


@onready var MAINtabsize = $MainScreen/MainScreenTabs/SpaceTabBTN.get_size()



# Called when the node enters the scene tree for the first time.
func _ready():
	$MainScreen/MainScreenTabs/SpaceTabBTN.set_pivot_offset(MAINtabsize/2)
	$MainScreen/MainScreenTabs/HQTabBTN.set_pivot_offset(MAINtabsize/2)
	$MainScreen/MainScreenTabs/FarmsTabBTN.set_pivot_offset(MAINtabsize/2)
	$MainScreen/MainScreenTabs/UpgradesTabBTN.set_pivot_offset(MAINtabsize/2)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass





















####################################################################
func _on_farms_tab_btn_button_down():
	SmoothMouseDOWN($MainScreen/MainScreenTabs/FarmsTabBTN)


func _on_farms_tab_btn_button_up():
	SmoothMouseUP($MainScreen/MainScreenTabs/FarmsTabBTN)


func _on_farms_tab_btn_pressed():
	pass # Replace with function body.


func _on_farms_tab_btn_mouse_entered():
	SmoothMouseENTER($MainScreen/MainScreenTabs/FarmsTabBTN)


func _on_farms_tab_btn_mouse_exited():
	SmoothMouseEXIT($MainScreen/MainScreenTabs/FarmsTabBTN)
####################################################################

####################################################################
func _on_hq_tab_btn_pressed():
	pass # Replace with function body.


func _on_hq_tab_btn_button_down():
	SmoothMouseDOWN($MainScreen/MainScreenTabs/HQTabBTN)


func _on_hq_tab_btn_mouse_exited():
	SmoothMouseEXIT($MainScreen/MainScreenTabs/HQTabBTN)


func _on_hq_tab_btn_button_up():
	SmoothMouseUP($MainScreen/MainScreenTabs/HQTabBTN)

func _on_hq_tab_btn_mouse_entered():
	SmoothMouseENTER($MainScreen/MainScreenTabs/HQTabBTN)
####################################################################

####################################################################
func _on_upgrades_tab_btn_button_down():
	SmoothMouseDOWN($MainScreen/MainScreenTabs/UpgradesTabBTN)


func _on_upgrades_tab_btn_button_up():
	SmoothMouseUP($MainScreen/MainScreenTabs/UpgradesTabBTN)


func _on_upgrades_tab_btn_pressed():
	pass # Replace with function body.


func _on_upgrades_tab_btn_mouse_entered():
	SmoothMouseENTER($MainScreen/MainScreenTabs/UpgradesTabBTN)


func _on_upgrades_tab_btn_mouse_exited():
	SmoothMouseEXIT($MainScreen/MainScreenTabs/UpgradesTabBTN)
####################################################################

####################################################################
func _on_space_tab_btn_button_down():
	SmoothMouseDOWN($MainScreen/MainScreenTabs/SpaceTabBTN)


func _on_space_tab_btn_button_up():
	SmoothMouseUP($MainScreen/MainScreenTabs/SpaceTabBTN)


func _on_space_tab_btn_pressed():
	pass # Replace with function body.


func _on_space_tab_btn_mouse_entered():
	SmoothMouseENTER($MainScreen/MainScreenTabs/SpaceTabBTN)


func _on_space_tab_btn_mouse_exited():
	SmoothMouseEXIT($MainScreen/MainScreenTabs/SpaceTabBTN)
####################################################################

