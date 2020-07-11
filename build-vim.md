
とりあえず。

```
./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-gpm \
  --enable-cscope \
  --enable-perlinterp \
  --enable-pythoninterp \
  --enable-python3interp \
  --enable-rubyinterp \
  --enable-luainterp \
  --enable-acl \
  --enable-fontset \
  --enable-xim \
  --enable-terminal \
  --enable-fail-if-missing \
  --with-luajit \
  --with-lua-prefix=/usr/local \
  --prefix=$HOME/.local
make
sudo make install
```
