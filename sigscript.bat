@ECHO OFF

REM | Made with love by Brandon Bachman
REM | Discord: "NJVS | Bad Minotaur"

GOTO %1

REM +++++++++++++++++++++++
REM + Script diagnostics. +
REM +++++++++++++++++++++++

:debug
CLS
COLOR 0E
ECHO Diagnostics menu
ECHO.
ECHO If you had not already, choose to edit
ECHO startInstall.bat. Since every system is different,
ECHO it is left to the end user to make this functional.
ECHO.
ECHO If you've already used this installer a few times,
ECHO you're free to skip introductory content.
ECHO Future menus will have a help section to assist
ECHO you as you use this script. View "How to batch.txt"
ECHO for more information about how this script functions.
ECHO.
ECHO 0. Terminate script
ECHO 1. Edit startInstall.bat
ECHO 2. Perform path check (recommended)
ECHO 3. Skip introductory content
ECHO 4. Skip to post-installation
ECHO 5. Begin mod installation
ECHO.
set /p choice=Selection: 
if '%choice%'=='' ECHO "%choice%" isn't a selection; Try again.
if '%choice%'=='0' GOTO abort
if '%choice%'=='1' GOTO edit
if '%choice%'=='2' GOTO pathdbg
if '%choice%'=='3' GOTO execute
if '%choice%'=='4' GOTO postinst
if '%choice%'=='5' GOTO intro1

:pathdbg
CLS
ECHO This will show if the paths this script uses
ECHO are configured correctly. If this check yeilds
ECHO something different than what you expect, then
ECHO choose to edit startInstall.bat.
ECHO.
ECHO Further, this script must be ran from the same
ECHO device which it resides in, and this script
ECHO must reside in the same location as the .SWF
ECHO files this modification provides.
ECHO.
ECHO For example, if this script resides in E:, then
ECHO you must specify to be in E: (by typing it)
ECHO before you execute this script.
ECHO.
ECHO Press any key to check your paths.
PAUSE > NUL
CLS
ECHO Initialization script location
ECHO ------------------------------
DIR /B %~dp0\startInstall.bat
ECHO ------------------------------
ECHO.
ECHO Steam path @ %steampath%
ECHO.
ECHO Mod files @ %~dp0
ECHO ---------------------------------------------
DIR /B %~dp0
ECHO ---------------------------------------------
ECHO.
ECHO Game files @ %gamepath%
ECHO Because there are so many, only those relevant to the mod are shown.
ECHO --------------------------------------------------------------------
DIR /B %gamepath%\rainbow*
DIR /B %gamepath%\backup*
DIR /B %gamepath%\Animation*
DIR /B %gamepath%\SFX*
ECHO --------------------------------------------------------------------
ECHO.
ECHO Text editor
ECHo -----------
ECHO Program: %editor%
ECHO Location: %editloc%
ECHO Press any key to return at previous menu.
PAUSE > NUL
GOTO debug

REM +++++++++++++++++++++++++
REM + Introductory content. + 
REM +++++++++++++++++++++++++
REM | !!! Only intended to prevent human issues
REM |     with unauthorized installation.

:intro1
CLS
COLOR 0E
ECHO While nothing can stop you from being a complete idiot,
ECHO some people may be tempted to apply this modification to
ECHO other people's copy of Brawlhalla. If you don't own the
ECHO game, then you should not use this script.
ECHO.
ECHO Are you using this on your own copy of Brawlhalla?
ECHO.
ECHO 1. Yes
ECHO 2. No
ECHO.
set /p choice=Selection: 
if '%choice%'=='' ECHO "%choice%" isn't a selection; Try again.
if '%choice%'=='1' GOTO intro2
if '%choice%'=='2' GOTO deny

:deny
CLS
COLOR 0D
ECHO Sorry. Try installing it yourself; It's free!
ECHO .
ECHO This script will now terminate itself.
ECHO Press any key to exit.
PAUSE > NUL
EXIT

REM | !!! Note to self:
REM |     DO NOT forget to increment date on each update.

:intro2
CLS
COLOR 0A
ECHO === Rainbow Sigs script ===
ECHO == Revision 2.2 (072816) ==
ECHO.
ECHO This script must be ran as administrator.
ECHO.
ECHO This isn't configured for immediate use; You must
ECHO define the variables at the top of startInstall.bat.
ECHO It also forces people to see inside the batch files
ECHO so they understand this is not malicious, and is only
ECHO intended to (easily) apply and remove cosmetic mods.
ECHO.
ECHO Symbolic links are used to switch between use of the
ECHO mod and use of default animations, a choice you can
ECHO later decide to make. While this limits the script
ECHO to later Windows versions, it makes everything easier
ECHO for everyone, for those with Windows Vista or higher.
ECHO.
ECHO If you've managed to break your game using this script,
ECHO blame yourself; it has been tested multiple times, and
ECHo it can also be used to fix your game in the event of
ECHO game issues presented by its misuse.
ECHO.
ECHO Press any key to continue.
PAUSE > NUL
GOTO intro3

REM +++++++++++++++++++++++++++++++++++++++++++++++++
REM + None of this will work without having defined +
REM + the SET arguments at the head of this script. +
REM +++++++++++++++++++++++++++++++++++++++++++++++++
REM | !!! Final chance to edit startInstall, and
REM |     means to execute sigscript's functions.

:intro3
CLS
ECHO Choose an action. If this is the first time
ECHO executing this script, choose to edit instead.
ECHO.
ECHO 1. Edit startInstall.bat
ECHO 2. Execute installer
ECHO 3. View help and credits
ECHO 0. Terminate script
ECHO.
set /p choice=Selection: 
if '%choice%'=='' ECHO "%choice%" isn't a selection; Try again.
if '%choice%'=='0' GOTO abort
if '%choice%'=='1' GOTO edit
if '%choice%'=='2' GOTO execute
if '%choice%'=='3' GOTO help1

:help1
CLS
ECHO Rainbow Signatures by Blue Flame
ECHO Script by Bad Minotaur
ECHO.
ECHO The Rainbow Signatures project is an incomplete,
ECHO but ongoing effort to make Brawlhalla prettier.
ECHO.
ECHO Option 1: Opens a Notepad session and allows you to
ECHO modify startInstall.bat so this acts how you want it to.
ECHO.
ECHO Option 2: Proceeds with this script's intended purpose,
ECHO to replace all stock sigs with rainbow-coloured ones. 
ECHO.
ECHO This script contains no malicious code if downloaded
ECHO from either of its official sources:
ECHO https://pc.cd/WNtctalK
ECHO https://github.com/Hebgbs/RainbowSigs
ECHO.
ECHO Press any key to return at previous menu
PAUSE > NUL
GOTO intro3

REM | !!! Remember, editloc needs backslash at
REM |     the end, if you changed that SET argument.
:edit
CLS
COLOR 0E
ECHO %editor% will open, and this script will terminate.
ECHO Make necessary changes, then execute startInstall.bat
ECHO once more to use.
ECHO.
ECHO Ensure you adjust the variables there so sigscript.bat
ECHO performs as intended.
ECHO.
ECHO Press any key to begin modifying startInstall.bat.
PAUSE > NUL
START %editloc%%editor% ./startInstall.bat
EXIT

REM | !!! The application menu.
REM |     I've mostly idiot-proofed this, but DM
REM |     me on Discord if you're a better idiot.
:execute
COLOR 0A
CLS
ECHO What would you like to do?
ECHO.
ECHO 1. Apply rainbow signatures
ECHO 2. Restore to default signatures
ECHO 3. Swap signature animations
ECHO 4. View help
ECHO 0. Terminate script
ECHO.
ECHO Either way, you can revert your game files by
ECHO validating the integrity of the game cache. This
ECHO can be performed from your Steam game library.
ECHO.
set /p choice=Selection: 
if '%choice%'=='' ECHO "%choice%" isn't a selection; Try again.
if '%choice%'=='0' GOTO abort
if '%choice%'=='1' GOTO apply
if '%choice%'=='2' GOTO restore
if '%choice%'=='3' GOTO swap
if '%choice%'=='4' GOTO help2

:help2
CLS
ECHO Option 1: This will rename stock files,
ECHO add in and rename the rainbow sig files
ECHO and make links to the rainbow sigs; This
ECHO method ensures there is no accidental
ECHo deletion of content when option 2 is used.
ECHO.
ECHO Option 2: This will remove the mod in one
ECHO of two ways;
ECHO 1. Delete files this script created, then
ECHO    Use Steam to validate game files, which
ECHO    will remove all modifications
ECHO 2. Delete the symbolic links and mod files
ECHo    then rename the stock files as they were.
ECHO    This shouldn't be done unless access to
ECHO    the internet is not possible.
ECHO.
ECHO Option 3: This will allow you to choose
ECHO between one of three options, explained in
ECHO its own help section;
ECHO - Use default animations
ECHO - Use rainbow animations
ECHO The last option is for when the rainbow
ECHO sigs mod receives an update.
ECHO.
ECHO Press any key to return at previous menu.
PAUSE > NUL
GOTO execute

REM | !!! Pre-application verification.
REM |     Necessary every Wednesday.
:apply
CLS
ECHO Brawlhalla updates per-week on Wednesday. Due to how
ECHO this script operates, once per-week the original game
ECHO files this script modifies will also need to be copied
ECHO for the swap function to not break the game.
ECHO.
ECHO If this is your first time downloding this mod and using
ECHO this script, you can skip this. Otherwise, choose to
ECHO validate and wait for Steam to finish this process so
ECHO you have a fresh set of files to revert back with, in
ECHO the case reverting to default animations is necessary.
ECHO.
ECHO 1. Validate
ECHO 2. Proceed
ECHO 0. Terminate script
ECHO    (last chance to quit before install)
ECHO.
set /p choice=Selection: 
if '%choice%'=='' ECHO "%choice%" isn't a selection; Try again.
if '%choice%'=='0' GOTO abort
if '%choice%'=='1' GOTO verify
if '%choice%'=='2' GOTO proceed

:verify
CLS
ECHO startInstall.bat needs to be configured before this script
ECHO performs so it knows where Steam is. If you had not done this
ECHO already, then choose to edit startInstall.bat instead.
ECHO.
ECHO 1. Begin validation
ECHO 2. Edit startInstall.bat
ECHO.
set /p choice=Selection: 
if '%choice%'=='' ECHO "%choice%" isn't a selection; Try again.
if '%choice%'=='1' GOTO doverify
if '%choice%'=='2' GOTO edit

:doverify
CLS
ECHO The verification process should begin after you press
ECHO any key. Else, edit startInstall.bat to replace
ECHO whatever "steampath" refers to.
ECHO.
DEL /Q %gamepath%\backup_*
%steampath%\steam.exe steam://validate/291550
ECHO Do not proceed until validation is complete.
ECHO If you are a user of Windows 8 or greater,
ECHO you can use Steam's appearance in taskbar
ECHO since it will show a progress bar there.
ECHO.
ECHO When it is done, press any key to continue.
PAUSE > NUL
GOTO proceed

:proceed
CLS
ECHO The Rainbow Signatures mod will now be applied.
ECHO For debugging purposes, below are the relevant
ECHO files before application.
ECHO -----------------------------------------------
DIR /B %gamepath%\Animation*
DIR /B %gamepath%\SFX*
ECHO -----------------------------------------------
ECHO.
ECHO If you've applied this mod before, you must validate 
ECHO the game's files to prevent potential issues if you're
ECHO forced to use this script's offline restore method.
ECHO.
ECHO Press any key to apply.
PAUSE > NUL
ECHO.
REN %gamepath%\Animation_Axe.swf backup_Animation_Axe.swf
REN %gamepath%\Animation_Hammer.swf backup_Animation_Hammer.swf
REN %gamepath%\Animation_Katar.swf backup_Animation_Katar.swf
REN %gamepath%\Animation_Lance.swf backup_Animation_Lance.swf
REN %gamepath%\Animation_Pistols.swf backup_Animation_Pistols.swf
REN %gamepath%\Animation_Spear.swf backup_Animation_Spear.swf
REN %gamepath%\Animation_Sword.swf backup_Animation_Sword.swf
REN %gamepath%\SFX_1.swf backup_SFX_1.swf
REN %gamepath%\SFX_Hammer.swf backup_SFX_Hammer.swf
REN %gamepath%\SFX_Sword.swf backup_SFX_Sword.swf
COPY /Y %~dp0\Animation_Axe.swf %gamepath%\rainbow_Animation_Axe.swf
COPY /Y %~dp0\Animation_Hammer.swf %gamepath%\rainbow_Animation_Hammer.swf
COPY /Y %~dp0\Animation_Katar.swf %gamepath%\rainbow_Animation_Katar.swf
COPY /Y %~dp0\Animation_Lance.swf %gamepath%\rainbow_Animation_Lance.swf
COPY /Y %~dp0\Animation_Pistols.swf %gamepath%\rainbow_Animation_Pistols.swf
COPY /Y %~dp0\Animation_Spear.swf %gamepath%\rainbow_Animation_Spear.swf
COPY /Y %~dp0\Animation_Sword.swf %gamepath%\rainbow_Animation_Sword.swf
COPY /Y %~dp0\SFX_1.swf %gamepath%\rainbow_SFX_1.swf
COPY /Y %~dp0\SFX_Hammer.swf %gamepath%\rainbow_SFX_Hammer.swf
COPY /Y %~dp0\SFX_Sword.swf %gamepath%\rainbow_SFX_Sword.swf
MKLINK %gamepath%\replace_Animation_Axe.swf %gamepath%\rainbow_Animation_Axe.swf
MKLINK %gamepath%\replace_Animation_Hammer.swf %gamepath%\rainbow_Animation_Hammer.swf
MKLINK %gamepath%\replace_Animation_Katar.swf %gamepath%\rainbow_Animation_Katar.swf
MKLINK %gamepath%\replace_Animation_Lance.swf %gamepath%\rainbow_Animation_Lance.swf
MKLINK %gamepath%\replace_Animation_Pistols.swf %gamepath%\rainbow_Animation_Pistols.swf
MKLINK %gamepath%\replace_Animation_Spear.swf %gamepath%\rainbow_Animation_Spear.swf
MKLINK %gamepath%\replace_Animation_Sword.swf %gamepath%\rainbow_Animation_Sword.swf
MKLINK %gamepath%\replace_SFX_1.swf %gamepath%\rainbow_SFX_1.swf
MKLINK %gamepath%\replace_SFX_Hammer.swf %gamepath%\rainbow_SFX_Hammer.swf
MKLINK %gamepath%\replace_SFX_Sword.swf %gamepath%\rainbow_SFX_Sword.swf
COPY /L /Y %gamepath%\replace_Animation_Axe.swf %gamepath%\Animation_Axe.swf
COPY /L /Y %gamepath%\replace_Animation_Hammer.swf %gamepath%\Animation_Hammer.swf
COPY /L /Y %gamepath%\replace_Animation_Katar.swf %gamepath%\Animation_Katar.swf
COPY /L /Y %gamepath%\replace_Animation_Lance.swf %gamepath%\Animation_Lance.swf
COPY /L /Y %gamepath%\replace_Animation_Pistols.swf %gamepath%\Animation_Pistols.swf
COPY /L /Y %gamepath%\replace_Animation_Spear.swf %gamepath%\Animation_Spear.swf
COPY /L /Y %gamepath%\replace_Animation_Sword.swf %gamepath%\Animation_Sword.swf
COPY /L /Y %gamepath%\replace_SFX_1.swf %gamepath%\SFX_1.swf
COPY /L /Y %gamepath%\replace_SFX_Hammer.swf %gamepath%\SFX_Hammer.swf
COPY /L /Y %gamepath%\replace_SFX_Sword.swf %gamepath%\SFX_Sword.swf
DEL /Q %gamepath%\replace_*
ECHO.
ECHO Application complete.
ECHO Press any key to continue.
PAUSE > NUL
CLS
ECHO Here are the files after appliction:
ECHO ------------------------------------
DIR /B %gamepath%\backup*
DIR /B %gamepath%\rainbow*
DIR /B %gamepath%\Animation*
DIR /B %gamepath%\SFX*
ECHO ------------------------------------
ECHO.
ECHO Press any key to finish.
PAUSE > NUL
GOTO postinst

REM +++++++++++++++++++++++++++++++++++
REM +    Removal script... y'know,    +
REM + if you don't want this anymore. +
REM +++++++++++++++++++++++++++++++++++
REM | !!! :(

:restore
CLS
COLOR 0E
ECHO The Rainbow Signatures mod will now be removed.
ECHO For debugging purposes, below are the relevant
ECHO files before application.
ECHO -----------------------------------------------
DIR /B %gamepath%\backup*
DIR /B %gamepath%\rainbow*
DIR /B %gamepath%\Animation*
DIR /B %gamepath%\SFX*
ECHO -----------------------------------------------
ECHO.
ECHO Press any key to continue.
PAUSE > NUL
CLS
ECHO This process can be done one of two ways; Prior
ECHO to installation, this script made backups of the
ECHO original files for use with the swap feature, as
ECHO well for this very process where this mod will be
ECHO removed in its entirety from the game directory.
ECHO.
ECHO Alternatively, the files can be restored by
ECHO validating the game cache, which would download
ECHO the original files to overwrite modified files.
ECHO.
ECHO These processes, respectively will be referred to
ECHO as "offline" and "online". Use the online option
ECHO if you have an internet connection.
ECHO.
ECHO 1. Online
ECHO 2. Offline
ECHO 0. Terminate script
ECHO    (Last chance to quit before removal)
ECHO.
set /p choice=Selection: 
if '%choice%'=='' ECHO "%choice%" isn't a selection; Try again.
if '%choice%'=='0' GOTO abort
if '%choice%'=='1' GOTO onres
if '%choice%'=='2' GOTO offres

:onres
CLS
ECHO The verification process should begin now.
ECHO After, this modification will be removed.
ECHO.
DEL /Q %gamepath%\backup_* %gamepath%\rainbow_*
%steampath%\steam.exe steam://validate/291550
ECHO Do not proceed until validation is complete.
ECHO When it is done, press any key to continue.
PAUSE > NUL
GOTO postres

REM | !!! Should only be used if a connection
REM |     to the internet isn't possible.
:offres
REM | !!! Line below included because the whole
REM |     symlink thing was being weird.
DEL /Q %gamepath%\Animation_Axe.swf %gamepath%\Animation_Hammer.swf %gamepath%\Animation_Katar.swf %gamepath%\Animation_Lance.swf %gamepath%\Animation_Pistols.swf %gamepath%\Animation_Spear.swf %gamepath%\Animation_Sword.swf %gamepath%\SFX_1.swf %gamepath%\SFX_Hammer.swf %gamepath%\SFX_Sword.swf
COPY /Y %gamepath%\backup_Animation_Axe.swf %gamepath%\Animation_Axe.swf
COPY /Y %gamepath%\backup_Animation_Hammer.swf %gamepath%\Animation_Hammer.swf
COPY /Y %gamepath%\backup_Animation_Katar.swf %gamepath%\Animation_Katar.swf
COPY /Y %gamepath%\backup_Animation_Lance.swf %gamepath%\Animation_Lance.swf
COPY /Y %gamepath%\backup_Animation_Pistols.swf %gamepath%\Animation_Pistols.swf
COPY /Y %gamepath%\backup_Animation_Spear.swf %gamepath%\Animation_Spear.swf
COPY /Y %gamepath%\backup_Animation_Sword.swf %gamepath%\Animation_Sword.swf
COPY /Y %gamepath%\backup_SFX_1.swf %gamepath%\SFX_1.swf
COPY /Y %gamepath%\backup_SFX_Hammer.swf %gamepath%\SFX_Hammer.swf
COPY /Y %gamepath%\backup_SFX_Sword.swf %gamepath%\SFX_Sword.swf
DEL /Q %gamepath%\backup_* %gamepath%\rainbow_*
ECHO.
GOTO postres

:postres
ECHO.
ECHO Restoration complete.
ECHO.
ECHO If using the offline restore process and problems
ECHO occur, validate cache; If performed after Wednesday, 
ECHO the game's files may be out of date.
ECHO.
ECHO Press any key to continue.
PAUSE > NUL
CLS
ECHO Here are the files after restore
ECHO -----------------------------------------------
DIR /B %gamepath%\Animation*
DIR /B %gamepath%\SFX*
ECHO -----------------------------------------------
GOTO postinst

REM +++++++++++++++++++++++++++++++++++++++
REM +   Swap script, for when your love   +
REM + affair with rainbows is on and off. +
REM +++++++++++++++++++++++++++++++++++++++

:swap
CLS
ECHO If you have a multi-user environment, you may have
ECHO members in your residence who don't like this mod.
ECHO This menu will allow you to select which animations
ECHo to use.
ECHO.
ECHO You can also refresh the rainbow animations; Just
ECHO copy the new animations into the path this script
ECHO is running from, and choose to refresh animations.
ECHO.
ECHO None of these functions will work without having
ECHO applied the mod first.
ECHO.
ECHO 1. Use rainbow animations
ECHO 2. Use default animations
ECHO 3. Show information about updating
ECHO 0. Terminate script
ECHO    (Last chance to quit before execution)
ECHO.
set /p choice=Selection: 
if '%choice%'=='' ECHO "%choice%" isn't a selection; Try again.
if '%choice%'=='0' GOTO abort
if '%choice%'=='1' GOTO redomod
if '%choice%'=='2' GOTO undomod
if '%choice%'=='3' GOTO help3

:help3
CLS
ECHO Each of the two options wlll do the following;
ECHO - Make links to copies in game directory
ECHO - As well, Prepare files for overwriting
ECHO - Overwrite these files with duplicates of links
ECHO - Delete the copies either option makes.
ECHO.
ECHO It seems weird, but it is done like this to prevent
ECHO the accidential deletion of the game's original files.
ECHO To fully understand what is going on, choose to modify
ECHo this script within Explorer or from this script.
ECHO.
ECHO Press any key to return at the previous menu.
PAUSE > NUL
GOTO swap

:redomod
CLS
ECHO This will replace the present animations with the
ECHO rainbow animations. For debugging purposes, here
ECHO are your files prior to application:
ECHO -------------------------------------------------
DIR /B %gamepath%\rainbow*
DIR /B %gamepath%\backup*
DIR /B %gamepath%\Animation*
DIR /B %gamepath%\SFX*
ECHO -------------------------------------------------
ECHO.
ECHO Press any key to use rainbow signatures.
PAUSE > NUL
MKLINK %gamepath%\replace_Animation_Axe.swf %gamepath%\rainbow_Animation_Axe.swf
MKLINK %gamepath%\replace_Animation_Hammer.swf %gamepath%\rainbow_Animation_Hammer.swf
MKLINK %gamepath%\replace_Animation_Katar.swf %gamepath%\rainbow_Animation_Katar.swf
MKLINK %gamepath%\replace_Animation_Lance.swf %gamepath%\rainbow_Animation_Lance.swf
MKLINK %gamepath%\replace_Animation_Pistols.swf %gamepath%\rainbow_Animation_Pistols.swf
MKLINK %gamepath%\replace_Animation_Spear.swf %gamepath%\rainbow_Animation_Spear.swf
MKLINK %gamepath%\replace_Animation_Sword.swf %gamepath%\rainbow_Animation_Sword.swf
MKLINK %gamepath%\replace_SFX_1.swf %gamepath%\rainbow_SFX_1.swf
MKLINK %gamepath%\replace_SFX_Hammer.swf %gamepath%\rainbow_SFX_Hammer.swf
MKLINK %gamepath%\replace_SFX_Sword.swf %gamepath%\rainbow_SFX_Sword.swf
COPY /L /Y %gamepath%\replace_Animation_Axe.swf %gamepath%\Animation_Axe.swf
COPY /L /Y %gamepath%\replace_Animation_Hammer.swf %gamepath%\Animation_Hammer.swf
COPY /L /Y %gamepath%\replace_Animation_Katar.swf %gamepath%\Animation_Katar.swf
COPY /L /Y %gamepath%\replace_Animation_Lance.swf %gamepath%\Animation_Lance.swf
COPY /L /Y %gamepath%\replace_Animation_Pistols.swf %gamepath%\Animation_Pistols.swf
COPY /L /Y %gamepath%\replace_Animation_Spear.swf %gamepath%\Animation_Spear.swf
COPY /L /Y %gamepath%\replace_Animation_Sword.swf %gamepath%\Animation_Sword.swf
COPY /L /Y %gamepath%\replace_SFX_1.swf %gamepath%\SFX_1.swf
COPY /L /Y %gamepath%\replace_SFX_Hammer.swf %gamepath%\SFX_Hammer.swf
COPY /L /Y %gamepath%\replace_SFX_Sword.swf %gamepath%\SFX_Sword.swf
DEL %gamepath%\replace_*
ECHO.
ECHO Changes applied.
ECHO Press any key to continue.
PAUSE > NUL
CLS
ECHO Here are the files after application (no changes should be visible):
ECHO -------------------------------------------------
DIR /B %gamepath%\rainbow*
DIR /B %gamepath%\backup*
DIR /B %gamepath%\Animation*
DIR /B %gamepath%\SFX*
ECHO -------------------------------------------------
ECHO.
Echo Press any key to finish.
PAUSE > NUL
GOTO postinst

:undomod
CLS
ECHO This will replace the present animations with the
ECHO default animations. For debugging purposes, here
ECHO are your files prior to application:
ECHO -------------------------------------------------
DIR /B %gamepath%\rainbow*
DIR /B %gamepath%\backup*
DIR /B %gamepath%\Animation*
DIR /B %gamepath%\SFX*
ECHO -------------------------------------------------
ECHO.
ECHO Press any key to use default signatures.
PAUSE > NUL
MKLINK %gamepath%\replace_Animation_Axe.swf %gamepath%\backup_Animation_Axe.swf
MKLINK %gamepath%\replace_Animation_Hammer.swf %gamepath%\backup_Animation_Hammer.swf
MKLINK %gamepath%\replace_Animation_Katar.swf %gamepath%\backup_Animation_Katar.swf
MKLINK %gamepath%\replace_Animation_Lance.swf %gamepath%\backup_Animation_Lance.swf
MKLINK %gamepath%\replace_Animation_Pistols.swf %gamepath%\backup_Animation_Pistols.swf
MKLINK %gamepath%\replace_Animation_Spear.swf %gamepath%\backup_Animation_Spear.swf
MKLINK %gamepath%\replace_Animation_Sword.swf %gamepath%\backup_Animation_Sword.swf
MKLINK %gamepath%\replace_SFX_1.swf %gamepath%\backup_SFX_1.swf
MKLINK %gamepath%\replace_SFX_Hammer.swf %gamepath%\backup_SFX_Hammer.swf
MKLINK %gamepath%\replace_SFX_Sword.swf %gamepath%\backup_SFX_Sword.swf
COPY /L /Y %gamepath%\replace_Animation_Axe.swf %gamepath%\Animation_Axe.swf
COPY /L /Y %gamepath%\replace_Animation_Hammer.swf %gamepath%\Animation_Hammer.swf
COPY /L /Y %gamepath%\replace_Animation_Katar.swf %gamepath%\Animation_Katar.swf
COPY /L /Y %gamepath%\replace_Animation_Lance.swf %gamepath%\Animation_Lance.swf
COPY /L /Y %gamepath%\replace_Animation_Pistols.swf %gamepath%\Animation_Pistols.swf
COPY /L /Y %gamepath%\replace_Animation_Spear.swf %gamepath%\Animation_Spear.swf
COPY /L /Y %gamepath%\replace_Animation_Sword.swf %gamepath%\Animation_Sword.swf
COPY /L /Y %gamepath%\replace_SFX_1.swf %gamepath%\SFX_1.swf
COPY /L /Y %gamepath%\replace_SFX_Hammer.swf %gamepath%\SFX_Hammer.swf
COPY /L /Y %gamepath%\replace_SFX_Sword.swf %gamepath%\SFX_Sword.swf
DEL %gamepath%\replace_*
ECHO.
ECHO Changes applied.
ECHO Press any key to continue.
PAUSE > NUL
CLS
ECHO Here are the files after application (no changes should be visible):
ECHO -------------------------------------------------
DIR /B %gamepath%\rainbow*
DIR /B %gamepath%\backup*
DIR /B %gamepath%\Animation*
DIR /B %gamepath%\SFX*
ECHO -------------------------------------------------
ECHO.
ECHO Press any key to finish.
PAUSE > NUL
GOTO postinst

++++++++++++++
+ That's it. +
++++++++++++++

:abort
CLS
COLOR 0D
ECHO Script terminated prematurely.
ECHO While you shouldn't be afraid, it
ECHO is understandable why you may be.
ECHO.
ECHO Reassure yourself the safety of
ECHO these script and try again. :)
ECHO.
ECHO Press any key to exit.
PAUSE > NUL
CLS
EXIT

:postinst
CLS
ECHO Finished! You can choose to see your changes,
ECHO make further changes or exit this script.
ECHO.
ECHO 1. Open Brawlhalla (and terminate script)
ECHO 2. Change signature animations (not remove)
ECHO 3. Remove rainbow sigs mod
ECHO 4. Go to diagnostics
ECHO    (if something wrong happened)
ECHO 0. Terminate script
ECHO    (closes CMD)
ECHO.
set /p choice=Selection: 
if '%choice%'=='' ECHO "%choice%" isn't a selection; Try again.
if '%choice%'=='0' EXIT
if '%choice%'=='1' %steampath%\steam.exe steam://run/291550
if '%choice%'=='2' GOTO swap
if '%choice%'=='3' GOTO restore
if '%choice%'=='4' GOTO debug

REM | Made with love by Brandon Bachman.
REM | EOF