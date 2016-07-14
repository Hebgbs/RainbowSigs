@ECHO OFF

REM         ##       ++++++++++++++++++++++++++++++++++++++++++++
REM         ####     +   Adjust below variables. They will be   +
REM ##############   +          used for sigscript.bat          +
REM ###READ THIS!### +                                          +
REM ##############   + More information about these variables   + 
REM         ####     +      are in the notes below them.        +
REM         ##       ++++++++++++++++++++++++++++++++++++++++++++
REM | !!! System variables won't work for everything, but 8dot3 names will.
REM |     Do not point directly at executables, rather, where the
REM |     executables are.
REM | !!! These variables are only for sigscript; You cannot use them
REM |     to open anyrhing at these locations outside of this script.

REM Local variable settings
REM -----------------------
SET steampath=c:\progra~2\steam
SET gamepath=%steampath%\steamapps\common\brawlhalla
SET editloc=%systemroot%\
SET editor=notepad.exe

REM +++++++++++++++++++++++++++++++++++++++++++
REM + Information about local variables used: +
REM +++++++++++++++++++++++++++++++++++++++++++
REM | steampath
REM | ---------
REM | The location of steam.exe
REM | This is necessary for the validation functions,
REM | as well a neat way to shorten the gamepath variable.
REM |
REM | DEFAULT (defined by Steam): C:\progra~2\steam
REM | 32-bit (x86): C:\progra~1\steam
REM |
REM | gamepath
REM | --------
REM | The location of brawlhalla.exe
REM | The remainder of the script will be using this path
REM | to modify the game's contents. It can also begin
REM | with %steampath%, as the default will show.
REM |
REM | DEFAULT: %steampath%\steamapps\common\brawlhalla
REM |
REM | editloc
REM | -------
REM | Location for the editor. Mostly unnecessary, but if
REM | you have a particular editor you prefer, then you
REM | can define where that editor is. It's only intended
REM | to keep any output using %editor% from looking messy.
REM |
REM | It is not necessary to redefine this if you can run
REM | the editor within cmd from its executable name only.
REM |
REM | MUST END WITH A BACKSLASH.
REM | DEFAULT: %systemroot%\
REM |
REM | editor
REM | ------
REM | Binary of the text editor. Preferably, you should
REM | define this separately from the location of the editor.
REM |
REM | Example for Notepad++ Portable:
REM | SET editloc=D:\PortableApps\Notepad++Portable\
REM | SET editor=notepad++portable.exe
REM | %editloc%%editor% then becomes
REM | D:\PortableApps\Notepad++Portable\notepad++portable.exe
REM |
REM | DEFAULT: notepad.exe (assumes %systemroot%\notepad.exe)
REM |
REM | END OF VARIABLE NOTES

REM | !!! Don't touch any of this.
CD %~dp0
SET init=debug
CALL sigscript.bat %init%