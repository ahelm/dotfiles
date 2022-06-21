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

update_virtual_env() {
  local preactivated_env=true

  # check if inside virtual enviroment
  if [ -z "$VIRTUAL_ENV" ]; then
    activate_virtual_env
    preactivated_env=false
  fi

  # update pip packages
  echo "> running update"
  pip freeze --user | cut -d'=' -f1 | xargs -n1 pip install -U

  # deactivate previous enviroment if it was not active
  if [ "$preactived_env" = false ]; then
    echo "> deactivating virtual enviroment"
    deactivate
  fi
}

pulsarvnc() {
  printf "* Ensuring port is being forwarded ... "
  [ $(ps aux | grep "ssh -N -f -L 5959:localhost:5900 pulsar" | wc -l) -eq 1 ] && ssh -N -f -L 5959:localhost:5900 pulsar
  echo "done"
  open vnc://localhost:5959
}
