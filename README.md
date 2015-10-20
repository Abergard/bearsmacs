# Emacs
## C++ IDE
Contain packages:
* package
* warm-night-theme
* whitespace
* iedit
* flx-ido
* ido-ubiquitous
* smex
* idomenu
* ido-hacks
* irony
* company
* company-irony
* company-irony-c-headers
* company-jedi
* color
* ido-at-point
* ggtags
* yasnippet
* flycheck-irony
* flycheck-pyflakes

## irony-server installation (visual studio 2015):
cmake -DCMAKE_INSTALL_PREFIX="~/.emacs.d/irony/" -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON C:/src/irony-mode/server -DLIBCLANG_LIBRARY="C:/src/clang/build/Release/lib/libclang.lib" -DLIBCLANG_INCLUDE_DIR="C:/src/clang/llvm/tools/clang/include" -DCMAKE_BUILD_TYPE=Release -G "Visual Studio 14 Win64" ..
