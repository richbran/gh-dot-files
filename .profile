# set the default editor
export EDITOR=/usr/bin/vim

######
# Colors
######
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LESS="--RAW-CONTROL-CHARS"

######

######
# Set up PATH
######
# Add MySQL to path
PATH=$PATH:/usr/local/mysql/bin

# User level executables
PATH=$PATH:~/.bin

# Add RVM to PATH for scripting
# Temporarily disabling it until I fix rvm.
# PATH=$HOME/.rvm/bin:$PATH

# Get iPython and other programs to work
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/Current/bin

# Get Racket to work
PATH=$PATH:/usr/local/racket

# Add /usr/local/sbin to PATH to stop homebrew from complaining each time
PATH=$PATH:/usr/local/sbin

# Need my installs in /usr/local/bin to take precedence over ones in /usr/bin
# But first remove it from its current position in PATH
PATH=${PATH/\/usr\/local\/bin:/}
PATH=/usr/local/bin:$PATH

# Including Apache Ant & Apache Maven in the PATH variable
PATH=$PATH:/usr/local/apache-ant:/usr/local/maven:$(/usr/libexec/java_home)

# Final clean up of the PATH variable
# This has been tested to see that this works
# echo "hello:world:hello:pluto" | \
# awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS;\
# printf "%s", $a[$1]}'
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) \
        printf ORS; printf $a[$1]}')
######

export PYTHONSTARTUP="$HOME/.python/startup.py"

######
# Setting environmental variables for Java
######

# Setting JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)

# Setting up CLASSPATH for java
export CLASSPATH=$CLASSPATH:/usr/local/lib/jar/
# Temporary hack for getting classpath to work with the code in Thinking in java
export CLASSPATH=$CLASSPATH:~/Documents/Work/Code_Pen/java/Thinking_in_Java/TIJ4-code/

# Including libraries for java algorithms testing (Sedgewick & Wayne)
export CLASSPATH=$CLASSPATH:~/Code_Pen/java/Algorithms_Java_Lib/algs4.jar:~/Code_Pen/java/Algorithms_Java_Lib/stdlib.jar:.

######

# Set a global history file for R
export R_HISTFILE=~/.Rhistory

# For docbooks support-brew installed it here
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

######
# Handling MIT scheme
######
export MITSCHEME_LIBRARY_PATH="/Applications/MIT\:GNU\ Scheme.app/Contents/Resources"
export MIT_SCHEME_EXE="/usr/local/bin/scheme"

######

# Setting the persistent folder for screen sockets
export SCREENDIR=~/.screen

######

# Getting pkg-config to work
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

######

# Ensuring that Homebrew always builds from source
export HOMEBREW_BUILD_FROM_SOURCE=1
