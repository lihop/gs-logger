extends "../layout.gd"

var contextual_classes = \
	{
		Logger.LEVEL_ALL: "",
		Logger.LEVEL_WARN: "warning",
		Logger.LEVEL_TRACE: "",
		Logger.LEVEL_NONE: "",
		Logger.LEVEL_INFO: "info",
		Logger.LEVEL_FATAL: "danger",
		Logger.LEVEL_ERROR: "danger",
		Logger.LEVEL_DEBUG: "",
	}

var header = \
"""
<html>
<head>
<title>Message Log</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<h2>Godot Logger</h2>
<table class="table table-condensed table-hover">
<thead>
<th>Number</th>
<th>Message</th>
</thead>
"""


var footer = \
"""
</table>
</body>
</html>
"""

func getHeader():
	return header
	
	
func getFooter():
	return "</body>"
	

func build(message):
	
	return '<tr class="%s"><td style="width:100px"><span class="glyphicon glyphicon-edit" style="padding-right:10px"></span><span>%d</span></td><td>%s</td></tr>' % [contextual_classes[message.level], message.line, message.text]

	
