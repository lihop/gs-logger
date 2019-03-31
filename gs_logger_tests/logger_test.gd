extends Node

#var ConsoleAppender = preload("res://addons/gs_logger/gs_logger_appender_console.gd")
#var FileAppender = preload("res://addons/gs_logger/gs_logger_appender_file.gd")


func _try_logging():
	Logger.trace("- trace")
	Logger.trace("- debug")
	Logger.info("- info")
	Logger.warn("- warning")
	Logger.error("- error")
	Logger.fatal("- fatal")


func _ready():

	var h0 = Logger.add_appender(Logger.FileAppender.new("res://.test/new.html"))
	h0.layout = Logger.HtmlLayout.new()
#	h0.logger_level = Logger.LogLevels.LEVEL_DEBUG
#	h0.logger_format = Logger.LogFormats.FULL
	_try_logging()

	return

	var f0 = Logger.add_appender(Logger.FileAppender.new())
	f0.logger_level = Logger.LogLevels.LEVEL_DEBUG
	f0.logger_format = Logger.LogFormats.FULL
	_try_logging()

	var c0 = Logger.add_appender(Logger.ConsoleAppender.new())
	c0.logger_level = Logger.LogLevels.LEVEL_FATAL
	c0.logger_format = Logger.LogFormats.FULL


	var ca = Logger.add_appender(Logger.ConsoleAppender.new())

	ca.logger_level = Logger.LEVEL_ALL
	_try_logging()
	ca.logger_level = Logger.LEVEL_TRACE
	_try_logging()
	ca.logger_level = Logger.LEVEL_DEBUG
	_try_logging()
	ca.logger_level = Logger.LEVEL_INFO
	_try_logging()
	ca.logger_level = Logger.LEVEL_WARN
	_try_logging()
	ca.logger_level = Logger.LEVEL_ERROR
	_try_logging()
	ca.logger_level = Logger.LEVEL_FATAL
	_try_logging()

	Logger.set_logger_level(Logger.LogLevels.LEVEL_TRACE)
	_try_logging()
