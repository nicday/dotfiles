gfco() { git fetch origin "$1" && git checkout "$1" }
prs() { open "https://github.com/pulls?q=is%3Aopen+is%3Apr+author%3A${1:-@me}+org%3Ashopify" }

refresh() {
  brew update

  brew upgrade fzf neovim bash ripgrep git universal-ctags \
    fd go curl redis ruby-install telnet tree jemalloc ruby-install \
    mysql yt-dlp curl cmake docker gdb wget coreutils \
    lua luajit luajit-openresty luarocks markdown gh hub htop reattach-to-user-namespace \
    jq sqlite htop grep graphviz entr fio aspell \
    llvm cmark chrome-cli gcc bat gopls typescript git-delta \
    imagemagick asdf ca-certificates \
    duckdb gnuplot gperf libuv mutagen tree-sitter \
    xxhash xsimd 1password-cli zstd font-inconsolata-nerd-font ngrok aichat

  bun upgrade

  asdf install nodejs latest
  asdf install golang latest
  asdf install python latest
  asdf install ruby latest

  nvim --headless "+Lazy! sync" +qa
}