#!/bin/bash

set -x -o pipefail


_Dotfiles___copy() {
    local -r _src="${1:?}"
    local -r _dest="${2:?}"
	cp -rf "${_src}" "${_dest}"
}

_Dotfiles___remove() {
    local -r _dest="${1:?}"
	rm -rf "${_dest}"
}

_Dotfiles___link() {
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

_Dotfiles___unlink() {
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

_Dotfiles_homebrew() {
	_Dotfiles___link "$(readlink -f /usr/local/opt/dotfiles)"
}

_Dotfiles_install() {
	local -r _src="${PWD}/src"
	local -r _dest="${HOME}/.dotfiles"
	_Dotfiles_clean "${_dest}"
	_Dotfiles___copy "${_src}" "${_dest}"
	_Dotfiles___link "${_dest}"
}

_Dotfiles_clean() {
	local -r _dest="${HOME}/.dotfiles"
	_Dotfiles___unlink
	_Dotfiles___remove "${_dest}"
}

___main___() {
    case "${1}" in
        "--install")
            _Dotfiles_install
        ;;
		"--homebrew")
			_Dotfiles_homebrew
		;;
        "--clean")
            _Dotfiles_clean 
        ;;
    esac
}

___main___ ${@:-}