class mule($mule_uri, $mule_base_file, $mule_install_dir = '/opt') {
  
  netinstall { 'mule':
    url => $mule_uri,
    destination_dir => $mule_install_dir
  }
  
  file { "${mule_install_dir}/mule":
     ensure => 'link',
     target => "${mule_install_dir}/${mule_base_file}",
     require => Netinstall['mule']
  }
  
}