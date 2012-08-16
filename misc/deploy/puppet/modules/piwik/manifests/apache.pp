define piwik::apache (
  $port     = '80',
  $docroot  = $piwik::params::docroot,
  $priority = '10'
) {

  host { "${$name}":
    ip => "127.0.0.1";
  } 

  class {'apache': }

  include apache::mod::php
  apache::mod {'vhost_alias': }
  apache::mod {'auth_basic': }
  apache::mod {'rewrite': }

  apache::vhost { "${name}":
    priority   => $priority,
    vhost_name => '_default_',
    port       => $port,
    docroot    => $docroot,
    configure_firewall => true,
  }

}