# Non github dependancies
if ! hash poetry 2>/dev/null;then
	pipx install poetry
fi

if ! hash rustup 2>/dev/null;then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Temporarily change directory
pushd $HOME/.local/bin > /dev/null

# Extract what eget could not

# Handle 7z
if compgen -G "7z*tar*" > /dev/null; then
	# Extract 7z
	tar xf 7z*tar* 7zzs
	# Remove/rename extracted 7zzs (7z statically linked) to 7z
	mv -f 7zzs 7z
	# Remove archive
	rm -r 7z*tar*
fi

# Handle bash_completion
if compgen -G "bash-completion*tar*" > /dev/null; then
	# Extract bash-completion
	tar xf bash-completion*tar*

	# Remove old bash_completion
	rm -r bash_completion bash_completion.d completions

	# Move new bash_completion
	mv -f bash-completion*/bash_completion .
	mv -f bash-completion*/bash_completion.d .
	mv -f bash-completion*/completions .

	# Remove extracted files
	rm -r bash-completion-*

	# Make bash_completion executable
	chmod +x bash_completion
fi

# Handle shared libraries
rsync --remove-source-files $(fd --glob "*.so*") ../lib

# Gen Desktop file for firefox appimage
gendesk -f -n --pkgname "firefox" --name "Firefox" --exec "firefox" --icon "firefox" --categories "Network" --comment "Firefox Web Browser" --genericname "Web Browser"
rsync --remove-source-files firefox.desktop ../share/applications

# Unchange directory
popd > /dev/null