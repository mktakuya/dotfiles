# ----- mise
# IDE や非対話のログインシェルでも mise 管理のツールが解決されるように shims を PATH に足す。
# この時点では ~/.local/bin が PATH に載っていないため、mise はフルパスで呼ぶ。
# 対話シェルでは、この後 .zshrc.d/mise.zsh の mise activate が PATH を直接組み替える
if [[ -x $HOME/.local/bin/mise ]]; then
  eval "$($HOME/.local/bin/mise activate zsh --shims)"
fi
