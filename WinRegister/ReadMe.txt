Plan

    Write a script to create a shortcut (.lnk) in shell:Startup folder using supplied parameter as shortcut target;
    Place that script (or its shortcut) into shell:SendTo folder;

Usage

For sample SashaGoddess.exe application on two mouse clicks:

    Right_Click SashaGoddess.exe in Windows Explorer or desktop,
    navigate to Send to… submenu (which should expand automatically),
    Click your script…

Hint

FYI, shell:Startup folder name equivalent in native Windows scripts is

    "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" in cmd,
    WScript.CreateObject("WScript.Shell").SpecialFolders("Startup") in VBScript,
    [Environment]::GetFolderPath('Startup') in Powershell.
