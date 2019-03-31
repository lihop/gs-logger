
extends "../layout.gd"

func build(message):
	return "%-8d %s" % [message.line, message.text]

	
