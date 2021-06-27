YUMI UEFI (Your Universal Multiboot Integrator) � https://www.pendrivelinux.com (covered under GNU GPL License) - see YUMI-Copying

Background of YUMI:

YUMI is an easy to use Multiboot script created using NSIS. YUMI's purpose is to help automate the creation of a bootable USB Flash Drive that can be used to boot multiple Linux based distributions (one at a time).
The end result should be a bootable USB Flash drive that will get you up and running with your chosen Live Distributions, all without having to do the research and perform the steps by hand. 

How YUMI Works:

YUMI currently utilizes GRUB2 for Legacy BIOS and UEFI booting. Distribution ISO files are copied directly or extracted using 7zip to the multiboot folder on the USB device. Configuration files are used to house the menus used to boot each distribution. 

Credits, Resources, and Third Party Tools used:

* Remnants of Cedric Tissieres's Tazusb.exe for Slitaz (slitaz@objectif-securite.ch) may reside in the YUMI script, as it was derived from UUI, which was originally inspired by Tazusb.exe. 
* Created with NSIS Installer � Contributors http://nsis.sourceforge.net (needed to compile the YUMI.nsi script) - http://nsis.sourceforge.net/License
* A1ive's modified version of GRUB2 � A1ive https://github.com/a1ive/grub (unmodified binaries used)
* Grub4Dos � Chenall https://github.com/chenall/grub4dos (unmodified binary used)
* 7-Zip is � Igor Pavlovis http://7-zip.org (unmodified binaries used)
* Fat32format.exe � Tom Thornhill Ridgecorp Consultants http://www.ridgecrop.demon.co.uk (unmodified binary used)
* Tuffy Font � Thatcher Ulrich http://tulrich.com/fonts/ (unmodified binary used)

Additional instructions and information for YUMI can be found HERE: https://www.pendrivelinux.com/yumi-multiboot-usb-creator/

Frequently Asked Questions can be found at: 
https://www.pendrivelinux.com/yumi-multiboot-usb-creator/#FAQ

Recent changelog can be found at:
https://www.pendrivelinux.com/yumi-multiboot-usb-creator/#Changelog