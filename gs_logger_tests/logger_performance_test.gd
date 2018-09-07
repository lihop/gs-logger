extends Node

var savefile

func test():
	Logger.trace("- trace")
	Logger.trace("- debug")
	Logger.info("- info")
	Logger.warn("- warning")
	Logger.error("- error")
	Logger.fatal("- fatal")
	
	
func run_test_at_level(test, level, iter):
	Logger.set_logger_level(level)
	run_test(test, level, iter)
	
	
func run_test(test, level, iter):
	var st = OS.get_ticks_msec()
	for i in range(iter):
		test()
	var et = OS.get_ticks_msec()
	var tt = et - st
	var s = "%s, %d, %d, %d" % [test, level, iter, tt]
	savefile.store_line(s)
	
	
func start_test_at_level(test, iters):
	
	for i in (iters):
		run_test_at_level(test, Logger.LEVEL_ALL, i)
		run_test_at_level(test, Logger.LEVEL_TRACE, i)
		run_test_at_level(test, Logger.LEVEL_DEBUG, i)
		run_test_at_level(test, Logger.LEVEL_INFO, i)
		run_test_at_level(test, Logger.LEVEL_WARN, i)
		run_test_at_level(test, Logger.LEVEL_ERROR, i)
		run_test_at_level(test, Logger.LEVEL_FATAL, i)


func start_test(test, iters):
	
	for i in (iters):		
		run_test(test, Logger.LEVEL_ALL, i)
		run_test(test, Logger.LEVEL_ALL, i)
		run_test(test, Logger.LEVEL_ALL, i)
		run_test(test, Logger.LEVEL_ALL, i)
		run_test(test, Logger.LEVEL_ALL, i)
		run_test(test, Logger.LEVEL_ALL, i)
		run_test(test, Logger.LEVEL_ALL, i)
		
func console_appender_tests(iters):
	"""
		clear all appenders
	"""
	Logger.logger_appenders.clear()
	
	"""
		default test is with one appender
	"""
	var test = "one-console-appender"
	Logger.add_appender(Logger.ConsoleAppender.new())	
	start_test_at_level(test, iters)
	
	"""
		add a second appender
	"""
	test = "two-console-appenders"
	Logger.add_appender(Logger.ConsoleAppender.new())	
	start_test_at_level(test, iters)
	
	"""
		add a third appender
	"""
	test = "three-console-appenders"
	Logger.add_appender(Logger.ConsoleAppender.new())	
	start_test_at_level(test, iters)
	
	"""
		add a fourth appender
	"""
	test = "four-console-appenders"
	Logger.add_appender(Logger.ConsoleAppender.new())	
	start_test_at_level(test, iters)
	

func file_appender_tests(iters):
	"""
		clear all appenders
	"""
	Logger.logger_appenders.clear()
	
	"""
		add a file appender
	"""
	var test = "one-file-appender"
	Logger.add_appender(Logger.FileAppender.new("1.log"))
	start_test_at_level(test, iters)
	
	"""
		add a file appender
	"""
	test = "two-file-appenders"
	Logger.add_appender(Logger.FileAppender.new("2.log"))
	start_test_at_level(test, iters)
	
	"""
		add a file appender
	"""
	test = "three-file-appenders"
	Logger.add_appender(Logger.FileAppender.new("3.log"))
	start_test_at_level(test, iters)
	
	"""
		add a file appender
	"""
	test = "four-file-appenders"
	Logger.add_appender(Logger.FileAppender.new("4.log"))
	start_test_at_level(test, iters)
	

func html_appender_tests(iters):
	"""
		clear all appenders
	"""
	Logger.logger_appenders.clear()
	
	"""
		add a html appender
	"""
	var test = "one-html-appender"
	Logger.add_appender(Logger.HtmlAppender.new("1.html"))
	start_test_at_level(test, iters)
	
	"""
		add a html appender
	"""
	test = "two-html-appenders"
	Logger.add_appender(Logger.HtmlAppender.new("2.html"))
	start_test_at_level(test, iters)
	
	"""
		add a html appender
	"""
	test = "three-html-appenders"
	Logger.add_appender(Logger.HtmlAppender.new("3.html"))
	start_test_at_level(test, iters)
	
	"""
		add a html appender
	"""
	test = "four-html-appenders"
	Logger.add_appender(Logger.HtmlAppender.new("4.html"))
	start_test_at_level(test, iters)
	
	
func multi_appender_test(iters):
	"""
		clear all appenders
	"""
	Logger.logger_appenders.clear()
	
	"""
		add a console appender for fatal errors
	"""
	var test = "multi-appender"
	var ca = Logger.ConsoleAppender.new()
	ca.logger_level = Logger.LEVEL_FATAL
	Logger.add_appender(ca)
	
	"""
		add a file appender for info
	"""
	var fa = Logger.FileAppender.new("f.log")
	fa.logger_level = Logger.LEVEL_INFO
	Logger.add_appender(fa)
	
	"""
		add a html appender for all
	"""
	var ha = Logger.HtmlAppender.new("h.html")
	ha.logger_level = Logger.LEVEL_ALL
	Logger.add_appender(ha)
	
	start_test(test, iters)
	

func _ready():
	
	savefile = File.new()
	savefile.open("res://performance.log", File.WRITE)
	savefile.store_line("test, level, iteration, total_time")
	
	var iters = [10, 25, 100, 250, 1000, 2500, 5000]
#	console_appender_tests(iters)
#	file_appender_tests(iters)
#	html_appender_tests(iters)
	multi_appender_test(iters)
	
	savefile.close()