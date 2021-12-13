@echo off
diskpart 
sel vol 0 
del vol 
creat par prim size=250000
format fs=ntfs QUICK COMPRESS
assign letter V
active
exit  
title FIX MBR
bootsect /nt60 C: /mbr
bcdboot D:\windows /s C:
title Install Windows 10 Pro
dism /export-image /SourceImageFile:D:\sources\install.esd /SourceIndex:4 /DestinationImageFile:C:\InstallWindows10\install.wim /Compress:max /CheckIntegrity
dism /Apply-Image /ImageFile:V:\install.wim /Index:4 /ApplyDir:C:\
title DONE!!!!
pause
exit
