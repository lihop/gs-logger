# gs_logger
A GDScript based logging utility, it provides a very low level way to debug your Games. There are different Appenders and Layouts available that let you control how the logger output is delivered.

The utility provides a number of levels of logging, and the Developer controls what level to output when the Game is running. 

## Installation
Add gs-logger to your Godot project, you can do this by grabbing the latest release and adding it to your project. Or, you can use the Asset Library to include it in your project. If you are very adventurous, you could even try using the godot-stuff Project Manager (gspm) and adding it to your project.

## How To Use
Add logger.gd as a Singleton to your project called "Logger". Then in your GDScript code you can use these statements to log output.
```
Logger.trace("test trace")
Logger.trace("test debug")
Logger.info("test info")
Logger.warn("test warning")
Logger.error("test error")
Logger.fatal("test fatal")
```

## Releasing


## Version Naming Convention
To ensure that the stuff we create supports the version of Godot they are written for, we use a naming convention that combines the Version of Godot it supports, with an additional Release number. For example,

Version 3.1-R1

This support Godot 3.1, and is the First Release of the stuff.

In general, we will not create releases for Godot patches, instead we will try to ensure that the Major.Minor version of the Release we are creating is compatible with all Versions. If there comes a time where that does not work, we will determines how to handle it at that time.

