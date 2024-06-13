#/**********************************ALERT***********************************/
#/*          "res://Scenes/Main Scenes/WORLD/WORLD_SCRIPT.gd"              */
#/**************************************************************************/
#/*                         This file is a part of:                        */
#/*                             SUNSHINE CO.                               */
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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
func Initiate():
	$GreyOverlay.set_visible(false)
	$PauseInterface.set_visible(false)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
func set_center_offset(node : Node):
	var node_size = node.get_size()
	node.set_pivot_offset(Vector2(node_size/2))
func ShowGreyOverlay():
	$GreyOverlay.set_self_modulate(Color(1, 1, 1, 0))
	var tween = get_tree().create_tween()
	tween.tween_property($GreyOverlay, "visible", true, 0)
	tween.tween_property($GreyOverlay, "self_modulate", Color(1, 1, 1, 1), 0.6)
func HideGreyOverlay():
	var tween = get_tree().create_tween()
	tween.tween_property($GreyOverlay, "self_modulate", Color(1, 1, 1, 0), 0.6)
	tween.tween_property($GreyOverlay, "visible", false, 0)
func SmoothScreenONOFF(node : Node, overlay : bool, transTYPE : String, transTIME : float, ONorOFF : String, CenterOffset : bool):
	
	node.set_visible(true) # If the node is invisible the animation won't show, so I set it to be visible.
	
	
	if overlay == true:
		if ONorOFF == "ON":
			$GreyOverlay.set_self_modulate(Color(1, 1, 1, 0))
			var tween2 = get_tree().create_tween()
			tween2.tween_property($GreyOverlay, "visible", true, 0)
			tween2.tween_property($GreyOverlay, "self_modulate", Color(1, 1, 1, 1), transTIME)
		else:
			var tween = get_tree().create_tween()
			tween.tween_property($GreyOverlay, "self_modulate", Color(1, 1, 1, 0), 0.6)
			tween.tween_property($GreyOverlay, "visible", false, 0)
	else:
		pass
	
	if CenterOffset == true:
		pass
	else:
		var node_size = node.get_size()
		node.set_pivot_offset(Vector2(node_size/2))

	if ONorOFF == "ON":
		if transTYPE == "TOP":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, 0), transTIME).from(Vector2(0, -648)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "BOTTOM":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, 0), transTIME).from(Vector2(0, 648)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "LEFT":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, 0), transTIME).from(Vector2(-1152, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "RIGHT":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, 0), transTIME).from(Vector2(1152, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "ZOOM":
			var tween = get_tree().create_tween().set_parallel()
			tween.tween_property(node, "position", Vector2(0, 0), 0)
			tween.tween_property(node, "scale", Vector2(1, 1), transTIME).from(Vector2(0, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

#########################################################
#########################################################
	elif ONorOFF == "OFF":
		if transTYPE == "TOP":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, -648), transTIME).from(Vector2(0, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "BOTTOM":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(0, 648), transTIME).from(Vector2(0, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "LEFT":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(-1152, 0), transTIME).from(Vector2(0, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "RIGHT":
			var tween = get_tree().create_tween()
			tween.tween_property(node, "position", Vector2(1152, 0), transTIME).from(Vector2(0, 0)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		elif transTYPE == "ZOOM":
			var tween = get_tree().create_tween().set_parallel()
			tween.tween_property(node, "position", Vector2(0, 0), 0)
			tween.tween_property(node, "scale", Vector2(0, 0), transTIME).from(Vector2(1, 1)).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
#########################################################
#########################################################
	else:
		print("Only accepting 'ON' or 'OFF' for ONorOFF parameter.")
		print("Please pass a valid parameter.")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
func SmoothMouseUP(node : Node):
	var tween = get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(1, 1), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
func SmoothMouseDOWN(node : Node):
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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
func _input(_event):
	if Input.is_action_pressed("DebugInterface"):
		if $"Debug Interface/DebugControl".is_visible() == true:
			$"Debug Interface/DebugControl".set_visible(false)
		else:
			$"Debug Interface/DebugControl".set_visible(true)
# Called when the node enters the scene tree for the first time.
func _ready():
	Initiate()
	$"Debug Interface/DebugControl".set_visible(false)
	set_center_offset($MainScreen/Buttons/PauseBTN)
	$MainScreen/MainScreenTabs/SpaceTabBTN.set_pivot_offset(MAINtabsize/2)
	$MainScreen/MainScreenTabs/HQTabBTN.set_pivot_offset(MAINtabsize/2)
	$MainScreen/MainScreenTabs/FarmsTabBTN.set_pivot_offset(MAINtabsize/2)
	$MainScreen/MainScreenTabs/UpgradesTabBTN.set_pivot_offset(MAINtabsize/2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$MainScreen/Display/COINCOUNT.text = "COINS: " + format_number(Global.GLOBAL_coins)
	$MainScreen/Display/PLASMACOUNT.text = "PLASMA: " + format_number(Global.GLOBAL_plasma)
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
	SmoothScreenONOFF($Upgrades/UpgradesControl, false, "TOP", 0.6, "ON", false)

func _on_back_button_pressed():
	SmoothScreenONOFF($Upgrades/UpgradesControl, false, "BOTTOM", 0.6, "OFF", false)
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
















































func _on_coin_debug_pressed():
	Global.GLOBAL_coins += 1
	Global.save_game()
	print("Added 1 coin to global value.")
	print("Coins: " + str(Global.GLOBAL_coins))
	





func _on_quit_button_pressed():
	get_tree().quit()


func _on_pause_btn_pressed():
	SmoothScreenONOFF($PauseInterface, true, "ZOOM", 0.6, "ON", false)


func _on_pause_return_btn_pressed():
	SmoothScreenONOFF($PauseInterface, true, "ZOOM", 0.6, "OFF", false)
