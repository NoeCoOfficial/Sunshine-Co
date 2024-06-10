#/**********************************ALERT***********************************/
#/*          "res://Scenes/Main Scenes/WORLD/WORLD_SCRIPT.gd"              */
#/**************************************************************************/
#/*                         This file is part of:                          */
#/*                             SUNSHINE CO.                               */
#/*                        https://noeco.games                             */
#/**************************************************************************/
#/* Copyright (c) 2024-present Noe Co. contributors (see AUTHORS.txt).     */
#/* Copyright (c) 2024-present Sebastian Suciu.                            */
#/*                                                                        */
#/* Permission is hereby granted, free of charge, to any person obtaining  */
#/* a copy of this software and associated documentation files (the        */
#/* "Software"), to deal in the Software without restriction, including    */
#/* without limitation the rights to use, copy, modify, merge, publish,    */
#/* distribute, sublicense, and/or sell copies of the Software, and to     */
#/* permit persons to whom the Software is furnished to do so, subject to  */
#/* the following conditions:                                              */
#/*                                                                        */
#/* The above copyright notice and this permission notice shall be         */
#/* included in all copies or substantial portions of the Software.        */
#/*                                                                        */
#/* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,        */
#/* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF     */
#/* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. */
#/* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY   */
#/* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,   */
#/* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE      */
#/* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                 */
#/**************************************************************************/


'''

THIS IS THE SCRIPT FOR THE WORLD SCENE.
ANY CHANGES TO THIS SCRIPT WILL AFFECT THE WHOLE GAME.
DO NOT CHANGE ANYTHING HERE UNLESS YOU KNOW WHAT YOU ARE DOING!

'''

extends Control # Inheritance



@onready var MAINtabsize = $MainScreen/MainScreenTabs/SpaceTabBTN.get_size()



func format_number(n: int) -> String:
	if n >= 1_000:

		var i:float = snapped(float(n)/1_000, .01)
		return str(i).replace(",", ".") + "k"
	elif n >= 1_000_000:

		var i:float = snapped(float(n)/1_000_000, .01)
		return str(i).replace(",", ".") + "M"
	elif n >= 1_000_000_000:

		var i:float = snapped(float(n)/1_000_000_000, .01)
		return str(i).replace(",", ".") + "B"
	elif n >= 1_000_000_000_000:

		var i:float = snapped(float(n)/1_000_000_000_000, .01)
		return str(i).replace(",", ".") + "T"
	elif n >= 1_000_000_000_000_000:

		var i:float = snapped(float(n)/1_000_000_000_000_000, .01)
		return str(i).replace(",", ".") + "aa"
	else:
		# ran otherwise
		return str(n)





func SmoothMouseUP(node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(1, 1), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
	
func SmoothMouseDOWN(node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(0.95, 0.95), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)

func SmoothMouseEXIT(tab : bool, node):
	if tab == true:
		var tween = get_tree().create_tween().set_parallel()
		tween.tween_property(node, "scale", Vector2(1, 1), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
		tween.tween_property(node, "position:y", 462, 0.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	else:
		var tween2 = get_tree().create_tween().set_parallel()
		tween2.tween_property(node, "scale", Vector2(1, 1), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)

func SmoothMouseENTER(tab : bool, node):
	if tab == true:
		var tween = get_tree().create_tween()
		tween.tween_property(node, "position:y", 472, 0.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	else:
		var tween = get_tree().create_tween()
		tween.tween_property(node, "scale", Vector2(1.1, 1.1), 0.7).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)



func set_center_offset(node):
	var node_size = node.get_size()
	node.set_pivot_offset(Vector2(node_size/2))


func _input(_event):
	if Input.is_action_pressed("DebugInterface"):
		if $"Debug Interface/DebugControl".is_visible() == true:
			$"Debug Interface/DebugControl".set_visible(false)
		else:
			$"Debug Interface/DebugControl".set_visible(true)

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Debug Interface/DebugControl".set_visible(false)
	set_center_offset($MainScreen/Buttons/PauseBTN)
	$MainScreen/MainScreenTabs/SpaceTabBTN.set_pivot_offset(MAINtabsize/2)
	$MainScreen/MainScreenTabs/HQTabBTN.set_pivot_offset(MAINtabsize/2)
	$MainScreen/MainScreenTabs/FarmsTabBTN.set_pivot_offset(MAINtabsize/2)
	$MainScreen/MainScreenTabs/UpgradesTabBTN.set_pivot_offset(MAINtabsize/2)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$MainScreen/Display/COINCOUNT.text = "COINS: " + format_number(Global.save_data["COINS"])
	$MainScreen/Display/PLASMACOUNT.text = "PLASMA: " + format_number(Global.save_data["PLASMA"])



####################################################################
func _on_farms_tab_btn_button_down():
	SmoothMouseDOWN($MainScreen/MainScreenTabs/FarmsTabBTN)


func _on_farms_tab_btn_button_up():
	SmoothMouseUP($MainScreen/MainScreenTabs/FarmsTabBTN)


func _on_farms_tab_btn_pressed():
	pass # Replace with function body.


func _on_farms_tab_btn_mouse_entered():
	SmoothMouseENTER(true, $MainScreen/MainScreenTabs/FarmsTabBTN)


func _on_farms_tab_btn_mouse_exited():
	SmoothMouseEXIT(true, $MainScreen/MainScreenTabs/FarmsTabBTN)
####################################################################

####################################################################
func _on_hq_tab_btn_pressed():
	pass # Replace with function body.


func _on_hq_tab_btn_button_down():
	SmoothMouseDOWN($MainScreen/MainScreenTabs/HQTabBTN)


func _on_hq_tab_btn_mouse_exited():
	SmoothMouseEXIT(true, $MainScreen/MainScreenTabs/HQTabBTN)


func _on_hq_tab_btn_button_up():
	SmoothMouseUP($MainScreen/MainScreenTabs/HQTabBTN)

func _on_hq_tab_btn_mouse_entered():
	SmoothMouseENTER(true, $MainScreen/MainScreenTabs/HQTabBTN)
####################################################################

####################################################################
func _on_upgrades_tab_btn_button_down():
	SmoothMouseDOWN($MainScreen/MainScreenTabs/UpgradesTabBTN)


func _on_upgrades_tab_btn_button_up():
	SmoothMouseUP($MainScreen/MainScreenTabs/UpgradesTabBTN)


func _on_upgrades_tab_btn_pressed():
	pass # Replace with function body.


func _on_upgrades_tab_btn_mouse_entered():
	SmoothMouseENTER(true, $MainScreen/MainScreenTabs/UpgradesTabBTN)


func _on_upgrades_tab_btn_mouse_exited():
	SmoothMouseEXIT(true, $MainScreen/MainScreenTabs/UpgradesTabBTN)
####################################################################

####################################################################
func _on_space_tab_btn_button_down():
	SmoothMouseDOWN($MainScreen/MainScreenTabs/SpaceTabBTN)


func _on_space_tab_btn_button_up():
	SmoothMouseUP($MainScreen/MainScreenTabs/SpaceTabBTN)


func _on_space_tab_btn_pressed():
	pass # Replace with function body.


func _on_space_tab_btn_mouse_entered():
	SmoothMouseENTER(true, $MainScreen/MainScreenTabs/SpaceTabBTN)


func _on_space_tab_btn_mouse_exited():
	SmoothMouseEXIT(true, $MainScreen/MainScreenTabs/SpaceTabBTN)
####################################################################



func _on_pause_btn_mouse_entered():
	SmoothMouseENTER(false, $MainScreen/Buttons/PauseBTN)


func _on_pause_btn_mouse_exited():
	SmoothMouseEXIT(false, $MainScreen/Buttons/PauseBTN)
