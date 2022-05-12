## Task 4.1

### Module 4 Linux Essentials

### Task1.Part1

2. Changing password using passwd command  
![t1.1](./t1101.png)  
Basic parameters of the command are:  
![t1.1](./t1021.png)  
This command interacts with these files:  
![t1.1](./t1022.png)  
The encrypted password is stored in the second column of the /etc/shadow file

3. We can use w command to show who is logged in and what users are executing.  
![t1.1](./t1030.png)  
The information in the output shows:  
Header - the current time, uptime of the device, the number of logged-in users, and system load averages  
Table output - name, name of tty, the remote host, login time, idle (how long is this process running), JCPU(time used by all processes of tty), PCPU(time used by the current process)  
4. To change personal information we use chfn command  
![t1.1](./t1040.png)
5. Linux help system  
![t1.1](./t1050.png)  
We can modify the behavior of the commands using options. For example, we can modify w command by using -h key. That will hide header (-h) if we do not need it  
![t1.1](./t1051.png)  
We can set expiration warning days using "passwd -w 3 username" command  
![t1.1](./t1052.png)  
6. more and less  
![t1.1](./t1060.png)  
![t1.1](./t1061.png)  
7. To determine the last logon time for all users - lastlog command  
![t1.1](./t1071.png)  
Also, we can see the login history using "last" command  
![t1.1](./t1070.png)  
The finger command also can display information about login time  
![t1.1](./t1072.png)
8. ls is used with additional key almost all the time. My personal preference is combination of -lah. The default system alias ll is used a lot too.  
The directories can be defined by letter "d" in the first column. Hidden files names start with dot "."  
![t1.1](./t1080.png)
![t1.1](./t1081.png)

### Task1.Part2
1. Tree command  
![t1.1](./t2010.png)
![t1.1](./t2011.png)  
2. To define the type of some file we can use file command. Examples:  
![t1.1](./t2020.png)
3. Relative and absolute paths:  
![t1.1](./t2030.png)  
To go to home directory from any place we use command cd ~
4. ls command  
![t1.1](./t2040.png)  
Here we can see file some columns:
   * fype at the first place
   * next one is a permission block
   * number of hard links to the file
   * owner name
   * owner group
   * file size
   * date and time of last modification of the object
   * name
5. During this task I've used these commands:
   * ls -d */ > ~/task5/dirs_in_root redirected output of directories to the file
   * mkdir task5 - to create directory
   * cp /home/alex/task5/dirs_in_root ~ to copy the file
   * rm -ri ~/task5/ to remove the directory with files I have used -r recursive key and -i for confirmation of deleting every file
![t1.1](./t2050.png)  
6. Hard and soft links  
![t1.1](./t2060.png)  
A hard link is a mirror copy of the original file, the size is the same, files are "syncronized". Same inode number and permissions  
A soft link is a special sort of file that points at a different file. Different inode number and permissions. It has only the path to the original file, not the contents  
![t1.1](./t2061.png)  
When I have changed data by opening a symbolic link, the changes appeared in the originating file, because the link points the original file  
![t1.1](./t2062.png)  
When we delete the originating file, the symbolic link does not work because it is just a link.  
The hard link works perfectly and it has the actual contents of original file.
7. ![t1.1](./t2070.png) 
8. To determine types of partitions we can use df -T (print file system type) or mount command  
![t1.1](./t2080.png) 
9. To count the number of lines cointaining a given sequence of characters in a file we can use grep -c command:  
![t1.1](./t2090.png)  
10. Using find command we can find all files in /etc containing "host"  
![t1.1](./t2100.png)
11. List all objects in /etc that contain the ss character sequence  
![t1.1](./t2110.png)
![t1.1](./t2111.png)
12. Screen-by-screen output of /etc directory  
![t1.1](./t2120.png) 
13. Types of devices and how to determine the type of the device
There are actually two types of device files: 
* A block device is read or written one block (a group of bytes) at a time; 
* A character device can be read or written one byte at a time.  
![t1.1](./t2130.png)  
The character b at the start of the ls output indicates that sda, sda1, sda2, sda3 are block devices 
rtc0, sg0 are character devices.
14. There are 7 types of files:
* Regular files [symbol -]
* Directories [symbol d]
* Character device files [symbol c]
* Block device files [symbol b]
* Local domain sockets [symbol s]
* Named pipes (FIFOs) [symbol p]
* Symbolic links [symbol l]
To determine the type of file we can use file command
15. To list first 4 directory files that were recently accessed in the /etc dir:  
find . - because we are already in /etc directory  
-type d - to list directories  
-amin -200 - random value in minutes e.g "recenty"  
and finaly we piping the result to head command to limit the output  
![t1.1](./t2140.png)
