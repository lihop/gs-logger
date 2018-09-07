
extends "./gs_logger_appender.gd"
	
var savefile

func write(level, msg):
	savefile.store_string("<li>%s</li>\n" % [msg])
	
func open():
	savefile.store_string("<html>\n")
	savefile.store_string("<body>\n")
	savefile.store_string("<ul>\n")
	
func close():
	savefile.store_string("</ul>\n")
	savefile.store_string("</body>\n")
	savefile.store_string("</html>\n")
	savefile.close()
	
	
func _init(filename="logger.html"):
	savefile = File.new()
	savefile.open("res://%s" % [filename], File.WRITE)
	name = "file appender"
	print("** Html Appender Initialized **")
	print(" ")
