#
#Class: PatternLayout
#	A Flexible Layout with a Pattern String.
#

class_name PatternLayout
extends Layout

func build(message: Message, format: int):

	match format:

		Logger.LOG_FORMAT_DEFAULT:
			return "%-10s %-8d %s" % [Logger.get_level_name(message.level), message.line, message.text]
		Logger.LOG_FORMAT_FULL:
			return "%s %-8s %-8s %-8d %s" % [Logger.get_formatted_date(OS.get_datetime()), message.category.to_upper(), Logger.get_level_name(message.level), message.line, message.text]
		Logger.LOG_FORMAT_MORE:
			return "%s %-8s %-8d %s" % [Logger.get_formatted_date(OS.get_datetime()), Logger.get_level_name(message.level), message.line, message.text]
		Logger.LOG_FORMAT_NONE:
			return message.text
		Logger.LOG_FORMAT_SIMPLE:
			return "%-8d %s" % [message.line, message.text]
		_:
			return "%-8s %s" % [Logger.get_formatted_date(OS.get_datetime()), message.text]
