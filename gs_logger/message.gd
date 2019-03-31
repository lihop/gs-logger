
"""
Class: Message

	Simple representation of a Message to Append to a Logger
	
Remarks:
	
	A Layout will Format a message before it is sent to
	its assigned Appender.
	
"""
extends Reference

var level
var text
var category
var line
var data

func _init(level=Logger.LEVEL_NONE, text="", category=Logger.CATEGORY_GENERAL, line=0, data={}):
	self.level = level
	self.text = text
	self.category = category
	self.line = line
	self.data = data
	