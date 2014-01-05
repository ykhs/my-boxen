class imagemagick {
  include homebrew
  include xquartz

  homebrew::formula { 'imagemagick':
    source => 'puppet:///modules/imagemagick/brews/imagemagick.rb',
    before => Package['boxen/brews/imagemagick']
  }

  package { 'boxen/brews/imagemagick':
    ensure  => installed,
    require => Class['xquartz'],
    install_options => [
      '--disable-openmp',
      '--with-jpeg',
      '--with-x11',
    ];
  }
}
