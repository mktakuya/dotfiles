if type "gcloud" > /dev/null 2>&1; then
  case ${OSTYPE} in darwin*)
    export PATH="/opt/homebrew/share/google-cloud-sdk/bin:$PATH"
  esac
fi
