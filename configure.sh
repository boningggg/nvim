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

dependences_config ()
{
	echo "- Install basic dependences for Neovim."
	echo "    - ripgrep"
	echo "    - fd"
	echo "    - clang"
	echo "    - clang-format"
	echo "    - openjdk"
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
}

linux_config ()
{
	echo "- Detecting you are using linux os, use apt to install dependences for Neovim."
	sudo apt update -y
	sudo apt install -y $DEPENDENCES
	sudo apt upgrade -y
	sudo apt autoremove -y
}



main ()
{	
	echo "========== Neovim Configuration =========="
	common_config
	dependences_config
	# Because different operating systems use different package managements, 
	# so we need to use different configurations depending on type of OS.
	case "$MACHINE" in
		darwin) macos_config ;;
		linux)  linux_config ;;
	esac
	echo ""
	echo "Having installed basic dependences for Neovim."
	echo "Now you need to start Neovim and install nvim-packages, run:"
	echo "    \$ nvim"
	echo "And type:"
	echo "    :PackerSync"
	echo "========== Good Jobs! =========="
}

# run main function
main

