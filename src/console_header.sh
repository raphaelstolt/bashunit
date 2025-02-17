#!/bin/bash

function console_header::print_version() {
  if [[ $HEADER_ASCII_ART == true ]]; then
    cat <<EOF
 _               _                   _
| |__   __ _ ___| |__  __ __ ____ (_) |_
| '_ \ / _' / __| '_ \| | | | '_ \| | __|
| |_) | (_| \__ \ | | | |_| | | | | | |_
|_.__/ \__,_|___/_| |_|\___/|_| |_|_|\__|
EOF
    printf "%s\n\n" "$BASHUNIT_VERSION"
  else
    printf "${_COLOR_BOLD}${_COLOR_PASSED}bashunit${_COLOR_DEFAULT} - %s\n" "$BASHUNIT_VERSION"
  fi
}

function console_header::print_version_with_env() {
    local should_print_ascii="true"
    if [[ "$SHOW_HEADER" != "$should_print_ascii" ]]; then
      return
    fi
    console_header::print_version
}

function console_header::print_help() {
    cat <<EOF
bashunit [arguments] [options]

Arguments:
  Specifies the directory or file containing the tests to run.
  If a directory is specified, it will execute the tests within files ending with test.sh.
  If you use wildcards, bashunit will run any tests it finds.

Options:
  -f|--filer <filter>
    Filters the tests to run based on the test name.

  -s|simple || -v|verbose
    Enables simplified or verbose output to the console.

  -S|--stop-on-failure
    Force to stop the runner right after encountering one failing test.

  -e|--env <file-path>
    Load a custom env file overriding the .env environment variables.

  --version
    Displays the current version of bashunit.

  --help
    This message.

See more: https://bashunit.typeddevs.com/command-line
EOF
}
