extends Node

# Global script :)


var GLOBAL_coins = 0
var GLOBAL_plasma = 0
var GLOBAL_coinspersecond = 0



var SAVE_PATH = "user://variable.save"




func save_data_local() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data : Dictionary = {
		
		"GLOBAL_coins" : GLOBAL_coins,
		"GLOBAL_plasma" : GLOBAL_plasma,
		"GLOBAL_coinspersecond" : GLOBAL_coinspersecond,
	}
	
	var jstr = JSON.stringify(data)
	
	file.store_line(jstr)
	
	
	
	
	
func load_data_local() -> void:
	pass



# Called when the node enters the scene tree for the first time.
func _ready():
	load_data_local()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GLOBAL_coins <= 0:
		GLOBAL_coins = 0
