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

pulsarvnc() {
  printf "* Port-forwarding of VNC connection to pulsar ... "
  ssh -N -f -L 5900:localhost:5900 pulsar
  echo "done"
}
