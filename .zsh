# ======================
# ~/.zshrc  (macOS + zsh)
# ======================

# ----- Segurança: não reprocesse em shells não interativos -----
[[ $- != *i* ]] && return

# ----- Preferências do zsh -----
set -o noclobber
set -o notify
setopt autopushd
setopt histignoredups sharehistory
HISTSIZE=5000
SAVEHIST=5000

# Prompt simples (pode trocar por oh-my-zsh / starship depois)
PROMPT='%F{cyan}%n@%m%f %F{yellow}%1~%f %# '

# ----- SDKMAN (se instalado) -----
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# ----- Java (OpenJDK 21 via Homebrew, se existir) -----
if [ -d "/opt/homebrew/opt/openjdk@21" ]; then
  export JAVA_HOME="/opt/homebrew/opt/openjdk@21"
elif [ -d "/usr/local/opt/openjdk@21" ]; then
  export JAVA_HOME="/usr/local/opt/openjdk@21"
fi
[ -n "$JAVA_HOME" ] && export PATH="$JAVA_HOME/bin:$PATH"

# ----- Rancher Desktop (do seu setup) -----
[ -d "$HOME/.rd/bin" ] && export PATH="$HOME/.rd/bin:$PATH"

# ----- Aliases úteis -----
alias ll='ls -la'
alias gs='git status'
alias gd='git diff'
alias k='kubectl'
alias d='docker'
alias v='nvim'

# ----- Integração com Nushell -----
# Atalho para entrar no Nushell quando quiser:
alias nu='nu'

# (Opcional) Função que abre Nushell carregando o mesmo diretório e volta quando sair
nuin() {
  # entra no Nushell no diretório atual
  command -v nu >/dev/null 2>&1 || { echo "Nushell não encontrado (instale com: brew install nushell)"; return 1; }
  nu
}

# ----- Compleções (se quiser) -----
autoload -Uz compinit && compinit

# ----- Path de usuário extra (último para não sobrescrever brew/java) -----
export PATH="$HOME/.local/bin:$PATH"

# --- Start Nushell automatically when Zsh is launched ---

# Evita loop: só inicia Nu em shells interativos de login
if [[ $- == *i* ]] && [ -z "$NU_STARTED_FROM_ZSH" ]; then
  export NU_STARTED_FROM_ZSH=1
  exec nu
fi
