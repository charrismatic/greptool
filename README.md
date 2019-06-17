
# greptool

> grep helper function and command line flag manager

Version: 1.0.0

Topics: [linux](https://github.com/topics/linux),  [bash](https://github.com/topics/bash),  [grep](https://github.com/topics/grep),  [search](https://github.com/topics/search),  


## About

This package has two components (1) a grep wrapper script command that applies flags and settings at runtime (2) a configuration helper for writing settings file and managing config

__Grep runtime setting from a file or env variables__

Store project specific settings and preconfigured searches in a stanardized file

If you find yourself writing advanced searches using grep very often then this tool may be helpful. It can be especially powerful when combined with the `findtool` companion utility (*\*under development*).  

- Configure searches with environment variables
- Create grep scriptlets for directories for commonly used search and list operations.
- Read options from from a config file in the user home directory `.greprc`
- Override global options with a `.greprc` file in the current directory  
- Override any option using session enviornment varibles or appending regular grep commandline flag as usual



## Installation

Link the files location in `bin` to your user path (~/bin).

For convenience there is an install script INSTALL.sh that can do this for you.

### Options

Each of the options available in `man grep` are recognized by the tool.

Since the utility primarily works with environment variables the values are written in all uppercase and
prefixed with `GREP_`

A subset of the values do not make sense when the command is not being run directly (when running in a pipe). They are not set when the input is not a tty.

For detailed explanation of all the option refer to  grep manpages `man grep`.


#### OUTPUT DISPLAY OPTIONS

```bash
GREP_AFTER=3
GREP_BEFORE=1
GREP_DEBUG="yes"
GREP_COLOR="yes"
GREP_LINENUM="yes"
GREP_FILENAME="yes"
GREP_GROUPS="no"
GREP_QUIET="yes"
```

- __GREP_BEFORE__  `-B, --before-context=NUM`
- __GREP_AFTER__ `-A, --after-context=NUM`

Controls the amount of context lines shown with results

Note: Any time the `after/before` context flags are set in grep it adds `--` dividers between each group.  You can disable them with `GREP_GROUPS="no"` but it is simpler to comment out the before and after settings if you do not want this behavior.

- __GREP_QUIET__ `-s, --no-messages`

Disables greps default warning messages that are often unhelpful.

- __GREP_DEBUG__  Not a grep flag. This option is only related to this package specificly and prints extra output throughout the program.

#### SELECTION PATTERN OPTIONS

```bash
GREP_NOCASE="no"
GREP_REGEX_EXT="no"
GREP_BINARY="no"
```
 - GREP_NOCASE  `-i, --ignore-case` case insensitive mode
 - GREP_REGEX_EXT  `-E, --extended-regexp` extended regex mode
 - GREP_BINARY  `-a, --text` binary as text mode

# EXCLUDE/IGNORE OPTIONS

```bash
GREP_EXCLUDE_PATTERN="*.min.js,*.min.css"
GREP_EXCLUDE_FILE="$HOME/.grepignore"
GREP_EXCLUDE_DIRS=".git,node_modules"
```

__GREP_EXCLUDE_PATTERN__  `--exclude=GLOB`


2.

   `--exclude-from=FILE`

Skip files whose base name matches any of the file-name globs read from FILE


3.

Skip  any  command-line directory with a name suffix that matches the pattern GLOB.
When searching recursively, skip any subdirectory whose base name matches GLOB.
Ignore any redundant trailing slashes in GLOB.

   `--exclude-dir=GLOB`


## Usage


greptool commands

The following greptool commands are used to set environment variables used by the grep helper command and write and .greprc files that can be used by that command.

**note: much of functionality for this part is still experimental**

```
  help                  - print this message
  list                  - show all option values
  get <option>          - get a current variable value
  set <option> <value>  - set variable to a new value
  save <file>           - output the current environment to file in th current directory
  reset                 - sets all variables to the initial default
  reload                - reload the local grep.env file
  update                - manually update grep flags (Only needed if youve made
                          chages to the env outside of this script)
  clear                 - remove all related env variables from the current session
  debug                 - print all environment variables and some that might not be related
```

### Author

Matt Harris <charrismatic@protonmail.com> (https://charrismatic.github.io/)



### Licesnse

ISC[ISC](https://opensource.org/licenses/undefined)
