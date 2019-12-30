# Microsoft Developer Studio Project File - Name="libming" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=libming - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "libming.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "libming.mak" CFG="libming - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "libming - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "libming - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "libming - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "\php\src\zlib-1.1.4" /I "..\src" /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /D inline=__inline /FR /YX /FD /c
# ADD BASE RSC /l 0x407 /d "NDEBUG" /l 0.907
# ADD RSC /l 0x407 /d "NDEBUG" /l 0.907
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "libming - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_MBCS" /D "_LIB" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "\php\src\zlib-1.1.4" /I "..\src" /D "WIN32" /D "_DEBUG" /D "_MBCS" /D "_LIB" /D inline=__inline /FR /YX /FD /GZ /c
# ADD BASE RSC /l 0x407 /d "_DEBUG" /l 0.907
# ADD RSC /l 0x407 /d "_DEBUG" /l 0.907
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF 

# Begin Target

# Name "libming - Win32 Release"
# Name "libming - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE="..\src\blocks\action.c"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\assembler.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\bitmap.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\block.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocklist.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\browserfont.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\button.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\character.c"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\compile.c"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\compileaction.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\cxform.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\dbl.c"
# End Source File
# Begin Source File

SOURCE="..\src\displaylist.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\error.c"
# End Source File
# Begin Source File

SOURCE="..\src\fill.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\fillstyle.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\font.c"
# End Source File
# Begin Source File

SOURCE="..\src\font_util.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\fontinfo.c"
# End Source File
# Begin Source File

SOURCE=..\src\blocks\fromswf.c
# End Source File
# Begin Source File

SOURCE=..\src\gc.c
# End Source File
# Begin Source File

SOURCE=..\src\blocks\gifdbl.c
# End Source File
# Begin Source File

SOURCE="..\src\blocks\gradient.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\imports.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\input.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\jpeg.c"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\lex.swf4.c"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\lex.swf5.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\linestyle.c"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\listaction.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\matrix.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\method.c"
# End Source File
# Begin Source File

SOURCE="..\src\ming.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\morph.c"
# End Source File
# Begin Source File

SOURCE="..\src\movie.c"
# End Source File
# Begin Source File

SOURCE="..\src\movieclip.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\mp3.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\output.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\outputblock.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\placeobject.c"
# End Source File
# Begin Source File

SOURCE=..\src\blocks\pngdbl.c
# End Source File
# Begin Source File

SOURCE="..\src\position.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\rect.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\shape.c"
# End Source File
# Begin Source File

SOURCE="..\src\shape_cubic.c"
# End Source File
# Begin Source File

SOURCE="..\src\shape_util.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\sound.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\soundinstance.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\soundstream.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\sprite.c"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\swf4compiler.tab.c"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\swf5compiler.tab.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\text.c"
# End Source File
# Begin Source File

SOURCE="..\src\text_util.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\textfield.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\ttffont.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\utf8.c"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\videostream.c"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE="..\src\actioncompiler\action.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\action.h"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\assembler.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\bitmap.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\block.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocklist.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\blocktypes.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocktypes.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\browserfont.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\button.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\character.h"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\compile.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\cxform.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\dbl.h"
# End Source File
# Begin Source File

SOURCE="..\src\displaylist.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\error.h.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\exports.h"
# End Source File
# Begin Source File

SOURCE="..\src\fill.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\fillstyle.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\font.h"
# End Source File
# Begin Source File

SOURCE="..\src\font_util.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\fontinfo.h"
# End Source File
# Begin Source File

SOURCE=..\src\blocks\fromswf.h
# End Source File
# Begin Source File

SOURCE=..\src\gc.h
# End Source File
# Begin Source File

SOURCE="..\src\blocks\gradient.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\imports.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\input.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\jpeg.h"
# End Source File
# Begin Source File

SOURCE="..\src\libming.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\libswf.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\linestyle.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\matrix.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\method.h"
# End Source File
# Begin Source File

SOURCE="..\src\ming.h"
# End Source File
# Begin Source File

SOURCE="..\mingpp.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\morph.h"
# End Source File
# Begin Source File

SOURCE="..\src\movie.h"
# End Source File
# Begin Source File

SOURCE="..\src\movieclip.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\output.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\outputblock.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\placeobject.h"
# End Source File
# Begin Source File

SOURCE="..\src\position.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\rect.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\shape.h"
# End Source File
# Begin Source File

SOURCE="..\src\shape_cubic.h"
# End Source File
# Begin Source File

SOURCE="..\src\shape_util.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\sound.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\soundinstance.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\soundstream.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\sprite.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\swf.h"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\swf4compiler.tab.h"
# End Source File
# Begin Source File

SOURCE="..\src\actioncompiler\swf5compiler.tab.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\text.h"
# End Source File
# Begin Source File

SOURCE="..\src\text_util.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\textfield.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\utf8.h"
# End Source File
# Begin Source File

SOURCE="..\src\blocks\videostream.h"
# End Source File
# End Group
# Begin Group "Parsers"

# PROP Default_Filter "y;flex"
# Begin Source File

SOURCE=..\src\actioncompiler\swf4compiler.flex

!IF  "$(CFG)" == "libming - Win32 Release"

# Begin Custom Build
InputDir=\PHP\ming\src\actioncompiler
InputPath=..\src\actioncompiler\swf4compiler.flex

"$(InputDir)\lex.swf4.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	flex.exe -i -Pswf4 -o$(InputDir)\lex.swf4.c $(InputDir)\swf4compiler.flex

# End Custom Build

!ELSEIF  "$(CFG)" == "libming - Win32 Debug"

# Begin Custom Build
InputDir=\PHP\ming\src\actioncompiler
InputPath=..\src\actioncompiler\swf4compiler.flex

"$(InputDir)\lex.swf4.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	flex.exe -d -i -Pswf4 -o$(InputDir)\lex.swf4.c $(InputDir)\swf4compiler.flex

# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\src\actioncompiler\swf4compiler.y

!IF  "$(CFG)" == "libming - Win32 Release"

# Begin Custom Build
InputDir=\PHP\ming\src\actioncompiler
InputPath=..\src\actioncompiler\swf4compiler.y

BuildCmds= \
	bison.exe --no-lines -p swf4 $(InputDir)\swf4compiler.y \
	bison.exe --no-lines --defines -p swf4 $(InputDir)\swf4compiler.y \
	

"$(InputDir)\swf4compiler.tab.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(InputDir)\swf4compiler.tab.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "libming - Win32 Debug"

# Begin Custom Build
InputDir=\PHP\ming\src\actioncompiler
InputPath=..\src\actioncompiler\swf4compiler.y

BuildCmds= \
	bison.exe --no-lines --debug -p swf4 $(InputDir)\swf4compiler.y \
	bison.exe --no-lines --defines --debug -p swf4 $(InputDir)\swf4compiler.y \
	

"$(InputDir)\swf4compiler.tab.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(InputDir)\swf4compiler.tab.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\src\actioncompiler\swf5compiler.flex

!IF  "$(CFG)" == "libming - Win32 Release"

# Begin Custom Build
InputDir=\PHP\ming\src\actioncompiler
InputPath=..\src\actioncompiler\swf5compiler.flex

"$(InputDir)\lex.swf5.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	flex.exe -i -Pswf5 -o$(InputDir)\lex.swf5.c $(InputDir)\swf5compiler.flex

# End Custom Build

!ELSEIF  "$(CFG)" == "libming - Win32 Debug"

# Begin Custom Build
InputDir=\PHP\ming\src\actioncompiler
InputPath=..\src\actioncompiler\swf5compiler.flex

"$(InputDir)\lex.swf5.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	flex.exe -d -i -Pswf5 -o$(InputDir)\lex.swf5.c $(InputDir)\swf5compiler.flex

# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=..\src\actioncompiler\swf5compiler.y

!IF  "$(CFG)" == "libming - Win32 Release"

# Begin Custom Build
InputDir=\PHP\ming\src\actioncompiler
InputPath=..\src\actioncompiler\swf5compiler.y

BuildCmds= \
	bison.exe --no-lines -p swf5 $(InputDir)\swf5compiler.y \
	bison.exe --no-lines --defines -p swf5 $(InputDir)\swf5compiler.y \
	

"$(InputDir)\swf5compiler.tab.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(InputDir)\swf5compiler.tab.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "libming - Win32 Debug"

# Begin Custom Build
InputDir=\PHP\ming\src\actioncompiler
InputPath=..\src\actioncompiler\swf5compiler.y

BuildCmds= \
	bison.exe --no-lines --debug -p swf5 $(InputDir)\swf5compiler.y \
	bison.exe --no-lines --defines --debug -p swf5 $(InputDir)\swf5compiler.y \
	

"$(InputDir)\swf5compiler.tab.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(InputDir)\swf5compiler.tab.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
# End Group
# End Target
# End Project
