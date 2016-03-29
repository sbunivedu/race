# race
1. (chapter 2.11) Write a shell (bash) script that produces a file of sequential numbers by reading the last number in the file, adding 1 to it, and then appending to the file. Run one instance (process) of the script, examine the file numbers. Delete the file numbers. Run two instances of the same script, one in the background and one in the foreground, and examine the output file again. How long does it take before a race condition manifests itself? What is the critical section? 
The shell script race.sh and the script to run race.sh in two processes are provided in the race.zip file.
To run race.sh, type "source race.sh" in the command line. "source run_race.sh" will start two processes running race.sh (almost) simultaneously.

2. (chapter 2.12) Modify the race.sh script to prevent the race. Hint: The race can be avoided by having each process test for and set a lock using a file before entering the critical area, and unlocking it (removing the file) upon leaving the critical area. This can be done like as follows:
...
if ln numbers numbers.lock then
```
...
rm numbers.lock
...
fi
or
...
if mkdir lock then
...
rmdir lock
...
fi
```
Both approaches attempt to create a file/directory as a lock, which is possible due to the atomicity of the ln (create a hardlink) and the mkdir commands. The return code from the ln or the mkdir is then tested. The create part and the test part are done in a single indivisible step and no context switching happens between the two parts. When ln or mkdir command attempts to create a file/directory that already exists, the shell will print an error message as follows: "ln: creating hard link `test1.lock': File exists". To ignore the error messages you can append "2> /dev/null" (without quotes) to the ln or mkdir command. 
Note: the fi keyword ends a if statement in bash shell. To find syntax references for bash shell, use the man page, read http://www.tldp.org/LDP/Bash-Beginners-Guide/html/, or ask Google.