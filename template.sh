#!/bin/bash
#https://github.com/vwarner1411/bash_boilerplate

#defaults
VERSION=0.1
ARGS="$@"
QUIET=false

#text processing
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'
BOLD='\033[1m'
UNDERLINE='\033[4m'

#help method
help()  {
  clear
  echo -e "${BOLD}NAME${NC}"
  echo    "    template.sh"
  echo -e "${BOLD}\nSYNOPSIS${NC}"
  echo    "    ./template --quiet"
  echo    "    ./template --version"
  echo    "    ./template --help"
  echo -e "${BOLD}\nDESCRIPTION${NC}"
  echo -e "    A BASH script template, with a very useful description.\n"
  echo -e "${BOLD}\nOPTIONS${NC}"
  echo    "    -q, --quiet          No output unless there is a failure."
  echo    "    -V, --version        Display version information and exit."
  echo    "    -h, --help           Display this help and exit."
  echo -e "${BOLD}\nEXAMPLES${NC}"
  echo    "    Run in interactive mode."
  echo    "        ./template"
  echo    "    Run in quiet mode. This will have no output unless there is a failure."
  echo    "        ./template -q"
  echo    "    Display version information."
  echo    "        ./template -V"
  echo -e "${BOLD}\nBUGS${NC}"
  echo    "    No known bugs"
  echo -e "${BOLD}\nAUTHOR${NC}"
  echo    "    Valerie Warner (https://github.com/vwarner1411)"
  echo
  exit 1
}

main() {
  #get command line options
  while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
    -q | --quiet)
      QUIET=true
      ;;
    -V | --version)
      echo "Version: $VERSION"
      exit 1
      ;;
    -h | --help)
      help
      ;;
    *)
      echo "unknown flag $1"
      exit 1;
      ;;
  esac; shift; done
  if [[ "$1" == '--' ]]; then shift; fi

  #main body of script
  if ! $QUIET; then echo "Hostname: $(hostname -f | tr '[:upper:]' '[:lower:]')"; fi
}

#left args unquoted to achieve word splitting
main $ARGS
