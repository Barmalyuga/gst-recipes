#!/bin/sh
# you can either set the environment variables AUTOCONF and AUTOMAKE
# to the right versions, or leave them unset and get the RedHat 7.3 defaults
if test -z $AUTOMAKE; then 
  export AUTOMAKE=automake-1.5 
  export ACLOCAL=aclocal-1.5
fi

# if you would want to be running autoheader as well, you will have to do
# something similar as above for it
if test -z $AUTOCONF; then export AUTOCONF=autoconf-2.53; fi
set -x

# if any of these steps fails, the others will not execute, which is good
# we want to treat errors as soon as possible
$ACLOCAL && 
libtoolize --force && \
# autoheader
$AUTOMAKE -a && \
$AUTOCONF && \
./configure

