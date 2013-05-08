# v8-install

Scripts to install a standalone version of Google's V8 for all users on the system

## Dependencies

Git 

## Installation

Clone this repo and run install.sh

	$ git clone git://github.com/davidmuto/v8-install.git && cd v8-install
	$ sudo ./install.sh

The script performs the following actions:

* clones/pulls the v8 repo to /usr/local/src/v8
* creates the following symlinks (link -> source):
	* /usr/local/bin/v8 -> /usr/local/src/v8/out/native/shell
	* /usr/local/bin/d8 -> /usr/local/src/v8/out/native/d8
	* /usr/include/v8 -> /usr/local/src/include

To use V8 in an app include the following:

	#include <v8/v8.h>

To test the shell just run v8/d8 from any directory

## Updating V8

CD to the repo directory and run the same script to update the repo, rebuild and update the symlinks

	$ sudo ./install.sh

## Coming Soon

Windows installation
