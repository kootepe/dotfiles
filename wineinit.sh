# env WINEPREFIX=~/.wine32 WINEARCH=win32 wine wineboot
env WINEPREFIX=~/.wine32 WINEARCH=win32 winetricks dotnet45 dotnet451 dotnet452 vcrun2017 dotnet48 d3dcompiler_43 d3dcompiler_47 d3d_compiler d3dx9 corefonts

cd /home/eekoskin22/oula/mirasys/
env WINEPREFIX=~/.wine32 WINEARCH=win32 wine Mirasys-Spotter-V8.3.11.exe
