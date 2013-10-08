class maven(
  $maven_version = '3.0.5',
  $maven_major_version = '3',
  $maven_home = '/usr/local/maven',
  $java_home = '',
  $maven_repo_root = '/usr/local'
) {

   netinstall { "maven" :
     url => "http://apache.mirrors.tds.net/maven/maven-${maven_major_version}/${maven_version}/binaries/apache-maven-${maven_version}-bin.tar.gz",
     destination_dir => $maven_home,
     extracted_dir => "apache-maven-${maven_version}"
   }

  file { "/etc/mavenrc": 
    content => template("maven/mavenrc.erb"),
    mode =>  "00755"
  }

}