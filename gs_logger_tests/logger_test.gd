extends Node


#var ConsoleAppender = preload("res://addons/gs_logger/gs_logger_appender_console.gd")
#var FileAppender = preload("res://addons/gs_logger/gs_logger_appender_file.gd")


func _try_logging():
	Logger.finest("- finest")
	Logger.finer("- finer")
	Logger.fine("- fine")
	Logger.trace("- trace")
	Logger.info("- info")
	Logger.warn("- warning")
	Logger.error("- error")
	Logger.severe("- severe")	


func _ready():
	
	var h0 = Logger.add_appender(Logger.HtmlAppender.new())
	h0.logger_level = Logger.LogLevels.LEVEL_FINEST
	h0.logger_format = Logger.LogFormats.FULL
	_try_logging()
	
	var f0 = Logger.add_appender(Logger.FileAppender.new())
	f0.logger_level = Logger.LogLevels.LEVEL_FINEST
	f0.logger_format = Logger.LogFormats.FULL
	_try_logging()
	
#	var c0 = Logger.add_appender(Logger.ConsoleAppender.new())
#	c0.logger_level = Logger.LogLevels.LEVEL_SEVERE
#	c0.logger_format = Logger.LogFormats.FULL
#
#	var ca = Logger.add_appender(Logger.ConsoleAppender.new())
#
#	ca.logger_level = Logger.LEVEL_ALL
#	_try_logging()
#	ca.logger_level = Logger.LEVEL_FINEST
#	_try_logging()
#	ca.logger_level = Logger.LEVEL_FINER
#	_try_logging()
#	ca.logger_level = Logger.LEVEL_TRACE
#	_try_logging()
#	ca.logger_level = Logger.LEVEL_INFO
#	_try_logging()
#	ca.logger_level = Logger.LEVEL_WARN
#	_try_logging()
#	ca.logger_level = Logger.LEVEL_ERROR
#	_try_logging()
#	ca.logger_level = Logger.LEVEL_SEVERE
#	_try_logging()
#
#	Logger.set_logger_level(Logger.LogLevels.LEVEL_TRACE)
#	_try_logging()
