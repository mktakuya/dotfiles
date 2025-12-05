alias g="git"
alias gb="git branch"
alias gst="git status"

alias ls="ls --color"
alias sl="ls"
alias be="bundle exec"

if [ -x "`which gcloud`" ]; then
  alias gae-ssh='(){ gcloud --project $1 app instances ssh $(gcloud --project $1 --format json app instances list --service $2 --sort-by="~instance.startTime" | jq -r ".[0].id") --service $2 --version $(gcloud --project $1 --format json app instances list --service $2 --sort-by="~instance.startTime" | jq -r ".[0].version") }'
  alias gae-scp='function _gae_scp(){ pj="$1"; sv="$2"; inst=$(gcloud app instances list --project "$pj" --service "$sv" --format=json --sort-by="~instance.startTime" | jq -r ".[0].id"); ver=$(gcloud app instances list --project "$pj" --service "$sv" --format=json --sort-by="~instance.startTime" | jq -r ".[0].version"); gcloud app instances scp --project "$pj" --service "$sv" --version "$ver" "$inst"; }; _gae_scp'
  alias gae-scp-pull='function _g(){ pj="$1"; sv="$2"; rpath="$3"; lpath="$4"; inst=$(gcloud app instances list --project "$pj" --service "$sv" --format=json --sort-by="~instance.startTime" | jq -r ".[0].id"); ver=$(gcloud app instances list --project "$pj" --service "$sv" --format=json --sort-by="~instance.startTime" | jq -r ".[0].version"); gcloud app instances scp --project "$pj" --service "$sv" --version "$ver" "$inst:$rpath" "$lpath"; }; _g'
fi
