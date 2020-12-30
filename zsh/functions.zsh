venv() {
  if [ -z "$1" ]; then
    echo >&2 "No name passed for the prompt!"
    echo >&2 "aborting ..."
    return 1
  else
    echo "> creating venv '$1'"
    python3 -m venv --prompt "$1" .venv
    echo "> updating pip"
    .venv/bin/pip install -U pip > /dev/null
  fi
}
