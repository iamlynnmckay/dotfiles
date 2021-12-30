#!/bin/bash

set -x -o pipefail

_Dotfiles_clean() {
    local -r _tempDir="${HOME}/.backup/dotfiles/$(date +%s)${RANDOM}"
    mkdir -p "${_tempDir}"
	mv "${HOME}/.bashrc" "${_tempDir}" || :
	mv "${HOME}/.config/nvim/init.vim" "${_tempDir}" || :
	mv "${HOME}/.gitignore" "${_tempDir}" || :
	mv "${HOME}/.ideavimrc" "${_tempDir}" || :
	mv "${HOME}/.ohmyzshrc" "${_tempDir}" || :
	mv "${HOME}/.profile" "${_tempDir}" || :
	mv "${HOME}/.public" "${_tempDir}" || :
	mv "${HOME}/.vimrc" "${_tempDir}" || :
	mv "${HOME}/.zprofile" "${_tempDir}" || :
	mv "${HOME}/.zshrc" "${_tempDir}" || :
}

_Dotfiles_install() {
    local -r _root="${1:?}"
	mkdir -p "${HOME}/.config/nvim"
	ln -sf "${_root}/public" "${HOME}/.public"
	ln -sf "${_root}/gitignore" "${HOME}/.gitignore"
	ln -sf "${_root}/ohmyzshrc" "${HOME}/.ohmyzshrc"
	ln -sf "${_root}/vimrc" "${HOME}/.config/nvim/init.vim"
	ln -sf "${_root}/vimrc" "${HOME}/.ideavimrc"
	ln -sf "${_root}/vimrc" "${HOME}/.vimrc"
	ln -sf "${_root}/zprofile" "${HOME}/.bashrc"
	ln -sf "${_root}/zprofile" "${HOME}/.profile"
	ln -sf "${_root}/zprofile" "${HOME}/.zprofile"
	ln -sf "${_root}/zshrc" "${HOME}/.zshrc"
}

___main___() {
    case "${1}" in
        "--install")
            _Dotfiles_install "${PWD}/src"
        ;;
		"--homebrew")
			_Dotfiles_install "$(readlink -f /usr/local/opt/dotfiles)"
		;;
        "--clean")
            _Dotfiles_clean 
        ;;
    esac
}

___main___ ${@:-}