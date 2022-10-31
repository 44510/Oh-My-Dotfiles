export ZSH="$HOME/.oh-my-zsh"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

local_proxy=http://127.0.0.1:7890
export http_proxy=http://proxy.zhenguanyu.com:8118
# export http_proxy=$local_proxy
export https_proxy=$http_proxy

alias ohmyday=~/.local/ohmyday.sh
alias sync="git pull origin main"
alias gm="git checkout main && git pull"
alias gpf="git push -f"

alias vz="vi ~/.zshrc"
alias sz="source ~/.zshrc"

alias omd="ohmyday"

alias gwk="cd ~/Projects/wukong"
alias gwke="cd ~/Projects/wukong/wukong-editor"
alias gwkw="cd ~/Projects/wukong/wukong-web"

alias wmk="~/Projects/wukong/wukong-editor/scripts/wmk"

bw() {
    wmk "-w$@" wk-wasm-app-by-brotli;
}

bws() {
    ssh wukong@soho-wukong-cpu1-pm -p 4004 "source ~/.zshrc && bw && exit";
    gwkw;
    cd ./packages/editor;
    rm ./wk-wasm-*;
    scp "wukong@soho-wukong-cpu1-pm:/home/wukong/wukong/wukong-web/packages/editor/wk-wasm-*" ./;
}

bwos() {
    ssh wukong@soho-wukong-cpu1-pm -p 4004 "source ~/.zshrc && bwo -g && exit";
    gwkw;
    cd ./packages/editor;
    rm ./wk-wasm-*;
    scp "wukong@soho-wukong-cpu1-pm:/home/wukong/wukong/wukong-web/packages/editor/wk-wasm-*" ./;
    cd ../bridge-proto/generated-proto;
    scp "wukong@soho-wukong-cpu1-pm:/home/wukong/wukong/wukong-web/packages/bridge-proto/generated-proto/*" ./;
}

bwo() {

    wmk "-w$@" wk-wasm-only-for-web-by-brotli;
}

alias ssh='env TERM=xterm-256color ssh'
# alias gs="ssh wukong@soho-wukong-cpu1-pm -p 4004 -L 3000:localhost:3004 -v"
alias gs="ssh wukong@soho-wukong-cpu1-pm -p 4004"
alias pd="gwkw && pnpm dev"
alias pu="gwkw && pnpm update-proto"
alias pi="gwkw && pnpm install"
alias fuck="kill -9 $(pgrep SCIM)"
alias cat="bat"
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

fif() {
	rg  \
	--column \
	--line-number \
	--no-column \
	--no-heading \
	--fixed-strings \
	--ignore-case \
	--hidden \
	--follow \
	--glob '!.git/*' "$1" \
	| awk -F  ":" '/1/ {start = $2<5 ? 0 : $2 - 5; end = $2 + 5; print $1 " " $2 " " start ":" end}' \
	| fzf --preview 'bat --wrap character --color always {1} --highlight-line {2} --line-range {3}' --preview-window wrap
}

git config --global alias.ls "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias nv=neovide
alias vi=nv

ssh-add ~/.ssh/id_rsa

# export PATH="/usr/local/opt/llvm/bin:$PATH"
# source "/Users/zhangyifei/Projects/wukong/wukong-editor/third-party/skia/third_party/externals/emsdk/emsdk_env.sh"

# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<
export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# pnpm
export PNPM_HOME="/Users/zhangyifei/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
export PATH="/usr/local/opt/protobuf@3/bin:$PATH"