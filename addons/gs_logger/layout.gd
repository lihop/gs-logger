"""
Class: Layout
	Formats a Log Event for an Appender.
"""
extends Reference
class_name Layout

func get_header():
	return ""


func get_footer():
	return ""


func build(message: Message, format: int):
	return message


func _init():
	pass
