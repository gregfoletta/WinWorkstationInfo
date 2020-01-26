# Workstation Information Gathering

 **Version:** 0.1

# Background

This is repository contains a batch script and procedure for gathering information on a workstation.

# Procedure

1. Download the current version of the batch file from [here](https://raw.githubusercontent.com/gregfoletta/WinWorkstationInfo/master/gather_info.bat) and save to the user's desktop.
1. Right click the batch file and select 'Run as administrator'.
1. The batch script will start gathering information on the user's workstation. It can continue to run in the background.
1. Return to the user's application that is currently having performance issues.
1. If the application is a web-browser based application, open the developer tools and switch the the network monitor tool.
    - Internet Explorer: Press F12 and select the 'Network' tab.
    - Ensure the "Clear on navigate" button is selected so recording is restarted on every link click. ![Clear Navigate](images/clear_on_naviagte.gif)
    - Press 'F5' in the developer tools to start recording the session.
1. Recreate the performance issue.
1. Save the session by pressing the save icon - suggest saving to the Desktop.
1. Switch back to the batch script - this should be waiting with a prompt asking "Hit ENTER once app testing has completed ..."
    - Press enter to continue
1. The batch script will create a '.cab' file on the user's Desktop.
1. Upload the we browser trace XML and the CAB file to [SMB location TBD]

# Version History

## v0.1

- Performs a `netsh trace`
- Runs a typeperf with all counters
- Gathers sysinfo
- Gathers proxy settings
- Pings IPs




