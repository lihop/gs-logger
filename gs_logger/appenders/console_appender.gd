
"""
Class: ConsoleAppender

		
"""

extends "../appender.gd"
	
	
func append(message):
	print(layout.build(message))
	
	"""
	var msg = ""
	
	match format:
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
	"""
				
	
	
func append_raw(text):
	print(text)
	
	
func _init():
	name = "console appender"
	print("** Console Appender Initialized **")
	print(" ")
