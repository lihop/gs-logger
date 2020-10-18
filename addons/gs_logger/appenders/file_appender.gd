#
#Class: FileAppender
#	Logs an Event to a File.
#

class_name FileAppender
extends Appender

var savefile


func append(message):
	savefile.store_string(layout.build(message, logger_format))
	savefile.store_string("\n")


func append_raw(text):
	savefile.store_string(text)
	savefile.store_string("\n")


func stop():
	savefile.close()


func _init(filename="%s.log" % ProjectSettings.get("application/config/name")):
	savefile = File.new()
	savefile.open("%s" % [filename], File.WRITE)
	name = "file appender"
	print("** File Appender Initialized **")
	print(" ")
