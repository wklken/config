.PHONY: sync backup install uninstall

USERNAME = `head -1 USERNAME`
CURRENT_DIR = `pwd`

sync:
	sed -i "s#${USERNAME}#YOUR_NAME#g" gitconfig
	git add .
	git commit -m "update"
	git push origin master
	sed -i "s#YOUR_NAME#${USERNAME}#g" gitconfig

update:
	git pull origin master

backup:
	echo "do backup"


install:
	ln -s ${CURRENT_DIR}/zshrc ~/.zshrc
	ln -s ${CURRENT_DIR}/git.aliases ~/.git.aliases
	ln -s ${CURRENT_DIR}/zsh.aliases ~/.zsh.aliases
	ln -s ${CURRENT_DIR}/pyproject.toml ~/.pyproject.toml
	ln -s ${CURRENT_DIR}/ignore ~/.ignore
	# TODO: support macos
	sed -i "s#YOUR_NAME#${USERNAME}#g" gitconfig

	ln -s ${CURRENT_DIR}/gitconfig  ~/.gitconfig
	# install the theme i like
	curl https://raw.githubusercontent.com/wklken/af-magic-left/master/af-magic-left.zsh-theme -o ~/.oh-my-zsh/themes/af-magic-left.zsh-theme

uninstall:
	echo "do uninstall"
