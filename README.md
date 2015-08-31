# bashconfig
Settings and aliases for bash

Different distributions have different defaults for .bashrc, .profile, or other
means of configuring bash.  Whatever scheme your distro uses, you can just add
the line:

    source ~/.bashconfig/config.sh ~/.bashconfig

And it will source the correct files.  There are three files:

* `bash_common` - Common config items go here
* `bash_aliases` - Aliases go here to keep the common file cleaner
* `bash_local` - Settings local to this machine go here.  This file is
  (obviously) not tracked in git, but the config file sources it if it exists.
