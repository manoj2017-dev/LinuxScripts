# 🔧 Essential Linux Commands Cheat Sheet

A comprehensive list of commonly used Linux commands for Developers, Testers, and System Administrators.

---

## 🖥️ SYSTEM

```bash
uname -a          # Display system info
uname -r          # Kernel release
uptime            # System uptime and load
hostname          # Host name
hostname -i       # Host IP address
last reboot       # Reboot history
date              # Current date/time
cal               # Current month's calendar
w                 # Who is online
whoami            # Logged-in user
finger user       # Info about a user
```

## 🛠️ HARDWARE

```bash
dmesg                     # Boot messages
cat /proc/cpuinfo         # CPU model
cat /proc/meminfo         # Memory info
cat /proc/interrupts      # I/O interrupts
lshw                      # Hardware configuration
lsblk                     # Block devices
free -m                   # Memory usage (MB)
lspci -tv                 # PCI devices
lsusb -tv                 # USB devices
dmidecode                # BIOS hardware info
hdparm -i /dev/sda        # Disk info
hdparm -tT /dev/sda       # Disk speed test
badblocks -s /dev/sda     # Check bad blocks
```

## 👤 USERS

```bash
id                        # Current user info
last                      # Previous logins
who                       # Logged-in users
groupadd admin            # Add group
useradd -c "Sam" -g admin -m sam  # Add user
userdel sam               # Delete user
adduser sam               # Add user
usermod                   # Modify user
chgrp                     # Change group
```

## 🌐 NETWORKING

```bash
ip addr show                     # Show interfaces
ip address add 192.168.0.1 dev eth0  # Assign IP
ethtool eth0                     # Ethernet status
mii-tool eth0                    # Ethernet status
ping host                        # Ping host
whois domain                     # WHOIS info
dig domain                       # DNS lookup
dig -x host                      # Reverse lookup
host google.com                  # DNS IP
hostname -i                     # Local IP
wget file                        # Download file
netstat -tupl                    # Active ports
```

## 💽 DISK USAGE

```bash
df -h                   # Free space
df -i                   # Free inodes
fdisk -l                # Partition info
du -ah                  # Disk usage
du -sh                  # Folder size
findmnt                 # Mount points
mount device-path mount-point  # Mount device
```

## 📁 DIRECTORY TRAVERSAL

```bash
cd ..        # Up one level
cd           # Home directory
cd /test     # Go to /test
```

## 📄 FILE COMMANDS

```bash
ls -al                     # List all
pwd                        # Current path
mkdir dir-name             # Make directory
rm file-name               # Remove file
rm -r dir-name             # Remove directory
rm -f file                 # Force remove
rm -rf dir-name            # Force remove directory
cp file1 file2             # Copy file
cp -r dir1 dir2            # Copy directory
mv file1 file2             # Move/rename file
ln -s /path/file link-name # Symbolic link
touch file                 # Create/update file
cat > file                 # Create file
more file                  # View file
head file                  # First 10 lines
tail file                  # Last 10 lines
tail -f file               # Real-time output
gpg -c file                # Encrypt file
gpg file.gpg               # Decrypt file
wc                         # Word/line count
xargs                      # Execute from input
```

## 🧠 PROCESS RELATED

```bash
ps                          # Running processes
ps aux | grep 'telnet'      # Find telnet
pmap                        # Memory map
top                         # Task manager
kill pid                    # Kill by PID
killall proc                # Kill by name
pkill process-name          # Kill by pattern
bg                          # Resume job in bg
fg                          # Resume job in fg
```

## 🔐 FILE PERMISSIONS

```bash
chmod 777 file     # Full access to all
chmod 755 file     # Owner: rwx, Others: rx
chown user file    # Change owner
chown user:group file # Change owner/group
```

## 🗜️ COMPRESSION / ARCHIVING

```bash
tar cf home.tar home       # Create tar
tar xf file.tar            # Extract tar
tar czf file.tar.gz files  # Tar + gzip
gzip file                  # Gzip compression
```

## 📦 INSTALL PACKAGES

```bash
rpm -i pkg.rpm     # Install package
rpm -e pkg         # Remove package
```

## 🔧 INSTALL FROM SOURCE

```bash
./configure
make
make install
```

## 🔍 SEARCH

```bash
grep pattern files          # Pattern search
grep -r pattern dir         # Recursive grep
locate file                 # Locate file
find /home/tom -name "index*"   # Find by name
find /home -size +10000k    # Find by size
```

## 🔐 LOGIN (SSH & TELNET)

```bash
ssh user@host               # SSH login
ssh -p port user@host       # SSH with port
telnet host                 # Telnet login
```

## 📤 FILE TRANSFER

```bash
sftp 192.168.75.2                   # SFTP
scp file.txt server:/tmp            # Copy via SCP
rsync -a /home/apps /backup/        # Rsync sync
```

---

## 📚 License

This guide is open for personal and educational use. Contributions are welcome!

