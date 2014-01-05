class people::ykhs::preferences {

  $home = "/Users/${::boxen_user}"

  # Trackpad

  boxen::osx_defaults { 'トラックパッド: Magic Trackpad でのタップ動作をクリックに割り当てる':
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'Clicking',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'トラックパッド: Magic Trackpad でのドラッグを有効にする':
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'Dragging',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'トラックパッド: Magic Trackpad でのドラッグロックを有効にする':
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'DragLock',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'トラックパッド: タップでクリック、ドラッグ、ドラッグロックを有効にする':
    host   => 'currentHost',
    domain => 'NSGlobalDomain',
    key    => 'com.apple.mouse.tapBehavior',
    value  => 3,
    user   => $::boxen_user,
    type   => 'int',
  }

  # Keyboard

  # caps lock を ctrl key として使う
  include osx::keyboard::capslock_to_control

  boxen::osx_defaults{ 'キーボード: ファンクションキーを本来の用途で使用する':
    domain => 'NSGlobalDomain',
    key    => 'com.apple.keyboard.fnState',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'キーボード: フルキーボードアクセスを有効にする':
    domain => 'NSGlobalDomain',
    key    => 'AppleKeyboardUIMode',
    value  => 3,
    user   => $::boxen_user,
    type   => 'int',
  }
  boxen::osx_defaults { 'キーボード: ctrl キーを押しながらスクロールでズームイン・アウト':
    domain => 'com.apple.universalaccess',
    key    => 'closeViewScrollWheelToggle',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'キーボード: オートコレクトを無効にする':
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticSpellingCorrectionEnabled',
    value  => false,
    user   => $::boxen_user,
    type   => 'bool',
  }
  exec { 'キーボード:ショートカット: 「前の入力ソースを選択」を無効化':
    command => 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 "<dict><key>enabled</key><false/></dict>"',
    unless  => '/usr/libexec/PlistBuddy -c "Print :AppleSymbolicHotKeys:60:enabled dict" ~/Library/Preferences/com.apple.symbolichotkeys.plist && (/usr/libexec/PlistBuddy -c "Print :AppleSymbolicHotKeys:60:enabled dict" ~/Library/Preferences/com.apple.symbolichotkeys.plist | awk "{ exit \$0 != \"false\" }")',
  }
  exec { 'キーボード:ショートカット: 「次のウインドウを操作対象にする」を commad + space にマッピング':
    command => 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 27 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>"',
    unless  => '/usr/libexec/PlistBuddy -c "Print :AppleSymbolicHotKeys:27:value:parameters dict" ~/Library/Preferences/com.apple.symbolichotkeys.plist && (/usr/libexec/PlistBuddy -c "Print :AppleSymbolicHotKeys:27:value:parameters dict" ~/Library/Preferences/com.apple.symbolichotkeys.plist | awk "{ printf \$0 }" | sed "s/  */ /g" | awk "{ exit \$0 != \"Array { 32 49 1048576}\" }")',
  }

  # Dock

  boxen::osx_defaults{ 'Dock: 右側に置く':
    domain => 'com.apple.dock',
    key    => 'orientation',
    value  => 'right',
    user   => $::boxen_user,
    type   => 'string',
  }
  boxen::osx_defaults { 'Dock: 自動的に隠す':
    domain => 'com.apple.dock',
    key    => 'autohide',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'Dock: 自動的に隠れるまでの待ち時間を無くす':
    domain => 'com.apple.dock',
    key    => 'autohide-delay',
    value  => 0,
    user   => $::boxen_user,
    type   => 'float',
  }
  boxen::osx_defaults { 'Dock: 開閉アニメーションを無効にする':
    domain => 'com.apple.dock',
    key    => 'autohide-time-modifier',
    value  => 0,
    user   => $::boxen_user,
    type   => 'float',
  }
  boxen::osx_defaults { 'MissionControl: アニメーション速度':
    domain => 'com.apple.dock',
    key    => 'expose-animation-duration',
    value  => 0.1,
    user   => $::boxen_user,
    type   => 'float',
  }
  boxen::osx_defaults { 'ダッシュボードを使用しない':
    domain => 'com.apple.dashboard',
    key    => 'mcx-disabled',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }

  # Finder

  boxen::osx_defaults { 'Finder: すべてのファイル名拡張子を表示する':
    domain => 'NSGlobalDomain',
    key    => 'AppleShowAllExtensions',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'Finder: ステータスバーを表示する':
    domain => 'com.apple.finder',
    key    => 'ShowStatusBar',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'Finder: パスバーを表示する':
    domain => 'com.apple.finder',
    key    => 'ShowPathBar',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'Finder: ウィンドウタイトルにディレクトリパスを表示':
    domain => 'com.apple.finder',
    key    => '_FXShowPosixPathInTitle',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'Finder: 検索は常に現在のディレクトリを基点にする':
    domain => 'com.apple.finder',
    key    => 'FXDefaultSearchScope',
    value  => 'SCcf',
    user   => $::boxen_user,
    type   => 'string',
  }
  boxen::osx_defaults { 'Finder: 拡張子を変更する際の警告を停止':
    domain => 'com.apple.finder',
    key    => 'FXEnableExtensionChangeWarning',
    value  => false,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'Finder: ネットワーク上に .DS_Store を作成しない':
    domain => 'com.apple.desktopservices',
    key    => 'DSDontWriteNetworkStores',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults { 'Finder: リスト表示にする':
    domain => 'com.apple.finder',
    key    => 'FXPreferredViewStyle',
    value  => 'Nlsv',
    user   => $::boxen_user,
    type   => 'string',
  }
  boxen::osx_defaults { 'Finder: アニメーション効果を無効にする':
    domain => 'com.apple.finder',
    key    => 'DisableAllAnimations',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }

  # UI

  boxen::osx_defaults{ 'メニューバーの透過を無効にする':
    domain => 'NSGlobalDomain',
    key    => 'AppleEnableMenuBarTransparency',
    value  => false,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults{ 'ダウンロードしたファイルを開く際の警告を出さない':
    domain => 'com.apple.LaunchServices',
    key    => 'LSQuarantine',
    value  => false,
    user   => $::boxen_user,
    type   => 'bool',
  }
  boxen::osx_defaults{ '保存ダイアログを常に詳細表示にする':
    domain => 'NSGlobalDomain',
    key    => 'NSNavPanelExpandedStateForSaveMode',
    value  => true,
    user   => $::boxen_user,
    type   => 'bool',
  }

  # Time Machine

  exec { 'Time Machine: ローカルバックアップを停止':
    command => 'hash tmutil &> /dev/null && sudo tmutil disablelocal',
    unless  => "defaults read /Library/Preferences/com.apple.TimeMachine.plist MobileBackups && (defaults read /Library/Preferences/com.apple.TimeMachine.plist MobileBackups | awk '{ exit \$0 != 0 }')"
  }

}
