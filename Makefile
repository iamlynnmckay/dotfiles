.PHONY: all clean

all: clean
	cp -r "$${PWD}/src" "$${HOME}/.dotfiles" ; \
	mkdir -p "$${HOME}/.config/nvim" ; \
	ln -sf "$${HOME}/.dotfiles/public" "$${HOME}/.public" ; \
	ln -sf "$${HOME}/.dotfiles/gitignore" "$${HOME}/.gitignore" ; \
	ln -sf "$${HOME}/.dotfiles/ohmyzshrc" "$${HOME}/.ohmyzshrc" ; \
	ln -sf "$${HOME}/.dotfiles/vimrc" "$${HOME}/.config/nvim/init.vim" ; \
	ln -sf "$${HOME}/.dotfiles/vimrc" "$${HOME}/.ideavimrc" ; \
	ln -sf "$${HOME}/.dotfiles/vimrc" "$${HOME}/.vimrc" ; \
	ln -sf "$${HOME}/.dotfiles/zprofile" "$${HOME}/.bashrc" ; \
	ln -sf "$${HOME}/.dotfiles/zprofile" "$${HOME}/.profile" ; \
	ln -sf "$${HOME}/.dotfiles/zprofile" "$${HOME}/.zprofile" ; \
	ln -sf "$${HOME}/.dotfiles/zshrc" "$${HOME}/.zshrc" ;

clean:
	rm -rf "$${HOME}/.dotfiles.backup" ; \
	mv "$${HOME}/.bashrc" "$${HOME}/.bashrc.backup" || : ; \
	mv "$${HOME}/.config/nvim/init.vim" "$${HOME}/.config/nvim/init.vim.backup" || : ; \
	mv "$${HOME}/.dotfiles" "$${HOME}/.dotfiles.backup" || : ; \
	mv "$${HOME}/.gitignore" "$${HOME}/.gitignore.backup" || : ; \
	mv "$${HOME}/.ideavimrc" "$${HOME}/.ideavimrc.backup" || : ; \
	mv "$${HOME}/.ohmyzshrc" "$${HOME}/.ohmyzshrc.backup" || : ; \
	mv "$${HOME}/.profile" "$${HOME}/.profile.backup" || : ; \
	mv "$${HOME}/.public" "$${HOME}/.public.backup" || : ; \
	mv "$${HOME}/.vimrc" "$${HOME}/.vimrc.backup" || : ; \
	mv "$${HOME}/.zprofile" "$${HOME}/.zprofile.backup" || : ; \
	mv "$${HOME}/.zshrc" "$${HOME}/.zshrc.backup" || : ;
