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

}
