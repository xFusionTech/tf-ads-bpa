# Firewall for the build machine

class firewall::build {
  file { '/etc/sysconfig/iptables':
    content => template("firewall/build_iptables.erb"),
  }~>
  exec { 'service iptables restart':
    path        => [ '/bin', '/usr/bin', '/sbin' ],
    refreshonly => true,
  }
}