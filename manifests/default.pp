#node /.*/ { 
    class { 'java-openjdk': 
    }

    class { 'mule':
	      mule_uri => hiera('mule_uri'),
	      mule_base_file => hiera('mule_base_file')
    }
#}