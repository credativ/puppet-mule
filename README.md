# puppet-mule #

[![Build Status](https://travis-ci.org/ryandcarter/puppet-mule.svg?branch=master)](https://travis-ci.org/ryandcarter/puppet-mule.svg?branch=master)

A Puppet module to install and manage the Mule ESB community runtime.
## Usage ##

    node default {
      class  { 'java':
        distribution => 'jdk',
        version      => 'latest',
      }
      ->
      class  { 'mule': }
    } 

### Deploy an app ###

    node default {
      class  { 'java':
        distribution => 'jdk',
        version      => 'latest',
      }
      ->
      class  { 'mule': }
      ->
      mule::app::deploy { "HelloApp":
        app_url => 'https://repository.mulesoft.org/nexus/content/repositories/releases/org/mule/examples/mule-example-echo/3.5.0/mule-example-echo-3.5.0.zip'
      }
    } 

Licence
----------------------------
This project is distributed under [Apache 2 licence](http://www.apache.org/licenses/LICENSE-2.0.html). 
