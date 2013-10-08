#
# Class: java-openjdk
#
class java-openjdk (
  # These parameters can be overridedn in hiera via:
  #   openjdk::java_version
  #   openjdk::ensure
  $java_version = '7',
  $ensure = 'latest',
){
  $packages = ["openjdk-${java_version}-jre", "openjdk-${java_version}-jre-lib"]
  package { $packages :
    ensure => $ensure,
  }
}
