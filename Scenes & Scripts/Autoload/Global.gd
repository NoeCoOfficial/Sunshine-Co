extends Node

# Global script :)


var GLOBAL_coins = 0
var GLOBAL_plasma = 0
var GLOBAL_coinspersecond = 0



var SAVE_PATH = "user://variable.save"




func save_game() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data : Dictionary = {
		
		"GLOBAL_coins" : GLOBAL_coins,
		"GLOBAL_plasma" : GLOBAL_plasma,
		"GLOBAL_coinspersecond" : GLOBAL_coinspersecond,
	}
	
	var jstr = JSON.stringify(data)
	
	file.store_line(jstr)
	
	
func load_game() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if not file:
		print("File doesn't exist.")
		print("Waiting to create new file.")
		return
	if file == null:
		print("File == null.")#
		return
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				GLOBAL_coins = current_line["GLOBAL_coins"]
				GLOBAL_plasma = current_line["GLOBAL_plasma"]
				GLOBAL_coinspersecond = current_line["GLOBAL_coinspersecond"]
				
				
				print("---------------SAVE_DATA---------------")
				print(current_line)
				print("---------------------------------------")

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GLOBAL_coins <= 0:
		GLOBAL_coins = 0
