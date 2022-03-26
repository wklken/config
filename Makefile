.PHONY: sync backup install uninstall

USERNAME = `head -1 USERNAME`
CURRENT_DIR = `pwd`

sync:
	sed -i "s#${USERNAME}#YOUR_NAME#g" gitconfig
	git add .
	git commit -m "update"
	git push origin master
	sed -i "s#YOUR_NAME#${USERNAME}#g" gitconfig

backup:
	echo "do backup"


install:
	ln -s ${CURRENT_DIR}/zshrc ~/.zshrc
	ln -s ${CURRENT_DIR}/git.aliases ~/.git.aliases
	ln -s ${CURRENT_DIR}/zsh.aliases ~/.zsh.aliases
	sed -i "s#YOUR_NAME#${USERNAME}#g" gitconfig
	ln -s ${CURRENT_DIR}/gitconfig  ~/.gitconfig

uninstall:
	echo "do uninstall"
