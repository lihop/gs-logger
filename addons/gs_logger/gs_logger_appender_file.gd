
extends "./gs_logger_appender.gd"
	
var savefile

func write(level, msg):
	savefile.store_string(msg)
	savefile.store_string("\n")
	
	

func close():
	print("world")
	savefile.close()


func _init():
	savefile = File.new()
	savefile.open("res://project.log", File.WRITE)
	name = "file appender"
	print("** File Appender Initialized **")
	print(" ")
