# Microsoft Developer Studio Project File - Name="cvtest" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=cvtest - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "cvtest.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "cvtest.mak" CFG="cvtest - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cvtest - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "cvtest - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "cvtest - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\..\_temp\cvtest_Release"
# PROP Intermediate_Dir "..\..\..\_temp\cvtest_Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
F90=df.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MD /W4 /GX /Zi /O2 /I "." /I "..\..\cxts" /I "..\..\..\cxcore\include" /I "..\..\..\cv\include" /I "..\..\..\cvaux\include" /I "..\..\..\otherlibs\highgui" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Yu"cvtest.h" /FD /c
# ADD BASE RSC /l 0x419 /d "NDEBUG"
# ADD RSC /l 0x419 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 cv.lib cvaux.lib cxcore.lib highgui.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib shell32.lib cxts.lib /nologo /subsystem:console /debug /machine:I386 /nodefaultlib:"libmmd.lib" /out:"..\..\..\bin\cvtest.exe" /libpath:"..\..\..\lib"
# SUBTRACT LINK32 /nodefaultlib

!ELSEIF  "$(CFG)" == "cvtest - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\_temp\cvtest_Debug"
# PROP Intermediate_Dir "..\..\..\_temp\cvtest_Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
F90=df.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W4 /Gm /GX /Zi /Od /I "." /I "..\..\cxts" /I "..\..\..\cxcore\include" /I "..\..\..\cv\include" /I "..\..\..\cvaux\include" /I "..\..\..\otherlibs\highgui" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /Yu"cvtest.h" /FD /GZ /c
# ADD BASE RSC /l 0x419 /d "_DEBUG"
# ADD RSC /l 0x419 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 cvd.lib cvauxd.lib cxcored.lib highguid.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib shell32.lib cxtsd.lib /nologo /subsystem:console /debug /machine:I386 /nodefaultlib:"libmmdd.lib" /out:"..\..\..\bin\cvtestd.exe" /pdbtype:sept /libpath:"..\..\..\lib"

!ENDIF 

# Begin Target

# Name "cvtest - Win32 Release"
# Name "cvtest - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\aaccum.cpp
# End Source File
# Begin Source File

SOURCE=.\aadaptthresh.cpp
# End Source File
# Begin Source File

SOURCE=.\aapproxpoly.cpp
# End Source File
# Begin Source File

SOURCE=.\acameracalibration.cpp
# End Source File
# Begin Source File

SOURCE=.\acamshift.cpp
# End Source File
# Begin Source File

SOURCE=.\acanny.cpp
# End Source File
# Begin Source File

SOURCE=.\achesscorners.cpp
# End Source File
# Begin Source File

SOURCE=.\acolor.cpp
# End Source File
# Begin Source File

SOURCE=.\acondens.cpp
# End Source File
# Begin Source File

SOURCE=.\acontours.cpp
# End Source File
# Begin Source File

SOURCE=.\acontoursmatch.cpp
# End Source File
# Begin Source File

SOURCE=.\aconvhull.cpp
# End Source File
# Begin Source File

SOURCE=.\acreatecontourtree.cpp
# End Source File
# Begin Source File

SOURCE=.\adistancetransform.cpp
# End Source File
# Begin Source File

SOURCE=.\aeigenobjects.cpp
# End Source File
# Begin Source File

SOURCE=.\aemd.cpp
# End Source File
# Begin Source File

SOURCE=.\afilter.cpp
# End Source File
# Begin Source File

SOURCE=.\afloodfill.cpp
# End Source File
# Begin Source File

SOURCE=.\afundam.cpp
# End Source File
# Begin Source File

SOURCE=.\ahistograms.cpp
# End Source File
# Begin Source File

SOURCE=.\ahoughtransform.cpp
# End Source File
# Begin Source File

SOURCE=.\aimage.cpp
# End Source File
# Begin Source File

SOURCE=.\aimgwarp.cpp
# End Source File
# Begin Source File

SOURCE=.\akalman.cpp
# End Source File
# Begin Source File

SOURCE=.\akmeans.cpp
# End Source File
# Begin Source File

SOURCE=.\amatchcontourtrees.cpp
# End Source File
# Begin Source File

SOURCE=.\amoments.cpp
# End Source File
# Begin Source File

SOURCE=.\amotiontemplates.cpp
# End Source File
# Begin Source File

SOURCE=.\amotseg.cpp
# End Source File
# Begin Source File

SOURCE=.\aoptflowhs.cpp
# End Source File
# Begin Source File

SOURCE=.\aoptflowlk.cpp
# End Source File
# Begin Source File

SOURCE=.\aoptflowpyrlk.cpp
# End Source File
# Begin Source File

SOURCE=.\aposit.cpp
# End Source File
# Begin Source File

SOURCE=.\apyrsegmentation.cpp
# End Source File
# Begin Source File

SOURCE=.\asnakes.cpp
# End Source File
# Begin Source File

SOURCE=.\asubdivisions.cpp
# End Source File
# Begin Source File

SOURCE=.\atemplmatch.cpp
# End Source File
# Begin Source File

SOURCE=.\athresh.cpp
# End Source File
# Begin Source File

SOURCE=.\cvtest.cpp
# ADD CPP /Yc"cvtest.h"
# End Source File
# Begin Source File

SOURCE=.\tsysa.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\cvtest.h
# End Source File
# End Group
# End Target
# End Project
