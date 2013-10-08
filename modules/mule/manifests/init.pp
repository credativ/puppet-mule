class mule(
  $mule_version = "3.4.0",
  $mule_install_dir = "/opt",
  $mule_log_dir = "/var/log/mule"
) {
  $mule_base_file = "mule-standalone-${mule_version}"
  $mule_zip_file = "${mule_base_file}.zip"
  $mule_url = "http://dist.codehaus.org/mule/distributions/${mule_zip_file}"
  
   package { "unzip":
    ensure => "latest",
  }  
  
  netinstall { "mule":
    url => $mule_url,
    destination_dir => $mule_install_dir,
    require => Package["unzip"]
  }
  
  exec { "run_mule":
    command => "${mule_install_dir}/${mule_base_file}/bin/mule > ${mule_log_dir}/mule.log &",
    creates => "${mule_log_dir}/mule.log",
    require => Netinstall["mule"]
  }
  
  
}