class people::ykhs::dotfiles {

  $home = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  file { $home:
    ensure => directory
  }

  repository { $dotfiles:
    source => 'ykhs/dotfiles',
    require => File[$home]
  }

  exec { "sh ${dotfiles}/setup.sh":
    cwd => $dotfiles,
    require => Repository[$dotfiles]
  }
}
