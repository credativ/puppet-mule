#
# Class: git
#
class git (
  $ensure = 'latest'
) {
  package { "git-core" :
    ensure => $ensure
  }
}	
	