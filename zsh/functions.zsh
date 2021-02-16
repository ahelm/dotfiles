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

activate_virtual_env() {
  local pwd_array=(${(@s:/:)PWD})
  local dir="$PWD"

  # go backwards from current directory and find '.venv' directory
  for ((i=${#pwd_array[@]}; i > 1; i--)); do
    dir=/${(j:/:)pwd_array:0:$i}

    if [ -d "$dir/.venv" ]; then
      echo "> activating '$dir/.venv'"
      source $dir/.venv/bin/activate
      return
    fi
  done

  >&2 echo "[ERROR] Did not find a '.venv' directory to active venv"
  return 1
}

pulsarvnc() {
  printf "* Port-forwarding of VNC connection to pulsar ... "
  ssh -N -f -L 5900:localhost:5900 pulsar
  echo "done"
}
