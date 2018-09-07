
"""

Class: Logger
	A general purpose Logger for use with GDScript.

Copyright:
	Copyright 2018 SpockerDotNet LLC

Remarks:
	The Logger will send a request to an
	Appender to output a log message.

See Also:
	Appender, Level
"""

extends Node

var Appender = preload("res://addons/gs_logger/gs_logger_appender.gd")
var ConsoleAppender = preload("res://addons/gs_logger/gs_logger_appender_console.gd")
var FileAppender = preload("res://addons/gs_logger/gs_logger_appender_file.gd")
var HtmlAppender = preload("res://addons/gs_logger/gs_logger_appender_html.gd")

const CATEGORY_GENERAL = "general"
const CATEGORY_WARN = "warn"
const CATEGORY_ERROR = "error"
const CATEGORY_SYSTEM = "system"
const CATEGORY_INPUT = "input"
const CATEGORY_GUI = "gui"
const CATEGORY_SIGNAL = "signal"
const CATEGORY_BEHAVIOR = "behavior"
const CATEGORY_FSM = "fsm"
const CATEGORY_NETWORK = "network"
const CATEGORY_PHYSICS = "physics"
const CATEGORY_GAME = "game"
const CATEGORY_AUDIO = "audio"
const CATEGORY_CAMERA = "camera"

enum LogLevels \
	{
		LEVEL_ALL = 999,
		LEVEL_TRACE = 600,
		LEVEL_DEBUG = 500,
		LEVEL_INFO = 400,
		LEVEL_WARN = 200,
		LEVEL_ERROR = 100
		LEVEL_FATAL = 001,
		LEVEL_NONE = 000,
	}


enum LogFormats \
	{
		SIMPLE = 20
		DEFAULT = 30
		MORE = 90,
		FULL = 99,
		NONE = -1,
	}
	

#var logger_level = LogLevels.LEVEL_ALL setget _set_logger_level
#var logger_format = LogFormats.FULL

var logger_line = 0

var logger_appenders = []


#	@PUBLIC


func add_appender(appender):
	if appender is Appender:
		logger_appenders.append(appender)
		appender.open()
	
	return appender


func set_logger_level(level):
	for appender in logger_appenders:
		appender.logger_level = level
		

func set_logger_format(format):
	for appender in logger_appenders:
		appender.logger_format = format
	

static func get_level_name(level):
	match level:
		LogLevels.LEVEL_ALL:
			return "ALL"
		LogLevels.LEVEL_TRACE:
			return "TRACE"
		LogLevels.LEVEL_DEBUG:
			return "DEBUG"
		LogLevels.LEVEL_INFO:
			return "INFO"
		LogLevels.LEVEL_WARN:
			return "WARN"
		LogLevels.LEVEL_ERROR:
			return "ERROR"
		LogLevels.LEVEL_FATAL:
			return "FATAL"
		_:
			return "NONE"
	
"""
Function: log
	
	Log a Message at the Info level.
	
Remarks:
	
	This is the Default level of logging.
"""	
func info(message, category="general"):
	_write(LogLevels.LEVEL_INFO, message, category)
	
	
"""
Function: trace

	Log a Message at a Trace level.
"""
func trace(message, category="general"):
	_write(LogLevels.LEVEL_TRACE, message, category)
	

"""
Function: debug

	Log a Message at a Trace level.
"""
func debug(message, category="general"):
	_write(LogLevels.LEVEL_DEBUG, message, category)
	

"""
Function: warn

	Log a Warning Message.
"""
func warn(message, category="warn"):
	_write(LogLevels.LEVEL_WARN, message, category)
	

"""
Function: error

	Log an Error Message.
"""	
func error(message, category="error"):
	_write(LogLevels.LEVEL_ERROR, message, category)
	

"""
Function: fatal

	Log an Error Message.
"""	
func fatal(message, category="error"):
	_write(LogLevels.LEVEL_FATAL, message, category)
	
#	PRIVATE

func _get_formatted_date(date):
	return "%02d/%02d/%02d %02d:%02d:%02d" % [date.month, date.day, date.year, date.hour, date.minute, date.second]


func _get_format_name(format):
	match format:
		LogFormats.FULL:
			return "FULL"
		LogFormats.MORE:
			return "MORE"
		LogFormats.DEFAULT:
			return "DEFAULT"
		LogFormats.SIMPLE:
			return "SIMPLE"
		_:
			return "NONE"


func _get_level_name(level):
	match level:
		LogLevels.LEVEL_ALL:
			return "ALL"
		LogLevels.LEVEL_TRACE:
			return "TRACE"
		LogLevels.LEVEL_DEBUG:
			return "DEBUG"
		LogLevels.LEVEL_INFO:
			return "INFO"
		LogLevels.LEVEL_WARN:
			return "WARN"
		LogLevels.LEVEL_ERROR:
			return "ERROR"
		LogLevels.LEVEL_FATAL:
			return "FATAL"
		_:
			return "NONE"



func _get_format_by_name(format_name):
	match format_name.to_lower():
		"full":
			return LogFormats.FULL
		"more":
			return LogFormats.MORE
		"default":
			return LogFormats.DEFAULT
		"simple":
			return LogFormats.SIMPLE
		_:
			return LogFormats.NONE
			
			
func _write(level, message = "", category = CATEGORY_GENERAL):
	
	if logger_appenders.size() <= 0:
		logger_appenders.append(ConsoleAppender.new())
		
	for appender in logger_appenders:
		
#		print("msg level:%d, logger_level:%d" % [level, appender.logger_level])
		
		if level <= appender.logger_level:
			
			logger_line += 1
			
			var msg = ""
			
			match appender.logger_format:
				LogFormats.FULL:
					msg = "%s %-8s %-8s %-8d %s" % [_get_formatted_date(OS.get_datetime()), category.to_upper(), _get_level_name(level), logger_line, message]
				LogFormats.MORE:
					msg = "%-8s %-8s %-8d %s" % [_get_formatted_date(OS.get_datetime()), category.to_upper(), _get_level_name(level), logger_line, message]
				LogFormats.DEFAULT:
					msg = "%-10s %-8d %s" % [_get_level_name(level), logger_line, message]
				LogFormats.SIMPLE:
					msg = "%-8d %s" % [logger_line, message]
				_:
					msg = "%s" % [message]
					
			appender.write(level, msg)
		
	
#	@INTERNAL

func _exit_tree():
	print("hello")
	for appender in logger_appenders:
		appender.close()

	logger_appenders.clear()	

func _init():
	print(" ")
	print("Godot Stuff Logger")	
	print("Copyright 2018, SpockerDotNet LLC")
	print("Version 0.1")
	print(" ")
	
#	if ProjectSettings.has_setting("logger/level"):
#		logger_level = _get_level_by_name(ProjectSettings.get_setting("logger/level"))
#
#	if ProjectSettings.has_setting("logger/format"):
#		logger_format = _get_format_by_name(ProjectSettings.get_setting("logger/format"))
#
#	print("Logging Level is %s" % [_get_level_name(logger_level)])
#	print("Logging Format is %s" % [_get_format_name(logger_format)])
#	print(" ")
		