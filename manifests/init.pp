# Class: mule
#
# This module manages the Mule ESB community runtime.
#
# Parameters:
#
# $mule_install_dir::        Where mule will be installed
#
# $mule_version::            The version of mule to install.
#
# $mule_mirror::             The mirror to download from.
#
# $java_home::               Java installation.
#
# $user::                    The system user the mule process will run as.
#
# $group::                   The system group the mule process will run as.
#
# Actions:
#
#   Installs and manages the Mule ESB community runtime.
#
# Requires:
#   Module['Archive']
#   Class['java']
#
# Sample Usage:
#
# node default {
#   class { 'mule': }
# }
#
class mule(
  $mule_mirror = 'http://dist.codehaus.org/mule/distributions',
  $mule_version = '3.4.0',
  $mule_install_dir = '/opt',
  $java_home = '/usr/lib/jvm/default-java',
  $user = 'root',
  $group = 'root') {

  $basedir = "${mule_install_dir}/mule"
  $dist = "mule-standalone-${version}"
  $archive = "${dist}.tar.gz"

  archive::download { "$archive":
    ensure        => present,
    url           => ${mirror}/$archive,
    src_target    => $parentdir,
    checksum      => false,
  }

  archive::extract { "${dist}":
    ensure     => present,
    target     => $parentdir,
    src_target => $parentdir,
    require    => Archive::Download["${archive}"]
  }

  file { $basedir:
    ensure  => 'link',
    target  => "${mule_install_dir}/${dist}",
    require => Archive::Extract["${dist}"]
  }

  file { "${mule_install_dir}/${dist}":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    require => Archive::Extract["${dist}"]
  }

  file { '/etc/profile.d/mule.sh':
    mode    => '0755',
    content => "export MULE_HOME=${basedir}",
    require => File[$basedir]
  }

  file { '/etc/init.d/mule':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('mule/mule.init.erb'),
    require => File[$basedir]
  }

  service { 'mule':
    ensure    => running,
    enable    => true,
    require   => File['/etc/init.d/mule'],
    hasstatus => false
  }

}