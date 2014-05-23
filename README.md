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

Licence
----------------------------
This project is distributed under [Apache 2 licence](http://www.apache.org/licenses/LICENSE-2.0.html). 
