git submodule foreach --recursive --quiet pwd | xargs -P10 -I{} bash -c 'cd {}; git checkout master && git pull && git remote prune origin && git tag -l | xargs git tag -d && git fetch origin master && git gc --prune=all --aggressive'
python3 ~/.vim_runtime/update_plugins.py
