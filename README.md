Super simple and dirty config script to setup ZSH how I like it in Kali

- Step 0: Ensure VMWare tools functionality is working on the kali machine (scaling window, copy/paste, shared folders, etc.)
- Step 1: Copy the zshconfig.sh script onto a kali machine (ideally in the home/kali directory)
- Step 2: Execute `chmod +x zshconfig.sh` to make the script executable
- Step 3: Execute `./zsh_config.sh` to configure ZSH for the kali user
- Step 4: Execute `sudo ./zsh_config.sh` to configure ZSH for the root user

This should result in a pretty nice prompt as the standard kali user:
<img width="1246" alt="image" src="https://github.com/skollr34p3r/kali-zsh_config/assets/48536777/de050c91-b5d9-4155-bc4a-b6ac16722a17">

And it results in an even better prompt as the root user:
<img width="1243" alt="image" src="https://github.com/skollr34p3r/kali-zsh_config/assets/48536777/3f4a9e6d-43fc-49e6-9ddb-afb3f664e172">
This prompt provides the timestamp on the left side, which I find very useful for screenshots for reporting.

Now only a few more tweaks need to be made to have the terminal configured how I like it:
- File > Preferences > Appearance > Font > Change > Size > 14
- File > Preferences > Appearance > Color scheme > Linux
- Apply > Okay <img width="710" alt="image" src="https://github.com/skollr34p3r/kali-zsh_config/assets/48536777/88e977c2-d8ad-452a-9d3a-baed43e39c5e">

Once this is done, the root prompt really pops on the darker background:
![image](https://github.com/skollr34p3r/kali-zsh_config/assets/48536777/04dbe34c-158f-427d-8b48-17a72115edd5)

Another cool thing is the script logging functionality as root.
As you can see highlighted in red in the image above, the script command is logging to "/root/logs/24-04-23_01:59:39.log".
The commands highlighted in blue below are present in the referenced red-highlighted log file when opened:
![image](https://github.com/skollr34p3r/kali-zsh_config/assets/48536777/56c15d22-b456-4c5f-a125-3ea1840b2825)

It's important to remember that any root shell you open will continue to log commands used in that shell (including opening log files in /root/logs).
Be careful not to enter a neverending loop by opening the log file corresponding to the shell you're inside. And remmeber, if you open a log file in
a different root shell, the data from the log file opened will be added to the log file of the shell you're in.

You can open these logs using the kali account with sudo with no worries of entering a loop:
![image](https://github.com/skollr34p3r/kali-zsh_config/assets/48536777/4003a892-b7d6-44ab-8e4f-c5653308b103)

Alternatively, you could just ignore the log files until it's necessary to retrieve them, then export them onto a different system before viewing.

