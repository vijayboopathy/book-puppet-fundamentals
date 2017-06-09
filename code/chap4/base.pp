user {"deploy" :
  ensure    => present,
  uid       => 5001,
  password  => '$1$WD98.uaZ$cxx30x/K3FXQrljxsvBIu/',
  home      => '/home/deploy'
}

user {"dojo" :
  ensure  => absent,
}

package { [ "tree", "unzip", "git", "ntp", "wget"  ]:

  ensure  => installed

}

service { "ntp":
  ensure  => running,
  enable  => true,

}
