class people::ykhs::applications {

  include keyremap4macbook
  include keyremap4macbook::login_item
  include macvim_kaoriya
  include iterm2::stable
  include dropbox
  include alfred
  include divvy
  include keepassx
  include skype
  include chrome
  include chrome::canary
  include firefox
  include onyx
  include imagemagick
  include heroku

  # KeyRemap4MacBook

  # 左 command key を単独で押したときは、英数キーとして使う
  keyremap4macbook::remap{ 'jis_commandL2commandL_eisuu': }

  # 右 command key を単独で押したときは、かなキーとして使う
  keyremap4macbook::remap{ 'jis_commandR2commandR_kana': }

  # キーリピート開始までの待ち時間
  keyremap4macbook::set{ 'repeat.initial_wait':
    value => '200'
  }

  # キーリピート速度
  keyremap4macbook::set{ 'repeat.wait':
    value => '20'
  }

  # zsh

  package {
    'zsh': install_options => [
      '--disable-etcdir',
    ];
  }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${boxen::config::homebrewdir}/bin/zsh",
    require => Package['zsh'],
    before  => Osx_chsh[$::luser];
  }

  osx_chsh { $::luser:
    shell => "${boxen::config::homebrewdir}/bin/zsh"
  }

  # - - -

  $homebrew_packages = [
    'tree',
    'tmux',
    'reattach-to-user-namespace',
    'tig',
    'z',
  ]

  package { $homebrew_packages:
    ensure => installed
  }

  # - - -

  package { 'Yorufukurou':
    source   => 'http://aki-null.net/yf/YoruFukurou_SL.zip',
    provider => compressed_app;
  }

  package { 'TotalFinder':
    source   => 'http://downloads.binaryage.com/TotalFinder-1.5.6.dmg',
    provider => pkgdmg;
  }

  package { 'Gyazo':
    source   => 'https://files.gyazo.com/setup/Gyazo_2.0.dmg',
    provider => appdmg;
  }

  package { 'MailPlane 3':
    source   => 'http://dist.mailplaneapp.com/builds/Mailplane_3_880.tbz',
    provider => compressed_app;
  }

}
