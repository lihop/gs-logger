"""
Class: Appender
	Responsible for Delivering a Log Event to its Destination.
"""

extends Reference

var logger = preload("./logger.gd")

var layout = Logger.PatternLayout.new()
var logger_level = logger.LogLevels.LEVEL_ALL setget _set_logger_level
var logger_format = logger.LogFormats.DEFAULT

var name = "appender"
var is_open = false


func _set_logger_level(level):
	logger_level = level


"""
Function: start
	Start this Appender
"""	
func start():
	pass

"""
Function: stop
	Stop this Appender
"""
func stop():
	pass
	
"""
Function: append
	Logs an Event in whatever logic this Appender has
"""	
func append(message):
	pass
	
	
"""
Function: append_raw
	Send Raw Text to the Appender
"""
func append_raw(text):
	pass
	
	
func _init():
	pass
