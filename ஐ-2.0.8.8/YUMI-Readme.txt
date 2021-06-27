YUMI © https://www.pendrivelinux.com (covered under GNU GPL License) - see YUMI-Copying

Background of YUMI (Your Universal Multiboot Integrator):

YUMI is an easy to use tool created using NSIS. The purpose of YUMI is to help automate the creation of a bootable USB Flash Drive that can be used to boot multiple Linux based distributions (one at a time).
The end result should be a bootable USB Flash drive that will get you up and running with your chosen Live Distributions, all without having to do the research and perform the steps by hand. 

How YUMI Works:

YUMI utilizes a Syslinux MBR to make the chosen drive bootable. Distributions are extracted using 7zip to the multiboot folder on the USB device, and a custom syslinux.cfg file along with distro independant configuration files are used to boot each distribution. Grub4DOS grub.exe may also be used to boot ISO files directly. 

Credits, Resources, and Third Party Tools used:

* Remnants of Cedric Tissieres's Tazusb.exe for Slitaz (slitaz@objectif-securite.ch) may reside in the YUMI script, as it was derived from UUI, which was inspired by Tazusb.exe. 
* Built using the NSIS Installer © Contributors http://nsis.sourceforge.net (use to compile the .nsi script) - http://nsis.sourceforge.net/License
* Syslinux © H. Peter Anvin http://syslinux.zytor.com (unmodified binary used)
* grub.exe Grub4DOS © the Gna! people + Chenall https://code.google.com/p/grub4dos-chenall/ (unmodified binary used) : Official Grub4DOS: http://gna.org/projects/grub4dos/
* 7-Zip is © Igor Pavlovis http://7-zip.org (unmodified binaries were used)
* Fat32format.exe © Tom Thornhill Ridgecorp Consultants http://www.ridgecrop.demon.co.uk (unmodified binary used)
* Firadisk.img © Panot Joonkhiaw Karyonix http://reboot.pro/8804/ (unmodified binary used)
* dd.exe © John Newbigin http://www.chrysocome.net/ (unmodified binary used)
* mke2fs © Matt <mattwu@163.com> http://www.ext2fsd.com (unmodified binary used)
* Tuffy Font © Thatcher Ulrich http://tulrich.com/fonts/ (unmodified binary used)
* iPXE wimboot © Michael Brown and the iPXE project team http://ipxe.org/wimboot (unmodified binary used)
* Wimlib Copyright © Eric Biggers https://wimlib.net/ (unmodified binary used)

Frequently Asked Questions can be found at: 
https://www.pendrivelinux.com/yumi-multiboot-usb-creator/#FAQ

Changelog can be found at:
https://www.pendrivelinux.com/yumi-multiboot-usb-creator/#Changelog