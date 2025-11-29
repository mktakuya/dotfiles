if type "pnpm" > /dev/null 2>&1; then
  case ${OSTYPE} in darwin*)
    export PNPM_HOME="$HOME/Library/pnpm"

    case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
  esac
fi
