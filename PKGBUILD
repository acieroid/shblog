# Maintainer: addikt1ve <the.addikt1ve@gmail.com>
# Contributor : sigma <sigma_github@melix.net>

pkgname=shblog-git
pkgver=20100624
pkgrel=1
pkgdesc="sh-written blog engine generating static HTML pages"
arch=('i686' 'x86_64')
url="http://github.com/addikt1ve/shblog"
license=('GPL')
depends=('coreutils')
makedepends=('git')
provides=('shblog')
conflicts=('shblog')
backup=('/etc/shblog/shblog.conf')

_gitroot=http://github.com/addikt1ve/shblog.git
_gitname=shblog

build () {
  cd "$srcdir"

  if [[ -d $_gitmane ]]; then
    cd $_gitname && git pull origin && cd .. || return 1
  else
    git clone $_gitroot || return 1
  fi

  rm -fr $_gitname-build
  git clone $_gitname $_guitname-build || return 1
}

package() {
  $srcdir/$_gitname-build/install.sh || return 1
}
