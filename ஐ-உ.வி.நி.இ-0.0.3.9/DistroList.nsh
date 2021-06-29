/*
 * This file is part of YUMI
 *
 * YUMI is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * any later version.
 *
 * YUMI is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with YUMI. If not, see <http://www.gnu.org/licenses/>.
 */

; ------------ Distro List -------------- 

Function SetISOFileName ; Distro2Check (Name of the Distro), ISO2Check2 (The ISO File name before extraction), Download2Get (Download Link), Path2Name (Final destination/Name of File), GimmeSize (Size of the File), DistroPath (Config File to Write To), File2Check (file to check for before adding Menu entry), Homepage, OfficialName
 
     !insertmacro SetISOFileNames "--- Ubuntu 32/64 Bit ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Ubuntu" "ubuntu*desktop*.iso" "https://www.ubuntu.com/download/desktop" "casper" "linux.cfg" "https://www.ubuntu.com/desktop" "Ubuntu"
 !insertmacro SetISOFileNames "Edubuntu" "edubuntu*.iso" "https://edubuntu.org/download" "casper" "linux.cfg" "https://edubuntu.org" "Edubuntu" 
 !insertmacro SetISOFileNames "Kubuntu" "kubuntu*desktop*.iso" "https://kubuntu.org/getkubuntu/" "casper" "linux.cfg" "https://www.kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Lubuntu" "lubuntu*desktop*.iso" "https://lubuntu.net/downloads/" "casper" "linux.cfg" "https://lubuntu.net" "Lubuntu" 
 !insertmacro SetISOFileNames "Xubuntu" "xubuntu*desktop*.iso" "https://xubuntu.org/download" "casper" "linux.cfg" "https://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Ubuntu Budgie" "ubuntu-budgie*desktop*.iso" "https://ubuntubudgie.org/downloads" "casper" "linux.cfg" "https://ubuntubudgie.org/" "Ubuntu Budgie" 
 !insertmacro SetISOFileNames "Ubuntu Gnome" "ubuntu-gnome*desktop*.iso" "https://cdimage.ubuntu.com/ubuntu-gnome/releases/" "casper" "linux.cfg" "https://www.ubuntugnome.org" "Ubuntu Gnome"
 !insertmacro SetISOFileNames "Ubuntu Server" "ubuntu*server*.iso" "https://www.ubuntu.com/download/server" "NULL" "linux.cfg" "https://www.ubuntu.com/server" "Ubuntu Server"
 !insertmacro SetISOFileNames "Ubuntu Studio" "ubuntustudio*.iso" "https://ubuntustudio.org/download/" "casper" "linux.cfg" "https://ubuntustudio.org" "Ubuntu Studio" 
 !insertmacro SetISOFileNames "Emmabuntus" "emmabuntus*.iso" "https://sourceforge.net/projects/emmabuntus/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/emmabuntus/" "Emmabuntus" 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Linux Mint 32/64 Bit ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""  
   
 !insertmacro SetISOFileNames "Linux Mint" "linuxmint*.iso" "https://www.linuxmint.com/download.php" "casper" "linux.cfg" "https://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint Debian" "lmde*.iso" "https://www.linuxmint.com/download_lmde.php" "casper" "linux.cfg" "https://www.linuxmint.com" "Linux Mint"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- CentOS 32/64 Bit ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""

 !insertmacro SetISOFileNames "CentOS Live" "CentOS*LIVE*.iso" "https://www.centos.org/download/" "NULL" "linux.cfg" "https://www.centos.org" "CentOS"
 !insertmacro SetISOFileNames "CentOS Minimal" "CentOS*Minimal*.iso" "https://www.centos.org/download/" "NULL" "linux.cfg" "https://www.centos.org" "CentOS"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Debian Live 32/64 Bit ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Debian Live" "debian-live*.iso" "https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/" "NULL" "linux.cfg" "https://www.debian.org" "Debian Live"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Fedora 32/64 Bit ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""
 
 !insertmacro SetISOFileNames "Fedora" "Fedora*Live*.iso" "https://getfedora.org/en/workstation/download/" "NULL" "linux.cfg" "https://fedoraproject.org" "Fedora"	 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- OpenSUSE ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""  

 !insertmacro SetISOFileNames "OpenSUSE" "openSUSE*.iso" "https://get.opensuse.org/desktop/" "NULL" "linux.cfg" "https://software.opensuse.org" "OpenSUSE"	 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Puppy Linux Based ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""  
	 
 !insertmacro SetISOFileNames "Puppy Linux" "*pup*.iso" "http://distro.ibiblio.org/puppylinux/puppy-fossa/fossapup64-9.5.iso" "NULL" "linux.cfg" "http://www.puppylinux.com" "Puppy Linux" 	 
 !insertmacro SetISOFileNames "BionicPup" "bionicpup*.iso" "https://distro.ibiblio.org/puppylinux/puppy-bionic/" "NULL" "linux.cfg" "http://wikka.puppylinux.com/BionicPup" "Bionic Puppy 8"	
 !insertmacro SetISOFileNames "Tahrpup" "tahr*.iso" "https://distro.ibiblio.org/puppylinux/puppy-tahr/iso/tahrpup64-6.0.5/tahr64-6.0.5.iso" "NULL" "linux.cfg" "http://puppylinux.org/wikka/tahrpup" "Tahrpup"
 !insertmacro SetISOFileNames "Fatdog64" "Fatdog64*.iso" "https://distro.ibiblio.org/fatdog/iso/" "NULL" "linux.cfg" "https://distro.ibiblio.org/fatdog/web/" "Fatdog64"
 !insertmacro SetISOFileNames "Lucid Puppy Linux" "lupu*.iso" "https://distro.ibiblio.org/pub/linux/distributions/puppylinux/puppy-5.2.8/lupu-528.005.iso" "NULL" "linux.cfg" "http://www.puppylinux.org" "Puppy Linux"
 !insertmacro SetISOFileNames "Precise Puppy Linux" "precise*.iso" "https://distro.ibiblio.org/quirky/precise-5.7.1/precise-5.7.1.iso" "NULL" "linux.cfg" "http://bkhome.org/blog/?viewDetailed=03063" "Precise Puppy"
 !insertmacro SetISOFileNames "Puppy Arcade" "slacko_arcade*.iso" "https://archive.org/download/Puppy_Linux_Puppy_Arcade/slacko_arcade.iso" "NULL" "linux.cfg" "" ""	
 ;Not ready Yet !insertmacro SetISOFileNames "Simplicity Linux" "Desktop*.iso" "http:http://simplicitylinux.org" "NULL" "linux.cfg" "http://simplicitylinux.org" "Simplicity Linux"	
 !insertmacro SetISOFileNames "Slacko Puppy" "slacko*.iso" "https://distro.ibiblio.org/puppylinux/puppy-slacko-6.3.2/64/slacko64-6.3.2-uefi.iso" "NULL" "linux.cfg" "http://slacko.eezy.xyz" "Slacko Puppy" 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Other Distros 32/64 Bit ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""	 

 !insertmacro SetISOFileNames "Academix" "academix*.iso" "https://sourceforge.net/projects/academix/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/academix/" "Academix"  
 !insertmacro SetISOFileNames "AntiX" "antiX*.iso" "https://sourceforge.net/projects/antix-linux/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/antix-linux/" "AntiX"   
 !insertmacro SetISOFileNames "Archbang" "archbang*.iso" "https://sourceforge.net/projects/archbang/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/archbang/" "Archbang"  
 !insertmacro SetISOFileNames "Archlinux" "archlinux*.iso" "http://mirrors.us.kernel.org/archlinux/iso/latest/" "NULL" "linux.cfg" "https://www.archlinux.org" "Archlinux"  
 !insertmacro SetISOFileNames "Bluestar Linux" "bluestar*.iso" "https://sourceforge.net/projects/bluestarlinux/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/bluestarlinux/" "Bluestar" 
 !insertmacro SetISOFileNames "Bodhi" "bodhi*.iso" "https://sourceforge.net/projects/bodhilinux/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/bodhilinux/" "Bodhi"  
 !insertmacro SetISOFileNames "CAELinux (Computer Aided Engineering)" "caelinux*.iso" "https://sourceforge.net/projects/caelinux/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/caelinux/" "CAELinux"  
 !insertmacro SetISOFileNames "Calculate Linux Desktop" "cld*.iso" "http://www.gtlib.gatech.edu/pub/calculate/release/20.6/" "NULL" "linux.cfg" "https://www.calculate-linux.org/" "Calculate Linux"
 !insertmacro SetISOFileNames "Cub Linux" "CubLinux*.iso" "https://sourceforge.net/projects/cublinux/files/latest/download" "casper" "linux.cfg" "https://sourceforge.net/projects/cublinux/" "CubLinux" 
 !insertmacro SetISOFileNames "Deepin" "deepin*.iso" "https://sourceforge.net/projects/deepin/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/deepin/" "Deepin"
 !insertmacro SetISOFileNames "Endeavour OS" "endeavour*.iso" "https://endeavouros.com/latest-release/" "NULL" "linux.cfg" "https://endeavouros.com/" "Endeavour OS"
 !insertmacro SetISOFileNames "Feren OS" "Feren*.iso" "https://sourceforge.net/projects/ferenoslinux/files/latest/download" "casper" "linux.cfg" "https://sourceforge.net/projects/ferenoslinux/" "Feren OS"
 !insertmacro SetISOFileNames "JustBrowsing" "justbrowsing64*.iso" "https://sourceforge.net/projects/justbrowsing/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/justbrowsing/" "JustBrowsing"
 !insertmacro SetISOFileNames "KDE Neon" "neon*.iso" "https://neon.kde.org/download" "casper" "linux.cfg" "https://neon.kde.org/" "KDE Neon"
 !insertmacro SetISOFileNames "KNOPPIX" "KNOPPIX*.iso" "http://ftp.knoppix.nl/os/Linux/distr/knoppix/KNOPPIX_V9.1CD-2021-01-25-EN.iso" "NULL" "linux.cfg" "https://knopper.net" "KNOPPIX"
 !insertmacro SetISOFileNames "KXStudio" "KXStudio*.iso" "https://sourceforge.net/projects/kxstudio/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/kxstudio/" "KXStudio"
 !insertmacro SetISOFileNames "LinuxFX" "linuxfx*.iso" "https://sourceforge.net/projects/linuxfxdevil/files/latest/download" "casper" "linux.cfg" "https://sourceforge.net/projects/linuxfxdevil/" "LinuxFX"
 !insertmacro SetISOFileNames "Linux Kid X" "linuxKidX*.iso" "https://sourceforge.net/projects/linuxkidx/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/linuxkidx/" "Linux Kid X" 
 !insertmacro SetISOFileNames "LXLE Desktop" "lxle*.iso" "https://sourceforge.net/projects/lxle/files/latest/download" "casper" "linux.cfg" "https://sourceforge.net/projects/lxle/" "LXLE Desktop" 
 !insertmacro SetISOFileNames "OpenMandriva" "openMandriva*.iso" "https://sourceforge.net/projects/openmandriva/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/openmandriva/" "OpenMandriva"	
 !insertmacro SetISOFileNames "Manjaro" "Manjaro*.iso" "https://manjaro.org/download/" "NULL" "linux.cfg" "https://manjaro.org" "Manjaro"
 !insertmacro SetISOFileNames "mintyMac" "minty*.iso" "http://sourceforge.net/projects/mintymacpremium/files/latest/download" "casper" "linux.cfg" "http://sourceforge.net/projects/mintymacpremium/" "MintyMac"
 !insertmacro SetISOFileNames "MX Linux" "MX*.iso" "https://sourceforge.net/projects/mx-linux/files/latest/download" "NULL" "linux.cfg" "https://mxlinux.org/" "MX Linux"   
 !insertmacro SetISOFileNames "Netrunner" "netrunner*.iso" "https://www.netrunner.com/download/" "NULL" "linux.cfg" "https://www.netrunner-os.com" "Netrunner"
 !insertmacro SetISOFileNames "OSGeo Live" "osgeo-live*.iso" "https://sourceforge.net/projects/osgeo-live/files/latest/download" "NULL" "linux.cfg" "http://sourceforge.net/projects/osgeo-live/" "OSGeo Live"
 !insertmacro SetISOFileNames "PCLinuxOS" "pclinuxos*.iso" "https://www.pclinuxos.com/?page_id=10" "NULL" "linux.cfg" "https://www.pclinuxos.com" "PCLinuxOS"
 !insertmacro SetISOFileNames "Peach OSI" "PeachOSI*.iso" "https://www.peachosi.com/content/download-patriot" "casper" "linux.cfg" "https://www.peachosi.com" "Peach OSI"
 !insertmacro SetISOFileNames "Pear Linux" "pearlinux*.iso" "https://sourceforge.net/projects/pearoslinux/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/pearoslinux/" "Pear Linux"
 !insertmacro SetISOFileNames "Peppermint" "Peppermint*.iso" "https://peppermintos.com/guide/downloading/" "NULL" "linux.cfg" "https://peppermintos.com" "Peppermint"
 !insertmacro SetISOFileNames "Pinguy OS" "Pinguy*.iso" "https://sourceforge.net/projects/pinguy-os/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/pinguy-os/" "Pinguy" 
 !insertmacro SetISOFileNames "Porteus" "porteus*.iso" "http://porteus.org/porteus-mirrors.html" "NULL" "linux.cfg" "http://porteus.org/" "Porteus"
 !insertmacro SetISOFileNames "POP!_OS" "Pop*.iso" "https://pop.system76.com/" "NULL" "linux.cfg" "https://pop.system76.com/" "POP!_OS"
 !insertmacro SetISOFileNames "Q4OS" "q4os*.iso" "https://sourceforge.net/projects/q4os/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/q4os/" "Q4OS" 
 !insertmacro SetISOFileNames "Raspberry Pi Desktop" "*rpd*.iso" "https://www.raspberrypi.org/software/raspberry-pi-desktop/" "NULL" "linux.cfg" "https://www.raspberrypi.org/software/raspberry-pi-desktop/" "Raspberry Pi"
 !insertmacro SetISOFileNames "Skywave" "skywave*.iso" "https://sourceforge.net/projects/skywavelinux/files/latest/download" "casper" "linux.cfg" "https://sourceforge.net/projects/skywavelinux/" "Skywave Linux"  
 !insertmacro SetISOFileNames "SLAX (Tiny Slackware Based Distro)" "slax*.iso" "https://www.slax.org/#purchase" "NULL" "linux.cfg" "https://slax.org" "SLAX"
 !insertmacro SetISOFileNames "Slitaz (Another Tiny Distro)" "slitaz*.iso" "https://www.slitaz.org/en/get/" "NULL" "linux.cfg" "https://www.slitaz.org" "SliTaZ"
 !insertmacro SetISOFileNames "LuninuX OS" "LuninuxOS*Desktop*.iso" "https://sourceforge.net/projects/luninuxos/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/luninuxos/" "LuninuX OS" 
 !insertmacro SetISOFileNames "Solus" "Solus*.iso" "https://getsol.us/download/" "NULL" "linux.cfg" "https://getsol.us/home/" "Solus"
 !insertmacro SetISOFileNames "SolydX" "solydx*.iso" "https://solydxk.com/downloads.php" "NULL" "linux.cfg" "https://solydxk.com" "SolydX Linux" 
 !insertmacro SetISOFileNames "Sparky Linux" "sparkylinux*.iso" "https://sourceforge.net/projects/sparkylinux/files/latest/download" "NULL" "linux.cfg" "http://sourceforge.net/projects/sparkylinux/" "Sparky Linux" 
 !insertmacro SetISOFileNames "Sugar on a Stick" "Fedora-Live-SoaS*.iso" "https://wiki.sugarlabs.org/go/Sugar_on_a_Stick" "NULL" "linux.cfg" "https://wiki.sugarlabs.org/go/Sugar_on_a_Stick" "Sugar On A Stick"
 !insertmacro SetISOFileNames "Terralinux" "Terra*.iso" "https://sourceforge.net/projects/terralinuxos/files/latest/download" "NULL" "linux.cfg" "http://sourceforge.net/projects/terralinuxos/" "Terralinux"
 !insertmacro SetISOFileNames "Uberstudent" "uberstudent*.iso" "https://sourceforge.net/projects/uberstudent/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/uberstudent/" "Uberstudent"
 !insertmacro SetISOFileNames "Ultimate Edition" "ultimate-edition*.iso" "https://sourceforge.net/projects/ultimateedition/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/ultimateedition/" "Ultimate Edition"
 !insertmacro SetISOFileNames "Xiaopan (Penetration Testing)" "Xiaopan*.iso" "https://sourceforge.net/projects/xiaopanos/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/xiaopanos/" "Xiaopan" 
 !insertmacro SetISOFileNames "Zorin OS Core" "zorin*.iso" "https://zorinos.com/download/" "NULL" "linux.cfg" "https://zorin-os.com/" "Zorin OS"
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Anonymous Browsers ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
 
 !insertmacro SetISOFileNames "Kodachi (Anonymous Browsing)" "kodachi*.iso" "https://sourceforge.net/projects/linuxkodachi/files/latest/download" "NULL" "anon.cfg" "https://sourceforge.net/projects/linuxkodachi/" "Kodachi"
 !insertmacro SetISOFileNames "Liberte (Anonymous Browsing)" "liberte*.zip" "https://sourceforge.net/projects/liberte/files/latest/download" "NULL" "anon.cfg" "http://sourceforge.net/projects/liberte/" "Liberte" 
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Antivirus Tools ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Antivirus Live CD (Virus Scanner)" "AntivirusLiveCD*.iso" "https://sourceforge.net/projects/antiviruslivecd/files/latest/download" "NULL" "antivirus.cfg" "https://sourceforge.net/projects/antiviruslivecd/" "Antivirus Live CD"  
 !insertmacro SetISOFileNames "AVIRA AntiVir Rescue CD (Virus Scanner)" "*escue-system.iso" "https://download.avira.com/download/rescue-system/avira-rescue-system.iso" "NULL" "antivirus.cfg" "https://www.avira.com/en/downloads#tab_a3_0" "Avira"
 !insertmacro SetISOFileNames "Dr.Web LiveDisk" "drweb-livedisk*.iso" "https://download.geo.drweb.com/pub/drweb/livedisk/drweb-livedisk-900-cd.iso" "NULL" "antivirus.cfg" "https://free.drweb.com/aid_admin/" "Dr.Web"  
 !insertmacro SetISOFileNames "ESET SysRescue Live" "eset*.iso" "https://www.eset.com/int/support/sysrescue/#download" "NULL" "antivirus.cfg" "https://www.eset.com/int/support/sysrescue/" "ESET SysRecue Live" 
 !insertmacro SetISOFileNames "GDATA Rescue CD" "G*.iso" "https://secure.gd/dl-int-bootcd" "NULL" "antivirus.cfg" "https://www.gdatasoftware.com" "GDATA"
 !insertmacro SetISOFileNames "Kaspersky Rescue Disk (Antivirus Scanner)" "krd.iso" "https://rescuedisk.s.kaspersky-labs.com/updatable/2018/krd.iso" "NULL" "antivirus.cfg" "https://support.kaspersky.com/krd18" "Kaspersky"
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- System Tools ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Acronis True Image" "Acronis*.iso" "NONE" "NULL" "system.cfg" "https://www.acronis.com" "Acronis True-Image" 
 !insertmacro SetISOFileNames "BackBox (Penetration Testing)" "backbox*.iso" "https://www.backbox.org/download/" "NULL" "system.cfg" "https://linux.backbox.org/" "BackBox"
 !insertmacro SetISOFileNames "Boot Repair Disk" "boot-repair-disk*.iso" "https://sourceforge.net/projects/boot-repair-cd/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/boot-repair-cd/" "Boot Repair Disk"
 !insertmacro SetISOFileNames "Caine (Forensics)" "caine*.iso" "https://www.caine-live.net/page5/page5.html" "NULL" "system.cfg" "https://www.caine-live.net/" "Caine" 
 !insertmacro SetISOFileNames "Clonezilla (Backup + Clone Tool)" "clonezilla*.iso" "https://clonezilla.org/downloads.php" "NULL" "system.cfg" "https://clonezilla.org" "Clonezilla"
 !insertmacro SetISOFileNames "DBAN (Hard Drive Nuker)" "dban*.iso" "https://sourceforge.net/projects/dban/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/dban/" "DBAN"
 !insertmacro SetISOFileNames "Demon Linux (Penetration Testing)" "demon*.iso" "https://demonlinux.com/" "NULL" "system.cfg" "https://demonlinux.com/" "Demon Linux"
 !insertmacro SetISOFileNames "DRBL (Diskless Remote Boot in Linux)" "drbl-live*.iso" "https://sourceforge.net/projects/drbl/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/drbl/" "DRBL"	 
 !insertmacro SetISOFileNames "EASEUS Disk Copy (Disk Cloning Tool)" "Disk*.iso" "https://download.easeus.com/free/EaseUS_DiskCopy_Home.exe" "NULL" "system.cfg" "https://www.easeus.com/disk-copy/home-edition/" "EASEUS Disk Copy"
 !insertmacro SetISOFileNames "Finnix x86/64- BIOS ONLY" "finnix*.iso" "https://www.finnix.org/Download" "NULL" "system.cfg" "https://www.finnix.org/" "Finnix"
 !insertmacro SetISOFileNames "G4L (Ghost For Linux)" "g4l*.iso" "https://sourceforge.net/projects/g4l/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/g4l/" "G4L"
 !insertmacro SetISOFileNames "GParted (Partition Tools)" "gparted-live*.iso" "https://sourceforge.net/projects/gparted/files/latest" "NULL" "system.cfg" "https://sourceforge.net/projects/gparted/" "gParted"
 !insertmacro SetISOFileNames "GRML (system rescue)" "grml*.iso" "https://grml.org/download/" "NULL" "system.cfg" "https://grml.org" "GRML"
 !insertmacro SetISOFileNames "Kali (Penetration Testing)" "kali*.iso" "https://www.kali.org/downloads/" "NULL" "system.cfg" "https://www.kali.org/" "Kali"
 !insertmacro SetISOFileNames "Memtest86 (Memory Testing Tool)" "memtest86-usb.zip" "https://www.memtest86.com/download.htm" "NULL" "system.cfg" "https://www.memtest86.com/" "Memtest86" 
 !insertmacro SetISOFileNames "Memtest86+ (Memory Testing Tool) BIOS ONLY" "memtest86+-5.01.zip" "https://www.memtest.org/download/5.31b/memtest86+-5.31b.bin.zip" "NULL" "system.cfg" "https://www.memtest.org" "Memtest86+" 
 !insertmacro SetISOFileNames "Matriux (Penetration Testing)" "Matriux*.iso" "https://sourceforge.net/projects/matriux/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/matriux/" "Matriux"
 !insertmacro SetISOFileNames "Ophcrack (Password Finder)" "ophcrack*.iso" "https://sourceforge.net/projects/ophcrack/files/ophcrack-livecd/3.6.0/" "NULL" "system.cfg" "https://sourceforge.net/projects/ophcrack/" "Ophcrack"
 !insertmacro SetISOFileNames "Rescatux" "rescatux*.iso" "https://sourceforge.net/projects/rescatux/files/latest/download" "NULL" "system.cfg" "https://www.supergrubdisk.org/rescatux/" "Rescatux" 
 !insertmacro SetISOFileNames "Rescuezilla (Backup + Clone Tool)" "rescuezilla*.iso" "https://rescuezilla.com/download.html" "NULL" "system.cfg" "https://rescuezilla.com" "Rescuezilla" 
 !insertmacro SetISOFileNames "Redo Backup And Recovery (Recovery Tools)" "redobackup-livecd*.iso" "https://sourceforge.net/projects/redobackup/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/redobackup/" "RedoBackup"
 !insertmacro SetISOFileNames "Rip Linux (Recovery Distro) - BIOS ONLY" "RIPLinuX*.iso" "https://sourceforge.net/projects/riplinuxmeta4s/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/riplinuxmeta4s/" "RIP Linux"
 !insertmacro SetISOFileNames "System Rescue CD" "systemrescue*.iso" "https://sourceforge.net/projects/systemrescuecd/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/systemrescuecd/" "System Rescue"
 !insertmacro SetISOFileNames "Trinity Rescue Kit - BIOS ONLY" "trinity-rescue-kit*.iso" "https://trinityhome.org/trinity_rescue_kit_download/" "NULL" "system.cfg" "https://trinityhome.org" "TRK"
 !insertmacro SetISOFileNames "Ultimate Boot CD (Diagnostics Tools) - BIOS ONLY" "ubcd5*.iso" "http://www.ultimatebootcd.com/download/redirect.php" "NULL" "system.cfg" "http://www.ultimatebootcd.com" "Ultimate Boot CD"
 !insertmacro SetISOFileNames "Wifislax (Wireless Penetration Testing)" "wifislax*.iso" "https://www.wifislax.com/category/download/" "NULL" "system.cfg" "https://www.wifislax.com/" "Wifislax"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Other OS/Tools ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Falcon 4 Boot CD - BIOS ONLY" "F4UBCD*.iso" "NONE" "NULL" "other.cfg" "" ""
 !insertmacro SetISOFileNames "Hiren's Boot CD - BIOS ONLY" "Hiren*.iso" "NONE" "NULL" "other.cfg" "" ""
 !insertmacro SetISOFileNames "Hiren's BootCD PE" "HBCD*.iso" "https://www.hirensbootcd.org/download/" "NULL" "other.cfg" "https://www.hirensbootcd.org/" "Hiren's BootCD PE"
 !insertmacro SetISOFileNames "LinuxCNC" "linuxcnc*.iso" "https://linuxcnc.org/downloads/" "NULL" "other.cfg" "https://linuxcnc.org/" "Linux CNC"
 !insertmacro SetISOFileNames "Windows 10 Installer" "*.iso" "NONE" "NULL" "other.cfg" "" "" 
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Unlisted Bootable ISOs ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" "" 	

!insertmacro SetISOFileNames "Try Unlisted ISO" "*.iso" "NONE" "NULL" "unlisted.cfg" "" "" 
 
FunctionEnd