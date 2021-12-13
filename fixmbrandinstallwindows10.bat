@echo off
diskpart 
pause
sel vol 0 
del vol 
creat par prim size=250000
format fs=ntfs QUICK COMPRESS
assign letter C
active
exit  
title FIX MBR
bootrec /fixmbr
bootrec /scanos
pause
title Install Windows 10
dism /Apply-Image /ImageFile:E:\sources\install.esd /Index:1 /ApplyDir:C:\
bootsect /nt60 C: /mbr
bcdboot D:\windows /s C:
title DONE!!!!
pause
exit
