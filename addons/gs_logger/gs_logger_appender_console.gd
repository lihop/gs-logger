
extends "./gs_logger_appender.gd"
	
func write(level, msg):
	print(msg)
	
func _init():
	name = "console appender"
	print("** Console Appender Initialized **")
	print(" ")
