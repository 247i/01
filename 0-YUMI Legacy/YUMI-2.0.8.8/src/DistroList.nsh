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
 * along with YUMI.  If not, see <http://www.gnu.org/licenses/>.
 */

; ------------ Distro List -------------- 

Function SetISOFileName ; Distro2Check (Name of the Distro), ISO2Check2 (The ISO File name before extraction), Download2Get (Download Link), Path2Name (Final destination/Name of File), GimmeSize (Size of the File), Config2Use (Config File to Write To), File2Check (file to check for before adding Menu entry), Homepage, OfficialName

     !insertmacro SetISOFileNames "--- Ubuntu 32/64 Bit ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Ubuntu" "ubuntu*desktop*.iso" "https://www.ubuntu.com/download/desktop" "casper" "linux.cfg" "https://www.ubuntu.com/desktop" "Ubuntu"
 !insertmacro SetISOFileNames "Kubuntu" "kubuntu*desktop*.iso" "https://kubuntu.org/getkubuntu/" "casper" "linux.cfg" "https://kubuntu.org" "Kubuntu"
 !insertmacro SetISOFileNames "Lubuntu" "lubuntu*desktop*.iso" "https://lubuntu.net/downloads/" "casper" "linux.cfg" "https://lubuntu.net" "Lubuntu" 
 !insertmacro SetISOFileNames "Xubuntu" "xubuntu*desktop*.iso" "https://xubuntu.org/download" "casper" "linux.cfg" "https://xubuntu.org" "Xubuntu"
 !insertmacro SetISOFileNames "Ubuntu Budgie" "ubuntu-budgie*desktop*.iso" "https://ubuntubudgie.org/downloads" "casper" "linux.cfg" "https://ubuntubudgie.org/" "Ubuntu Budgie" 
 !insertmacro SetISOFileNames "Ubuntu Gnome" "ubuntu-gnome*desktop*.iso" "https://cdimage.ubuntu.com/ubuntu-gnome/releases/xenial/release/" "casper" "linux.cfg" "https://www.ubuntugnome.org" "Ubuntu Gnome"
 !insertmacro SetISOFileNames "Ubuntu Mate" "ubuntu-mate*desktop*.iso" "https://cdimage.ubuntu.com/ubuntu-mate/releases/groovy/release/" "casper" "linux.cfg" "https://ubuntu-mate.org/" "Ubuntu Mate" 
 !insertmacro SetISOFileNames "Ubuntu Server" "ubuntu*server*.iso" "https://ubuntu.com/download/server" "NULL" "linux.cfg" "https://www.ubuntu.com/server" "Ubuntu Server"
 !insertmacro SetISOFileNames "Ubuntu Studio" "ubuntustudio*.iso" "https://ubuntustudio.org/download" "casper" "linux.cfg" "https://ubuntustudio.org" "Ubuntu Studio" 
 !insertmacro SetISOFileNames "Emmabuntus" "emmabuntus*.iso" "https://sourceforge.net/projects/emmabuntus/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/emmabuntus/" "Emmabuntus" 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Linux Mint 32/64 Bit ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""  
   
 !insertmacro SetISOFileNames "Linux Mint" "linuxmint*.iso" "https://www.linuxmint.com/download.php" "casper" "linux.cfg" "https://www.linuxmint.com" "Linux Mint"
 !insertmacro SetISOFileNames "Linux Mint Debian Edition" "lmde*.iso" "https://www.linuxmint.com/download_lmde.php" "NULL" "linux.cfg" "https://www.linuxmint.com" "Linux Mint"


     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- CentOS 32/64 Bit ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""  
	 
 !insertmacro SetISOFileNames "CentOS Live" "CentOS*Live*.iso" "https://www.centos.org/download/" "NULL" "linux.cfg" "https://www.centos.org" "CentOS"
 !insertmacro SetISOFileNames "CentOS Installer" "CentOS*.iso" "https://www.centos.org/download/" "NULL" "linux.cfg" "https://www.centos.org" "CentOS"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Debian Live 32/64 Bit ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Debian Live" "debian-live*.iso" "https://cdimage.debian.org/cdimage/release/current-live/amd64/iso-hybrid/" "NULL" "linux.cfg" "https://www.debian.org" "Debian"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Fedora 32/64 Bit ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""
 
 !insertmacro SetISOFileNames "Fedora" "Fedora*Live*.iso" "https://getfedora.org/en/workstation/download/" "NULL" "linux.cfg" "https://getfedora.org/" "Fedora"	

 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- OpenMandriva ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""   
	 
 !insertmacro SetISOFileNames "OpenMandriva" "openMandriva*.iso" "https://sourceforge.net/projects/openmandriva/files/latest/download" "NULL" "linux.cfg" "https://www.openmandriva.org/" "OpenMandriva"	 

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- OpenSUSE ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""  

 !insertmacro SetISOFileNames "OpenSUSE" "openSUSE*.iso" "https://software.opensuse.org/distributions/leap#Live-ports" "NULL" "linux.cfg" "https://software.opensuse.org" "OpenSUSE"	 
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Puppy Linux Based ---" "" "" "" "" "" ""
	 !insertmacro SetISOFileNames "" "" "" "" "" "" ""  

 !insertmacro SetISOFileNames "Puppy Linux" "*pup*.iso" "https://distro.ibiblio.org/puppylinux/puppy-fossa/fossapup64-9.5.iso" "NULL" "linux.cfg" "puppylinux.com" "Puppy Linux" 	 
 !insertmacro SetISOFileNames "BionicPup" "bionicpup*.iso" "https://distro.ibiblio.org/puppylinux/puppy-bionic/" "NULL" "linux.cfg" "http://wikka.puppylinux.com/BionicPup" "Bionic Puppy 8"	 	 
 !insertmacro SetISOFileNames "DPup Exprimo" "Squeeze*.iso" "https://www.smokey01.com/pemasu/DpupSqueeze5X/DpupExprimo5X3621/squeeze-5.X.3.6.2.1-SCSI.iso" "NULL" "linux.cfg" "http://www.murga-linux.com/puppy/viewtopic.php?t=81528" "Dpup"
 !insertmacro SetISOFileNames "Tahrpup" "tahr*.iso" "https://distro.ibiblio.org/puppylinux/puppy-tahr/iso/tahrpup%20-6.0-CE/tahr-6.0.2_PAE.iso" "NULL" "linux.cfg" "http://oldforum.puppylinux.com/puppy/viewtopic.php?t=96178" "Tahrpup"
 !insertmacro SetISOFileNames "Fatdog64" "Fatdog64*.iso" "https://distro.ibiblio.org/fatdog/iso/Fatdog64-702.iso" "NULL" "linux.cfg" "https://distro.ibiblio.org/fatdog/web/" "Fatdog64"
 !insertmacro SetISOFileNames "Lucid Puppy Linux" "lupu*.iso" "https://distro.ibiblio.org/pub/linux/distributions/puppylinux/puppy-5.2.8/lupu-528.005.iso" "NULL" "linux.cfg" "http://wikka.puppylinux.com/Lucid" "Puppy Linux"
 !insertmacro SetISOFileNames "Precise Puppy Linux" "precise*.iso" "https://distro.ibiblio.org/quirky/precise-5.7.1/precise-5.7.1.iso" "NULL" "linux.cfg" "http://puppylinux.org/wikka/PuppyPrecise" "Precise Puppy"
 !insertmacro SetISOFileNames "Puppy Arcade" "puppy-arcade*.iso" "https://archive.org/download/Puppy_Linux_Puppy_Arcade" "NULL" "linux.cfg" "" ""	
 !insertmacro SetISOFileNames "Racy Puppy Linux" "racy*.iso" "https://distro.ibiblio.org/quirky/racy-5.5/racy-5.5.iso" "NULL" "linux.cfg" "http://wikka.puppylinux.com/Racy" "Racy Puppy Linux" 
 ;Not ready Yet !insertmacro SetISOFileNames "Simplicity Linux" "Desktop*.iso" "http:http://simplicitylinux.org" "NULL" "linux.cfg" "http://simplicitylinux.org" "Simplicity Linux"	
 !insertmacro SetISOFileNames "Slacko Puppy" "slacko*.iso" "http://slacko.eezy.xyz/download.php" "NULL" "linux.cfg" "http://slacko.eezy.xyz/" "Slacko Puppy 5.3" 
 !insertmacro SetISOFileNames "Wary Puppy Linux" "wary*.iso" "https://distro.ibiblio.org/quirky/wary-5.5/wary-5.5.iso" "NULL" "linux.cfg" "http://wikka.puppylinux.com/Wary" "Wary Puppy Linux"	 
 !insertmacro SetISOFileNames "Xenialpup" "xenialpup*.iso" "https://distro.ibiblio.org/puppylinux/puppy-xenial/64/xenialpup64-7.5-uefi.iso" "NULL" "linux.cfg" "http://wikka.puppylinux.com/Xenialpup" "Xenialpup"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Other Distros 32/64 Bit ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""	 
	 
 !insertmacro SetISOFileNames "Alpine Linux" "alpine*.iso" "https://alpinelinux.org/downloads/" "NULL" "linux.cfg" "https://alpinelinux.org/" "Alpine Linux" 
 !insertmacro SetISOFileNames "Android x86" "android-x86*.iso" "https://www.fosshub.com/Android-x86.html" "NULL" "linux.cfg" "http://www.android-x86.org/" "Android-x86"   	 
 !insertmacro SetISOFileNames "Antergos" "antergos*.iso" "https://sourceforge.net/projects/antergos/files/mirror/iso/release/antergos-19.4-x86_64.iso/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/antergos/" "Antergos"   
 !insertmacro SetISOFileNames "AntiX" "antiX*.iso" "https://sourceforge.net/projects/antix-linux/files/latest/download" "NULL" "linux.cfg" "http://sourceforge.net/projects/antix-linux/" "AntiX"   
 !insertmacro SetISOFileNames "Archbang" "archbang*.iso" "https://sourceforge.net/projects/archbang/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/archbang/" "Archbang"   
 !insertmacro SetISOFileNames "Archlinux" "archlinux*.iso" "http://mirrors.us.kernel.org/archlinux/iso/latest/" "NULL" "linux.cfg" "https://archlinux.org/" "Archlinux"  
 !insertmacro SetISOFileNames "Bluestar Linux" "bluestar*.iso" "https://sourceforge.net/projects/bluestarlinux/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/bluestarlinux/" "Bluestar"
 !insertmacro SetISOFileNames "Bodhi" "bodhi*.iso" "https://sourceforge.net/projects/bodhilinux/files/latest/download" "NULL" "linux.cfg" "http://www.bodhilinux.com" "Bodhi"  
 !insertmacro SetISOFileNames "Bunsenlabs" "bl-*.iso" "https://www.bunsenlabs.org/installation.html#downloads" "NULL" "linux.cfg" "https://www.bunsenlabs.org/" "Bunsenlabs"
 !insertmacro SetISOFileNames "CAELinux (Computer Aided Engineering)" "caelinux*.iso" "https://www.caelinux.com/CMS3/index.php/download" "NULL" "linux.cfg" "https://www.caelinux.com/" "CAELinux"  
 !insertmacro SetISOFileNames "Calculate Linux Desktop" "cld*.iso" "https://wiki.calculate-linux.org/desktop" "NULL" "linux.cfg" "https://www.calculate-linux.org/" "Calculate Linux"
 !insertmacro SetISOFileNames "ChaletOS" "chaletos*.iso" "https://sourceforge.net/projects/chaletos/files/latest/download" "casper" "linux.cfg" "https://sourceforge.net/projects/chaletos/" "ChaletOS" 
 !insertmacro SetISOFileNames "Clear Linux" "clear*.iso" "https://clearlinux.org/downloads" "NULL" "linux.cfg" "https://clearlinux.org/" "Clear Linux" 
 !insertmacro SetISOFileNames "Cub Linux" "CubLinux*.iso" "https://sourceforge.net/projects/cublinux/files/latest/download" "casper" "linux.cfg" "https://sourceforge.net/projects/cublinux/" "CubLinux" 
 !insertmacro SetISOFileNames "Damn Small Linux (DSL)" "dsl*initrd.iso" "ftp://distro.ibiblio.org/pub/linux/distributions/damnsmall/current/dsl-4.4.10-initrd.iso" "NULL" "linux.cfg" "http://www.damnsmalllinux.org" "DSL"
 !insertmacro SetISOFileNames "Deepin" "deepin*.iso" "https://sourceforge.net/projects/deepin/files/latest/download" "NULL" "linux.cfg" "https://www.deepin.org/en/" "Deepin"
 !insertmacro SetISOFileNames "Devuan" "Devuan*live.iso" "http://mirror.leaseweb.com/devuan/devuan_jessie_rc/desktop-live/" "NULL" "linux.cfg" "https://devuan.org/" "Devuan"
 !insertmacro SetISOFileNames "Endeavour OS" "endeavour*.iso" "https://endeavouros.com/latest-release/" "NULL" "linux.cfg" "https://endeavouros.com/" "Endeavour OS"
 !insertmacro SetISOFileNames "Feren OS" "Feren*.iso" "https://sourceforge.net/projects/ferenoslinux/files/latest/download" "NULL" "linux.cfg" "https://ferenos.weebly.com/" "Feren OS" 
 !insertmacro SetISOFileNames "Finnix" "Finnix*.iso" "https://www.finnix.org/Download" "NULL" "linux.cfg" "https://www.finnix.org/" "Finnix" 
 !insertmacro SetISOFileNames "GeckoLinux" "gecko*.iso" "https://geckolinux.github.io/#download" "NULL" "linux.cfg" "https://geckolinux.github.io/" "GeckoLinux"
 !insertmacro SetISOFileNames "KaOS" "kaOS*.iso" "https://sourceforge.net/projects/kaosx/files/latest/download" "NULL" "linux.cfg" "https://kaosx.us/" "KaOS"
 !insertmacro SetISOFileNames "KDE Neon" "Neon*.iso" "https://neon.kde.org/download" "NULL" "linux.cfg" "https://neon.kde.org/index" "KDE Neon"  
 !insertmacro SetISOFileNames "KNOPPIX" "KNOPPIX*.iso" "http://mirrors.sonic.net/knoppix/knoppix-dvd/KNOPPIX_V8.6-2019-08-08-EN.iso" "NULL" "linux.cfg" "http://knopper.net" "KNOPPIX"
 !insertmacro SetISOFileNames "KXStudio" "KXStudio*.iso" "https://sourceforge.net/projects/kxstudio/files/latest/download" "NULL" "linux.cfg" "http://kxstudio.sourceforge.net" "KXStudio"
 !insertmacro SetISOFileNames "Liberte (Anonymous Browsing)" "liberte*.zip" "https://sourceforge.net/projects/liberte/files/latest/download" "NULL" "linux.cfg" "https://dee.su/liberte" "Liberte"
 !insertmacro SetISOFileNames "Linux Lite" "linux-lite*.iso" "https://www.linuxliteos.com/download.php" "NULL" "linux.cfg" "https://www.linuxliteos.com/" "Linux Lite"
 !insertmacro SetISOFileNames "Linux Kid X" "linuxKidX*.iso" "https://sourceforge.net/projects/linuxkidx/files/latest/download" "NULL" "linux.cfg" "http://sourceforge.net/projects/linuxkidx/" "Linux Kid X" 
 !insertmacro SetISOFileNames "LinuxFX" "linuxfx*.iso" "https://sourceforge.net/projects/linuxfxdevil/files/latest/download" "casper" "linux.cfg" "https://www.linuxfx.org/" "LinuxFX"
 !insertmacro SetISOFileNames "LuninuX OS" "LuninuxOS*Desktop*.iso" "https://sourceforge.net/projects/luninuxos/files/latest/download" "NULL" "linux.cfg" "https://luninuxos.com/" "LuninuX OS" 
 !insertmacro SetISOFileNames "LXLE Desktop" "lxle*.iso" "https://sourceforge.net/projects/lxle/files/latest/download" "casper" "linux.cfg" "https://lxle.net/" "LXLE Desktop"  
 !insertmacro SetISOFileNames "Mageia Live CD" "Mageia*.iso" "https://www.mageia.org/en/downloads/get/?q=Mageia-8-Live-Plasma-x86_64.iso" "NULL" "linux.cfg" "https://www.mageia.org" "Mageia"
 !insertmacro SetISOFileNames "Manjaro" "Manjaro*.iso" "https://manjaro.org/download/" "NULL" "linux.cfg" "https://manjaro.org/" "Manjaro"
 !insertmacro SetISOFileNames "mintyMac" "minty*.iso" "https://sourceforge.net/projects/mintymacpremium/files/latest/download" "casper" "linux.cfg" "https://sourceforge.net/projects/mintymacpremium/" "MintyMac"
 !insertmacro SetISOFileNames "MX Linux" "MX*.iso" "https://sourceforge.net/projects/mx-linux/files/latest/download" "NULL" "linux.cfg" "https://mxlinux.org/" "MX Linux"
;Revisit !insertmacro SetISOFileNames "MultiCore" "multicore-current.iso" "http://distro.ibiblio.org/pub/linux/distributions/tinycorelinux/3.x/release/multicore-current.iso" "NULL" "linux.cfg" "http://www.tinycorelinux.com" "MultiCore"
 !insertmacro SetISOFileNames "Netrunner" "netrunner*.iso" "https://www.netrunner.com/download/" "NULL" "linux.cfg" "https://www.netrunner.com/" "Netrunner"
 !insertmacro SetISOFileNames "OSGeo Live" "osgeo-live*.iso" "https://sourceforge.net/projects/osgeo-live/files/latest/download" "NULL" "linux.cfg" "https://live.osgeo.org/" "OSGeo Live"
 !insertmacro SetISOFileNames "Parrot OS" "parrot*.iso" "https://www.parrotsec.org/download.php" "NULL" "linux.cfg" "https://www.parrotsec.org/" "Parrot OS" 
 !insertmacro SetISOFileNames "PCLinuxOS" "pclinuxos*.iso" "https://www.pclinuxos.com/?page_id=10" "NULL" "linux.cfg" "https://www.pclinuxos.com" "PCLinuxOS"
 !insertmacro SetISOFileNames "Peach OSI" "PeachOSI*.iso" "https://www.peachosi.com/Doors/DonateDownloadPageFluid.html" "casper" "linux.cfg" "https://www.peachosi.com" "Peach OSI"
 !insertmacro SetISOFileNames "Pear Linux" "pearlinux*.iso" "https://sourceforge.net/projects/pearoslinux/files/latest/download/" "NULL" "linux.cfg" "https://sourceforge.net/projects/pearoslinux/" "Pear Linux"
 !insertmacro SetISOFileNames "Peppermint" "Peppermint*.iso" "https://peppermintos.com/guide/downloading/" "NULL" "linux.cfg" "https://peppermintos.com/" "Peppermint"
 !insertmacro SetISOFileNames "Pinguy OS" "Pinguy*.iso" "https://sourceforge.net/projects/pinguy-os/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/pinguy-os/" "Pinguy" 
 !insertmacro SetISOFileNames "Porteus" "porteus*.iso" "http://porteus.org/porteus-mirrors.html" "NULL" "linux.cfg" "http://porteus.org/" "Porteus"
 ;REVISIT !insertmacro SetISOFileNames "Samurai-WTF" "samurai-0.9.5.iso" "http://sourceforge.net/projects/samurai/files/samurai/samurai-0.9.5/samurai-0.9.5.iso/download" "NULL" "linux.cfg" "http://samurai.inguardians.com/" "Samurai"
 ;REVISIT !insertmacro SetISOFileNames "Scientific Linux CERN" "boot.iso" "http://linux.web.cern.ch/linux/scientific6/docs/repository/cern/slc6X/x86_64/images/boot.iso" "NULL" "linux.cfg" "http://linux.web.cern.ch/linux/" "Scientific Linux"
 ;REVISIT uses grub !insertmacro SetISOFileNames "Semplice Linux" "semplice*.iso" "http://semplice-linux.org/download/" "NULL" "linux.cfg" "http://semplice-linux.org" "Semplice Linux" 
 !insertmacro SetISOFileNames "PureOS" "pureos*.iso" "https://www.pureos.net/download/" "NULL" "linux.cfg" "https://www.pureos.net/" "PureOS"
 !insertmacro SetISOFileNames "Q4OS" "q4os*.iso" "https://sourceforge.net/projects/q4os/files/latest/download" "NULL" "linux.cfg" "https://q4os.org/index.html" "Q4OS" 
 !insertmacro SetISOFileNames "Raspberry Pi Desktop" "*rpd*.iso" "https://www.raspberrypi.org/downloads/raspberry-pi-desktop/" "casper" "linux.cfg" "https://www.raspberrypi.org/downloads/raspberry-pi-desktop/" "Raspberry Pi Desktop" 
 !insertmacro SetISOFileNames "Slackel" "slackel*.iso" "https://sourceforge.net/projects/slackel/files/latest/download" "NULL" "linux.cfg" "https://sourceforge.net/projects/slackel/" "Slackel"
 !insertmacro SetISOFileNames "SLAX (Tiny Slackware Based Distro)" "slax*.iso" "https://www.slax.org/#purchase" "NULL" "linux.cfg" "https://slax.org" "SLAX"
 !insertmacro SetISOFileNames "Slitaz (Another Tiny Distro)" "slitaz*.iso" "https://www.slitaz.org/en/get/#rolling" "NULL" "linux.cfg" "https://www.slitaz.org/" "SliTaZ"
 !insertmacro SetISOFileNames "Skywave" "skywave*.iso" "https://sourceforge.net/projects/skywavelinux/files/latest/download" "casper" "linux.cfg" "https://skywavelinux.com/" "Skywave Linux" 
 !insertmacro SetISOFileNames "Solus" "solus*.iso" "https://getsol.us/download/" "NULL" "linux.cfg" "https://getsol.us/home/" "Solus" 
 !insertmacro SetISOFileNames "SolydX" "solydx*.iso" "https://solydxk.com/downloads/solydx/" "NULL" "linux.cfg" "https://solydxk.com" "SolydX Linux" 
 !insertmacro SetISOFileNames "Sparky Linux" "sparkylinux*.iso" "https://sourceforge.net/projects/sparkylinux/files/latest/download" "NULL" "linux.cfg" "https://sparkylinux.org" "Sparky Linux" 
 !insertmacro SetISOFileNames "Sugar on a Stick" "Fedora*SoaS*.iso" "https://download.fedoraproject.org/pub/fedora/linux/releases/32/Spins/x86_64/iso/Fedora-SoaS-Live-x86_64-32-1.6.iso" "NULL" "linux.cfg" "https://wiki.sugarlabs.org/go/Sugar_on_a_Stick" "Sugar On A Stick"
 !insertmacro SetISOFileNames "Terralinux" "Terra*.iso" "http://sourceforge.net/projects/terralinuxos/files/latest/download" "NULL" "linux.cfg" "http://sourceforge.net/projects/terralinuxos/" "Terralinux"
 !insertmacro SetISOFileNames "TinyCore (A Tiny Linux Distribution)" "tinycore*.iso" "http://www.tinycorelinux.net/downloads.html" "NULL" "linux.cfg" "https://www.tinycorelinux.com" "Trisquel"
 !insertmacro SetISOFileNames "Trisquel" "trisquel*.iso" "https://trisquel.info/en/download" "NULL" "linux.cfg" "https://trisquel.info/en" "Trisquel"
 !insertmacro SetISOFileNames "Ultimate Edition" "ultimate-edition*.iso" "https://sourceforge.net/projects/ultimateedition/files/latest/download" "NULL" "linux.cfg" "https://ultimateedition.info/" "Ultimate Edition"
 !insertmacro SetISOFileNames "Vinari OS" "Vinari*.iso" "https://vinarisoftware.wixsite.com/vinari-os" "NULL" "linux.cfg" "https://vinarisoftware.wixsite.com/vinari-os" "Vinari" 
 !insertmacro SetISOFileNames "Vinux (for visually impaired)" "vinux*.iso" "https://sourceforge.net/projects/vinuxproject/files/latest/download/" "NULL" "linux.cfg" "https://sourceforge.net/projects/vinuxproject/" "Vinux" 
 !insertmacro SetISOFileNames "Xiaopan (Penetration Testing)" "Xiaopan*.iso" "http://sourceforge.net/projects/xiaopanos/files/latest/download" "NULL" "linux.cfg" "https://xiaopan.co/" "Xiaopan" 
 !insertmacro SetISOFileNames "Zorin OS Core" "zorin*.iso" "https://zorinos.com/download/#core" "NULL" "linux.cfg" "https://zorin-os.com/" "Zorin OS"
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Anonymous Browsers ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" "" 
	 
  !insertmacro SetISOFileNames "Kodachi (Anonymous Browsing)" "kodachi*.iso" "https://sourceforge.net/projects/linuxkodachi/files/latest/download" "NULL" "anon.cfg" "https://www.digi77.com/linux-kodachi/" "Kodachi"	 
  !insertmacro SetISOFileNames "Tails (Anonymous Browsing)" "tails*.iso" "https://tails.boum.org/install/dvd-download/index.en.html" "NULL" "anon.cfg" "https://tails.boum.org/" "Tails"	 
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Antivirus Tools ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 !insertmacro SetISOFileNames "Acronis Antimalware CD" "AcronisAntimalwareScanCD.iso" "http://download.acronis.com/iso/AcronisAntimalwareScanCD.iso" "NULL" "antivirus.cfg" "http://kb.acronis.com/content/18647" "Acronis"
 !insertmacro SetISOFileNames "Antivirus Live CD (Virus Scanner)" "AntivirusLiveCD*.iso" "https://sourceforge.net/projects/antiviruslivecd/files/latest/download" "NULL" "antivirus.cfg" "https://antiviruslivecd.4mlinux.com/" "Antivirus Live CD"  
 !insertmacro SetISOFileNames "AVIRA AntiVir Rescue CD (Virus Scanner)" "rescue-system.iso" "https://download.avira.com/download/rescue-system/avira-rescue-system.iso" "NULL" "antivirus.cfg" "https://www.avira.com/en/downloads#tab_a3_0" "Avira"
 !insertmacro SetISOFileNames "Dr.Web LiveDisk" "drweb-livedisk*.iso" "https://download.geo.drweb.com/pub/drweb/livedisk/drweb-livedisk-900-cd.iso?" "NULL" "antivirus.cfg" "https://www.freedrweb.com/livecd/" "Dr.Web"  
 !insertmacro SetISOFileNames "ESET SysRescue Live" "eset*.iso" "https://www.eset.com/int/support/sysrescue/#download" "NULL" "antivirus.cfg" "https://www.eset.com/int/support/sysrescue/" "ESET SysRecue Live" 
 !insertmacro SetISOFileNames "Kaspersky Rescue Disk (Antivirus Scanner)" "krd.iso" "https://rescuedisk.s.kaspersky-labs.com/updatable/2018/krd.iso" "NULL" "antivirus.cfg" "https://support.kaspersky.com/krd18" "Kaspersky"
 !insertmacro SetISOFileNames "Norton Bootable Recovery Tool" "nbrt*.iso" "https://buy-download.norton.com/downloads/premium_services/NBRT/nbrt.iso" "NULL" "antivirus.cfg" "https://us.norton.com/support/tools/nbrt.html" "Norton"
 ;REVISIT !insertmacro SetISOFileNames "Vba32 Rescue" "vbarescue.iso" "ftp://anti-virus.by/pub/vbarescue.iso" "NULL" "antivirus.cfg" "http://www.anti-virus.by/en/vba32rescue.shtml" "Vba32 Rescue"
 !insertmacro SetISOFileNames "Windows Defender Offline" "WDO_Media*.iso" "https://go.microsoft.com/fwlink/?LinkID=234123" "NULL" "antivirus.cfg" "https://windows.microsoft.com/en-US/windows/what-is-windows-defender-offline" "Windows Defender"
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- System Tools ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 ; BROKEN !insertmacro SetISOFileNames "Acronis True Image" "Acronis_True_Image*.iso" "NONE" "NULL" "system.cfg" "http://www.acronis.com" "Acronis True-Image" 
 !insertmacro SetISOFileNames "BackBox (Penetration Testing)" "backbox*.iso" "https://www.backbox.org/download/" "NULL" "system.cfg" "https://www.backbox.org/" "BackBox"
 !insertmacro SetISOFileNames "Boot Repair Disk 32bit" "boot-repair-disk-32bit.iso" "https://sourceforge.net/projects/boot-repair-cd/files/boot-repair-disk-32bit.iso/download" "NULL" "system.cfg" "https://sourceforge.net/projects/boot-repair-cd/" "Boot Repair Disk"
 !insertmacro SetISOFileNames "Boot Repair Disk 64bit" "boot-repair-disk-64bit.iso" "https://sourceforge.net/projects/boot-repair-cd/files/boot-repair-disk-64bit.iso/download" "NULL" "system.cfg" "https://sourceforge.net/projects/boot-repair-cd/" "Boot Repair Disk"
 !insertmacro SetISOFileNames "Caine (Forensics)" "caine*.iso" "https://www.caine-live.net/page5/page5.html" "NULL" "system.cfg" "https://www.caine-live.net/" "Caine" 
 !insertmacro SetISOFileNames "Clonezilla (Backup + Clone Tool)" "clonezilla*.iso" "https://sourceforge.net/projects/clonezilla/files/latest/download" "NULL" "system.cfg" "https://clonezilla.org" "Clonezilla"
 !insertmacro SetISOFileNames "DBAN (Hard Drive Nuker)" "dban*.iso" "https://sourceforge.net/projects/dban/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/dban/" "DBAN"
 !insertmacro SetISOFileNames "DRBL (Diskless Remote Boot in Linux)" "drbl-live*.iso" "https://sourceforge.net/projects/drbl/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/drbl/" "DRBL"	 
 !insertmacro SetISOFileNames "G4L (Ghost For Linux)" "g4l*.iso" "https://sourceforge.net/projects/g4l/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/g4l/" "G4L"
 !insertmacro SetISOFileNames "GParted (Partition Tools)" "gparted-live*.iso" "https://sourceforge.net/projects/gparted/files/latest" "NULL" "system.cfg" "https://sourceforge.net/projects/gparted/" "GParted"
 !insertmacro SetISOFileNames "GRML (system rescue)" "grml*.iso" "https://grml.org/download/" "NULL" "system.cfg" "https://grml.org" "GRML"
 !insertmacro SetISOFileNames "HD Sentinel (HDD Diagnostics)" "hdsdos_cd*.zip" "https://www.hdsentinel.com/hdsdos/hdsdos_cd.zip" "NULL" "system.cfg" "https://www.hdsentinel.com/" "HD Sentintel" 
;REVISIT !insertmacro SetISOFileNames "HDT (Hardware Detection Tool)" "hdt-0.5.2.img" "http://www.hdt-project.org/raw-attachment/wiki/hdt-0.5.0/hdt-0.5.2.img" "NULL" "system.cfg" "http://hdt-project.org" "HDT" 
 !insertmacro SetISOFileNames "Kali (Penetration Testing)" "kali*.iso" "https://www.kali.org/downloads/" "NULL" "system.cfg" "https://www.kali.org/" "Kali"
 !insertmacro SetISOFileNames "Memtest86+ (Memory Testing Tool)" "memtest86+*.bin.zip" "http://www.memtest.org/download/5.31b/memtest86+-5.31b.bin.zip" "NULL" "system.cfg" "https://www.memtest.org" "Memtest86+" 
 !insertmacro SetISOFileNames "Matriux (Penetration Testing)" "Matriux*.iso" "https://sourceforge.net/projects/matriux/files/latest/download" "NULL" "system.cfg" "https://www.matriux.com" "Matriux"
 !insertmacro SetISOFileNames "Offline NT Password & Registry Editor" "usb*.zip" "https://pogostick.net/~pnh/ntpasswd/usb140201.zip" "NULL" "system.cfg" "https://pogostick.net/~pnh/ntpasswd/" "Offline NT"
;REVISIT !insertmacro SetISOFileNames "OpenMediaVault" "openmediavault*.iso" "http://sourceforge.net/projects/openmediavault/files/0.5.0.24/" "NULL" "system.cfg" "http://www.openmediavault.org/" "OpenMediaVault"
 !insertmacro SetISOFileNames "Ophcrack (no tables)" "ophcrack-notables-livecd-3.6.0.iso" "https://sourceforge.net/projects/ophcrack/files/ophcrack-livecd/3.6.0/ophcrack-notables-livecd-3.6.0.iso/download" "NULL" "system.cfg" "https://sourceforge.net/projects/ophcrack/" "Ophcrack"
 !insertmacro SetISOFileNames "Ophcrack XP (Password Finder)" "ophcrack-xp-livecd-3.6.0.iso" "https://downloads.sourceforge.net/ophcrack/ophcrack-xp-livecd-3.6.0.iso" "NULL" "system.cfg" "https://sourceforge.net/projects/ophcrack/" "Ophcrack"
 !insertmacro SetISOFileNames "Ophcrack Vista/7 (Password Finder)" "ophcrack-vista-livecd-3.6.0.iso" "https://downloads.sourceforge.net/ophcrack/ophcrack-vista-livecd-3.6.0.iso" "NULL" "system.cfg" "https://sourceforge.net/projects/ophcrack/" "Ophcrack"
 !insertmacro SetISOFileNames "OSFClone (Disk Cloning Tool)" "osfclone.iso" "https://www.osforensics.com/downloads/osfclone.1.2.1000.iso" "NULL" "system.cfg" "https://www.osforensics.com/tools/create-disk-images.html" "OSFClone"
 !insertmacro SetISOFileNames "Parted Magic (Partition Tools)" "pmagic*.iso" "NONE" "NULL" "system.cfg" "https://partedmagic.com" "Parted Magic"
 !insertmacro SetISOFileNames "PING (Partimg Is Not Ghost)" "PING*.iso" "https://ping.windowsdream.com/#download" "NULL" "system.cfg" "https://ping.windowsdream.com" "PING"
 !insertmacro SetISOFileNames "POP!_OS" "Pop*.iso" "https://pop.system76.com/" "NULL" "linux.cfg" "https://pop.system76.com/" "POP!_OS"
 !insertmacro SetISOFileNames "Quick Save Live (Recovery Tools)" "Quick-Save-Live*.iso" "https://sourceforge.net/projects/quick-save-live/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/quick-save-live/" "Quick Save Live"
 !insertmacro SetISOFileNames "Redo Backup And Recovery (Recovery Tools)" "redobackup-livecd*.iso" "https://sourceforge.net/projects/redobackup/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/redobackup/" "RedoBackup"
 !insertmacro SetISOFileNames "Rescatux" "rescatux*.iso" "https://www.supergrubdisk.org/category/download/rescatuxdownloads/rescatux-stable/" "NULL" "system.cfg" "https://www.supergrubdisk.org/rescatux/" "Rescatux" 
 !insertmacro SetISOFileNames "Rescuezilla (Backup + Clone Tool)" "rescuezilla*.iso" "https://rescuezilla.com/download.html" "NULL" "system.cfg" "https://rescuezilla.com" "Rescuezilla" 
 !insertmacro SetISOFileNames "Rip Linux (Recovery Distro)" "RIPLinuX*.iso" "https://sourceforge.net/projects/riplinuxmeta4s/files/latest/download" "NULL" "system.cfg" "https://sourceforge.net/projects/riplinuxmeta4s/" "RIP Linux"
 !insertmacro SetISOFileNames "System Rescue" "systemrescue*.iso" "http://sourceforge.net/projects/systemrescuecd/files/latest/download" "NULL" "system.cfg" "https://www.system-rescue.org/" "System Rescue"
 !insertmacro SetISOFileNames "Trinity Rescue Kit" "trinity-rescue-kit*.iso" "https://trinityhome.org/trinity_rescue_kit_download/" "NULL" "system.cfg" "https://trinityhome.org" "TRK"
 !insertmacro SetISOFileNames "Ultimate Boot CD (Diagnostics Tools)" "ubcd*.iso" "https://www.ultimatebootcd.com/download.html" "NULL" "system.cfg" "https://www.ultimatebootcd.com" "Ultimate Boot CD"
 !insertmacro SetISOFileNames "Wifislax (Wireless Penetration Testing)" "wifislax*.iso" "https://www.wifislax.com/category/download/nuevas-versiones/" "NULL" "system.cfg" "https://www.wifislax.com/" "Wifislax"
;REVISIT filename contains spaces !insertmacro SetISOFileNames "XIAOPAN (Wireless Penetration Testing)" "XIAOPAN*.iso" "http://sourceforge.net/projects/xiaopanos/files/latest/download" "NULL" "system.cfg" "http://xiaopan.co/forums/" "XIAOPAN"

     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Other OS/Tools ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
;Unknown status !insertmacro SetISOFileNames "Linux Live Tools for OCZ" "ocz_tools*.iso" "NONE" "NULL" "other.cfg" "http://www.ocztechnologyforum.com/forum/showthread.php?99275-NEW!-Bootable-Linux-based-tools-for-OCZ-SSD-s" "OCZ" 
 !insertmacro SetISOFileNames "Falcon 4 Boot CD" "F4UBCD*.iso" "NONE" "NULL" "other.cfg" "" ""
 !insertmacro SetISOFileNames "Hiren's Boot CD" "Hiren*.iso" "NONE" "NULL" "other.cfg" "" ""
 !insertmacro SetISOFileNames "Hiren's Boot CD PE" "HBCD_PE*.iso" "NONE" "NULL" "hirens.lst" "" "" 
 !insertmacro SetISOFileNames "LinuxCNC" "linuxcnc*.iso" "https://linuxcnc.org/downloads/" "NULL" "other.cfg" "https://linuxcnc.org/" "Linux CNC"
 !insertmacro SetISOFileNames "Medicat (must use NTFS format)" "medicat*.iso" "NONE" "NULL" "other.cfg" "" "" 
 !insertmacro SetISOFileNames "Sergei Strelec" "*sergei*strelec*.iso" "NONE" "NULL" "other.cfg" "" "" 
 !insertmacro SetISOFileNames "Super Grub2 Disk" "super_grub2*.iso" "https://sourceforge.net/projects/supergrub2/files/latest/download" "NULL" "other.cfg" "https://www.supergrubdisk.org/" "Super Grub2 Disk" 
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Windows to Go/Installers ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
	 
 ;!insertmacro SetISOFileNames "Windows 10 Installer" "*.iso" "NONE" "NULL" "menu.lst" "" "" 
 ; For Syslinux --- !insertmacro SetISOFileNames "Windows Vista/7/8" "*.iso" "NONE" "NULL" "other.cfg" "" ""
 !insertmacro SetISOFileNames "Windows to Go (Virtual Hard Disk)" "*.iso" "NONE" "casper" "win2go.lst" "" "" 
 !insertmacro SetISOFileNames "Multiple Windows Vista/7/8/10 Installers -wimboot" "*.iso" "NONE" "NULL" "win.lst" "" ""  
 !insertmacro SetISOFileNames "Multiple Windows Vista/7/8/10 Installers -bootmgr" "*.iso" "NONE" "NULL" "win.lst" "" ""   
 !insertmacro SetISOFileNames "Single Windows Vista/7/8/10 Installer" "*.iso" "NONE" "NULL" "win.lst" "" ""  
 !insertmacro SetISOFileNames "Single Windows XP Installer" "*.iso" "NONE" "NULL" "win.lst" "" ""   
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Windows PE Builds ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" "" 
 
 !insertmacro SetISOFileNames "Single Windows PE" "*.iso" "NONE" "NULL" "pe.lst" "" ""   
 !insertmacro SetISOFileNames "Multiple Windows PE -bootmgr" "*.iso" "NONE" "NULL" "pe.lst" "" ""  
 ;REVISIT !insertmacro SetISOFileNames "Multiple Windows PE -wimboot" "*.iso" "NONE" "NULL" "pe.lst" "" ""   
 
     !insertmacro SetISOFileNames "" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "--- Try an Unlisted ISO ---" "" "" "" "" "" ""
     !insertmacro SetISOFileNames "" "" "" "" "" "" "" 	 
 
; REVISIT !insertmacro SetISOFileNames "Try Unlisted ISO (Virtual Hard Disk DD)" "*.iso" "NONE" "NULL" "vhd.lst" "" ""  
; REVISIT !insertmacro SetISOFileNames "Try Unlisted ISO (Virtual Hard Disk)" "*.iso" "NONE" "NULL" "vhd.lst" "" ""   
 !insertmacro SetISOFileNames "Try Unlisted ISO (GRUB Partition 4)" "*.iso" "NULL" "NULL" "grubpart4.lst" "" "" 
 !insertmacro SetISOFileNames "Try Unlisted ISO (GRUB)" "*.iso" "NONE" "NULL" "menu.lst" "" "" 
 !insertmacro SetISOFileNames "Try Unlisted ISO (GRUB from RAM)" "*.iso" "NONE" "NULL" "grubram.lst" "" ""
 !insertmacro SetISOFileNames "Try Unlisted ISO (via SYSLINUX)" "*.iso" "NONE" "NULL" "unlisted.cfg" "" "" 	 
 
FunctionEnd