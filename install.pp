#  First, setup defaults
Exec {
  user => 'root',
  group => 'root',
  path => '/bin:/usr/bin',
}

Package {
  require => Exec ['apt-update'],
}


#  Second add all repos, setup defaults

## Netflix repo
#exec { 'add-netflix-repo':
#  command => 'sudo apt-add-repository ppa:ehoover/compholio',
#  creates => '/etc/apt/sources.list.d/ehoover-compholio-quantal.list',
#  before => Exec['add-chrome-repo'],
#}

# Sigil repo
exec { 'add-sigil-repo':
  command => '/usr/bin/apt-add-repository ppa:rgibert/ebook',
  creates => '/etc/apt/sources.list.d/rgibert-ebook-quantal.list',
  before => Exec['add-chrome-repo'],
}

# Handbrake repo
exec { 'add-handbrake-repo':
  command => '/usr/bin/apt-add-repository ppa:stebbins/handbrake-releases',
  creates => '/etc/apt/sources.list.d/stebbins-handbrake-releases-quantal.list',
  before => Exec['add-chrome-repo'],
}

# Google Chrome repo
exec { 'add-chrome-repo':
  command => '/usr/bin/wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | /usr/bin/sudo apt-key add -; /usr/bin/sudo sh -c \'/bin/echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list\'',
  creates => '/etc/apt/sources.list.d/google.list',
  before => Exec['add-chrome-repo'],
}

exec {'apt-update': command => '/usr/bin/apt-get update', }

# Install gvim
package { 'vim-gnome': ensure => installed, }
# The Gramps Geneology system
package { 'gramps': ensure => installed, }
# VLC Video package
package { 'vlc': ensure => installed, }
# Unetbootin 
package { 'unetbootin': ensure => installed, }
package {'handbrake-gtk': ensure => installed, }
package {'google-chrome-stable': ensure => installed, }
package {'openshot': ensure => installed, }
package {'openshot-doc': ensure => installed, }
package {'kino': ensure => installed, }
package {'sigil': ensure => installed, }
package {'calibre': ensure => installed, }
package {'blender': ensure => installed, }
package {'eric': ensure => installed, }
package {'eric-api-files': ensure => installed, }
package {'xterm': ensure => installed, }
#package {'netflix-desktop': ensure => installed, }
#
## Multisystem repo (creates a multi-boot USB drive from several ISOs.
#exec { 'download-multiboot':
#  cwd => '/usr/local/src',
#  command => 'wget http://liveusb.info/multisystem/install-depot-multisystem.sh.tar.bz2',
#  user => 'root',
#  group => 'root',
#  creates => '/usr/local/src/install-depot-multisystem.sh.tar.bz2',
#}

#exec { 'untar-multiboot':
#  require => Exec['download-multiboot'],
#  cwd => '/usr/local/src',
#  command => 'tar -xvjf install-depot-multisystem.sh.tar.bz2',
#  user => 'root',
#  group => 'root',
#  creates => '/usr/local/src/install-depot-multisystem.sh',
#}

#exec { 'install-multiboot':
#  require => [Exec['untar-multiboot'],Package['xterm'],],
#  cwd => '/opt',
#  command => '/usr/local/src/install-depot-multisystem.sh',
#  user => 'root',
#  group => 'root',
#  creates => '/opt/multisystem/gui_multisystem.sh',
#}

