#!/usr/bin/env bash

# OS type
MACHINE=nil
case $OSTYPE in
	darwin*) MACHINE="darwin" ;;
	linux*)  MACHINE="linux" ;;
esac

# Dependences
RIPGREP="ripgrep"
FD=$([ $MACHINE == "darwin" ] && echo "fd" || echo "fd-find")
CLANG=$([ $MACHINE == "darwin" ] && echo "llvm" || echo "clang")
CLANG_FORMAT="clang-format"
OPENJDK=$([ $MACHINE == "darwin" ] && echo "openjdk" || echo "openjdk-18-jdk")

DEPENDENCES="$RIPGREP $FD $CLANG $CLANG_FORMAT $OPENJDK"

# Common configurations on different operating systems
common_config ()
{
	echo "- Git clone Neovim package management - packer.nvim."
	PACKER_DIR="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"
	if [ -d "${PACKER_DIR}" ]; then
		echo "    packer.nvim has been cloned."
	else
		echo "Cloning packer.nvim..."
		git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	fi
}

macos_config ()
{
	echo "- Detecting you are using darwin os, use brew to install dependences for Neovim."
	yes | brew update
	yes | brew install $DEPENDENCES
	# For the system Java wrappers to find this JDK, symlink it with
	sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
	yes | brew upgrade
	yes | brew autoremove

	# Install FiraCode nerd font
	yes | brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
}

linux_config ()
{
	echo "- Detecting you are using linux os, use apt to install dependences for Neovim."
	sudo apt update -y
	sudo apt install -y $DEPENDENCES
	sudo apt upgrade -y
	sudo apt autoremove -y

	# Install FiraCode nerd font
	wget -P ${HOME}/Downloads -nc https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
	unzip -o ${HOME}/Downloads/FiraCode.zip -d ${HOME}/.local/share/fonts
	fc-cache -fv
	rm ${HOME}/Downloads/FiraCode.zip
}

dependences_config ()
{
	echo "- Install basic dependences for Neovim."
	echo "    - ripgrep"
	echo "    - fd"
	echo "    - clang"
	echo "    - clang-format"
	echo "    - openjdk"
	# Because different operating systems use different package managements, 
	# so we need to use different configurations depending on type of OS.
	case "$MACHINE" in
		darwin) macos_config ;;
		linux)  linux_config ;;
	esac
}

main ()
{	
	echo "========== Neovim Configuration =========="
	common_config
	dependences_config
	echo ""
	echo "Having installed basic dependences for Neovim."
	echo "1. You need to change the font and theme of terminal to FiraCode Nerd Font Mono and light."
	echo "2. You need to start Neovim and install nvim-packages and lsp, run:"
	echo "    \$ nvim"
	echo "And type:"
	echo "    :PackerSync"
	echo "    :LspInstall clangd jdtls rust_analyzer"
	echo "3. Restart the terminal!"
	echo "========== Good Jobs! =========="
}

# run main function
main

