# rc-service vsftpd start
adduser jradioac
echo -e jradioac:123456s | chpasswd
mkdir -p /home/jradioac/ftps/userfiles
chown root:root /home/jradioac/ftps
chown jradioac /home/jradioac/ftps/userfiles
# vsftpd restart