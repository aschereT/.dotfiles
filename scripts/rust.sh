#set -e

alias gitc='git clone --depth=1 --recurse-submodules --shallow-submodules --single-branch -j$(nproc)'
alias gcle='git reset --hard; git clean -fd'
if ! [ -x "$(command -v rustc)" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | zsh -s -- --default-toolchain nightly --profile=default -y
  . $HOME/.cargo/env
  mkdir ~/.zfunc/
  rustup completions zsh > ~/.zfunc/_rustup
fi
rustup default nightly
rustup self update
rustup update

#export RUSTFLAGS="-C target-cpu=native -C target-feature=-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vl"
export RUSTFLAGS="-C opt-level=3 -C target-cpu=native"
mkdir -p $HOME/repos
cd $HOME/repos

if [ ! -d "fd" ]; then gitc https://github.com/sharkdp/fd.git; fi
cd fd && \
gcle && git pull && git gc --prune=all --aggressive && \
cargo update && \
cargo install -f --all-features --bins --path .
cd $HOME/repos

if [ ! -d "ripgrep" ]; then gitc https://github.com/BurntSushi/ripgrep.git; fi
cd ripgrep && \
gcle && git pull && git gc --prune=all --aggressive && \
cargo update && \
cat Cargo.toml | sed "s/debug = 1/debug = 0/g" > Cargo.toml2 && mv Cargo.toml2 Cargo.toml && \
cargo install -f --features 'simd-accel' --bins --path .
cd $HOME/repos

if [ ! -d "lsd" ]; then gitc https://github.com/Peltoche/lsd.git; fi
cd lsd && \
gcle && git pull && git gc --prune=all --aggressive && \
cargo update && \
cargo install -f --all-features --bins --path .
cd $HOME/repos

if [ ! -d "bat" ]; then gitc https://github.com/sharkdp/bat.git; fi
cd bat && \
gcle && git pull && git gc --prune=all --aggressive && \
cargo update && \
cat Cargo.toml | sed "s/debug = 1/debug = 0/g" > Cargo.toml2 && mv Cargo.toml2 Cargo.toml && \
cargo install -f --all-features --bins --path .
cd $HOME/repos

