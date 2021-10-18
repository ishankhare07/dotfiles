BREW_INSTALLED := $(shell brew 2>/dev/null)

link-dotfiles:
	python3 linker.py -ft

install-vundle:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

install-vundle-plugins: install-vundle
	vim +PluginInstall +qall

install-ohmyzsh:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

install-powerline-fonts:
	# clone
	git clone https://github.com/powerline/fonts.git --depth=2 ~/fonts
	# install
	~/fonts/install.sh
	# clean-up a bit
	rm -rf ~/fonts

install-brew:
	./install_brew.sh

install-deps: install-brew
	brew install cmake python wget

install-go:
	./install_go.sh
	echo "successfully installed go"

compile-ycm:
	# depends on install-vundle-plugins and install-go
	cd ~/.vim/bundle/YouCompleteMe; python3 install.py --go-completer --rust-completer

bootstrap-install-ycm: install-deps compile-ycm

install-vim:
	brew install vim --with-python

install: install-ohmyzsh install-brew link-dotfiles install-vundle-plugins install-powerline-fonts bootstrap-install-ycm

