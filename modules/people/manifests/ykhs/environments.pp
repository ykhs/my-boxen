class people::ykhs::environments {

  # Git

  git::config::global { 'user.name':
    value   => 'ykhs'
  }

  git::config::global { 'user.email':
    value => 'yukihisa.yamada@gmail.com'
  }

  git::config::global { 'github.user':
    value => 'ykhs'
  }

  git::config::global { 'color.ui':
    value => true
  }

  # 日本語ファイル名を表示できるようにする
  git::config::global { 'core.quotepath':
    value => false
  }

  # 日本語ファイル名を扱えるようにする
  git::config::global { 'core.precomposeunicode':
    value => true
  }

}
