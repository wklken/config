.PHONY: sync

USERNAME = `head -1 USERNAME`

sync:
	sed -i "s#${USERNAME}#YOUR_NAME#g" gitconfig
	git add .
	git commit -m "update"
	git push origin master
	sed -i 's#YOUR_NAME#${USERNAME}#g' gitconfig



