/*
== Class: mysql::optimize

Enable mysql daily optimize script.

*/
class mysql::optimize {

  file { "/usr/local/bin/mysql-optimize.sh":
    ensure  => present,
    content => template("mysql/mysql-optimize.sh.erb"),
    owner   => "root",
    group   => "root",
    mode    => 555,
  }

  cron { "mysql-optimize":
    command => "/usr/local/bin/mysql-optimize.sh",
    user    => "root",
    hour    => 12,
    minute  => 30,
    weekday => "Sunday",
    require => File["/usr/local/bin/mysql-optimize.sh"],
  }

}
