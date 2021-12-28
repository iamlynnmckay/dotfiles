#!/bin/bash

set -x -o pipefail

_Dotfiles_install() {
    local -r _ROOT="${1:?}"
    cp -r "${_ROOT}" "${HOME}/.dotfiles" ; \
	mkdir -p "${HOME}/.config/nvim" ; \
	ln -sf "${HOME}/.dotfiles/public" "${HOME}/.public" ; \
	ln -sf "${HOME}/.dotfiles/gitignore" "${HOME}/.gitignore" ; \
	ln -sf "${HOME}/.dotfiles/ohmyzshrc" "${HOME}/.ohmyzshrc" ; \
	ln -sf "${HOME}/.dotfiles/vimrc" "${HOME}/.config/nvim/init.vim" ; \
	ln -sf "${HOME}/.dotfiles/vimrc" "${HOME}/.ideavimrc" ; \
	ln -sf "${HOME}/.dotfiles/vimrc" "${HOME}/.vimrc" ; \
	ln -sf "${HOME}/.dotfiles/zprofile" "${HOME}/.bashrc" ; \
	ln -sf "${HOME}/.dotfiles/zprofile" "${HOME}/.profile" ; \
	ln -sf "${HOME}/.dotfiles/zprofile" "${HOME}/.zprofile" ; \
	ln -sf "${HOME}/.dotfiles/zshrc" "${HOME}/.zshrc" ;
}

_Dotfiles_clean() {
    local -r _tempDir="${HOME}/.dotfiles.$(date +%s)${RANDOM}.backup"
    mkdir -p "${_tempDir}"
	mv "${HOME}/.dotfiles" "${_tempDir}" || : ; \
	mv "${HOME}/.bashrc" "${_tempDir}" || : ; \
	mv "${HOME}/.config/nvim/init.vim" "${_tempDir}" || : ; \
	mv "${HOME}/.dotfiles" "${_tempDir}" || : ; \
	mv "${HOME}/.gitignore" "${_tempDir}" || : ; \
	mv "${HOME}/.ideavimrc" "${_tempDir}" || : ; \
	mv "${HOME}/.ohmyzshrc" "${_tempDir}" || : ; \
	mv "${HOME}/.profile" "${_tempDir}" || : ; \
	mv "${HOME}/.public" "${_tempDir}" || : ; \
	mv "${HOME}/.vimrc" "${_tempDir}" || : ; \
	mv "${HOME}/.zprofile" "${_tempDir}" || : ; \
	mv "${HOME}/.zshrc" "${_tempDir}" || : ;
}

___main___() {
    case "${1}" in
        "--install")
            _Dotfiles_install "${2:-${PWD}/src}"
        ;;
        "--clean")
            _Dotfiles_clean 
        ;;
    esac
}

___main___ ${@:-}