#
# Class: java-openjdk
#
class java-openjdk (
  # These parameters can be overriden in hiera via:
  #   java-openjdk::java_version
  #   java-openjdk::ensure
  $java_version = '7',
  $ensure = 'latest',
){
  $packages = ["openjdk-${java_version}-jre", "openjdk-${java_version}-jre-lib"]
  package { $packages :
    ensure => $ensure,
  }
}
