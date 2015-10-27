#Author Jasmit Tarang
#Original commands from exploitees.rs
#Visit craportech.com
#To reprogram firmware image with devkeys
/usr/share/vboot/bin/make_dev_firmware.sh

#To disable rootfs verification and resign the kernel, run the following command:
/usr/share/vboot/bin/make_dev_ssd.sh --remove_rootfs_verification --image /dev/mmcblk0

#add busybox and a telnetd shell to the normal boot environment
mkdir /tmp/roota
mount /dev/mmcblk0p3 /tmp/roota/
mkdir /tmp/rootb
mount /dev/mmcblk0p5 /tmp/rootb/
cp /bin/busybox /tmp/roota/bin/busybox
cp /bin/busybox /tmp/rootb/bin/busybox
cp /etc/init/telnetd.conf /tmp/roota/etc/init/telnetd.conf
cp /etc/init/telnetd.conf /tmp/rootb/etc/init/telnetd.conf
chmod 755 /tmp/roota/bin/busybox
chmod 755 /tmp/rootb/bin/busybox
cp /etc/shadow /tmp/roota/etc/shadow
cp /etc/shadow /tmp/rootb/etc/shadow
sync
umount /dev/mmcblk0p3
umount /dev/mmcblk0p5

#done!
