> [!NOTE]
> This project was built to support the New Microsoft Teams (as opposed to Microsoft Teams Classic). Microsoft Teams Classic is not currently supported.  Check the Credits section for more details. 
> At this stage, the project will not be updated to support Microsoft Teams Classic, but pull requests are welcome.

# AHK-New-Teams-Presence
AutoHotKey Script for reading MS Team status from log file and taking an action based on the status received.  Used for automated diagnostics ex: active input device (microphone and speaker active, do not disturb enabled, etc. )

# Setup
When you first run the script, a configuration file (Settings.ini) will be automatically generated in the same folder as the .ahk file. This file requires you to specify the path to your log file, as it varies for each user. To locate your log file path, navigate to the following directory:

```\AppData\Local\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\EBWebView\WV2Profile_tfw\Service Worker\CacheStorage\```

In this directory, identify the file that updates when your Microsoft Teams status changes. The complete path to this file typically resembles:

```C:\Users\USERNAME\AppData\Local\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\EBWebView\WV2Profile_tfw\Service Worker\CacheStorage\3abc345ab43a5bd34abab23\ba1561561-3d88-9999-9cc8-5445156c0111```

Note: If the .ahk file is located in a protected directory, you must run it as an administrator during its initial setup. However, I recommend placing the file in a non-secured directory initially and inspecting the created files. Once you are satisfied with the setup, you can move them to a secured location like Program Files.


# Credits
- Credit to [ajobbins](https://github.com/ajobbins/AHK-Teams-Presence) for the Microsoft Teams Classic implementation that I used for a year or more before Microsoft Teams New was released. While this project is not built to support home automation, it can be forked easily to accomplish that goal. 
