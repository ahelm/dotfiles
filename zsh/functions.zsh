create_virtual_env() {
  local prompt_name=$1

  if [ -z "$1" ]; then
    prompt_name=$(basename $PWD)
  fi

  echo "> creating venv '$prompt_name'"
  python3 -m venv --prompt "$prompt_name" .venv
  echo "> updating pip"
  .venv/bin/pip install -U pip >/dev/null
}

pulsarvnc() {
  printf "* Port-forwarding of VNC connection to pulsar ... "
  ssh -N -f -L 5900:localhost:5900 pulsar
  echo "done"
}
