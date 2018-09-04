
var logger = preload("./gs_logger.gd")

var logger_level = logger.LogLevels.LEVEL_SEVERE setget _set_logger_level
var logger_format = logger.LogFormats.DEFAULT
var name
var is_open = false


func _set_logger_level(level):
	logger_level = level
	write(logger.LogLevels.LEVEL_INFO, "** setting %s logging level to %s" % [name, logger.get_level_name(logger_level)])

	
func open():
	pass

	
func close():
	pass
	
	
func write(level, msg):
	pass
	
	
func _init():
	name = "appender"
#	yield(Logger.get_tree(), "idle_frame")
		