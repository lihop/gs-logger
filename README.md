# Godot-Stuff Logger (gs_logger)
A GDScript based logging utility, it provides a very low level way to debug your Games. There are different Appenders and Layouts available that let you control how the logger output is delivered.

## Features
* low overhead
* simple to include in your projects
* eight different logging levels
* output to console or filesystem
* html output available (experimental)

## Installation
Add gs-logger to your Godot project, you can do this by [grabbing the latest release](https://gitlab.com/godot-stuff/gs-logger/-/releases) and adding it to your project. Or, you can use the Asset Library to include it in your project. If you are very adventurous, you could even try using the [godot-stuff Project Manager (gspm)](https://gitlab.com/godot-stuff/gs-project-manager) and add it to your project.

## The Logging Levels
There are eight different logging levels that you can use. 

Logging levels are cumulative. So if you select a logging level of INFO, you will also see all levels below that, which would be logs using WARN, ERROR and FATAL.

* LOG_LEVEL_ALL
* LOG_LEVEL_FINE
* LOG_LEVEL_TRACE
* LOG_LEVEL_DEBUG
* LOG_LEVEL_INFO
* LOG_LEVEL_WARN
* LOG_LEVEL_ERROR
* LOG_LEVEL_FATAL
* LOG_LEVEL_NONE

The logging level of NONE will never show anything and can be used to temporarily remove a log without commenting out or deleting the line of code which is sometimes useful.

The logging level of ALL will show every message logged.

## Setting The Logging Level
By default the Logging level is set to WARN. There are two different ways to change the Logging Level. 

The first way is in your code. At startup, you can use the set_logger_level function to glabally set the level. In the example below, any ERROR logs will be captured.
```
Logger.set_logger_level(Logger.LOG_LEVEL_ERROR)
```
The other way to set the logging level is in your project. You can use the Property "logger/level" to one of the following

* ALL
* FINE
* TRACE
* DEBUG
* INFO
* WARN
* ERROR
* FATAL
* NONE

## How To Use
Add *logger.gd* as a Singleton to your project called "Logger". Then in your GDScript code you can use these statements to log output.
```
Logger.fine("test fine")
Logger.trace("test trace")
Logger.debug("test debug")
Logger.info("test info")
Logger.warn("test warning")
Logger.error("test error")
Logger.fatal("test fatal")
```

## Setting Appender Logging Level
When you use multiple appenders, you can set the logging level of them independantly from each other. In the example below, the first appender will be set to ERROR, while the second one will be set to DEBUG.
```
Logger.logger_appenders.clear()
var c0 = Logger.add_appender(ConsoleAppender.new())
c0.logger_level = Logger.LOG_LEVEL_ERROR
var c1 = Logger.add_appender(ConsoleAppender.new())
c1.logger_level = Logger.LOG_LEVEL_DEBUG
```

## How To Contribute
```
Coming Soon
```

## Releasing
```
Coming Soon
```

## Version Naming Convention
To ensure that the stuff we create supports the version of Godot they are written for, we use a naming convention that combines the Version of Godot it supports, with an additional Release number. For example,

Version 3.1-R1

This support Godot 3.1, and is the First Release of the stuff.

In general, we will not create releases for Godot patches, instead we will try to ensure that the Major.Minor version of the Release we are creating is compatible with all Versions. If there comes a time where that does not work, we will determines how to handle it at that time.

