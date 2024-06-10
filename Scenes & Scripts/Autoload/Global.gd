extends Node

# Global script :)

var save_path_local = "user://variable.save"



var save_data = {
	
	# Auth (Not in use right now)
	"USERNAME": null,
	"PASSWORD": null,
	
	
	
	# Values
	"COINS":0,
	"COINSPERSECOND":0,
	"PLASMA":0,
}

func save_data_local():
	var file = FileAccess.open(save_path_local, FileAccess.WRITE)
	file.store_var(save_data)

func load_data_local():
	if FileAccess.file_exists(save_path_local):
		var file = FileAccess.open(save_path_local, FileAccess.READ)
		save_data = file.get_var(save_data)
	else:
		print("Data did not load because the path doesn't exist.")
		print("This is probably because you opened the game for the first time.")
		print("Creating save path...")



# Called when the node enters the scene tree for the first time.
func _ready():
	load_data_local()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
