#!/bin/false

quirks__hyprland() {
  export YDOTOOL_SOCKET=/run/user/$(id -u)/.ydotool_socket
  
  # Make sure the variable is exported to activation environments
  UWSM_FINALIZE_VARNAMES="${UWSM_FINALIZE_VARNAMES}${UWSM_FINALIZE_VARNAMES:+ }YDOTOOL_SOCKET"
}

