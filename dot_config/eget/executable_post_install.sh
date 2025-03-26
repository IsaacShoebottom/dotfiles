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
	tar xf 7z*tar* 7zzs
	mv -f 7zzs 7z
	rm -r 7z*tar*
fi

# Handle bash_completion
if compgen -G "bash-completion*tar*" > /dev/null; then
	tar xf bash-completion*tar*
	mv -f bash-completion*/bash_completion .
	mv -f bash-completion*/bash_completion.d .
	mv -f bash-completion*/completions .
	rm -r bash-completion-*
	chmod +x bash_completion
fi

# Unchange directory
popd > /dev/null