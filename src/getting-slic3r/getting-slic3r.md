% Downloading

Slic3r can be downloaded directly from:
<http://slic3r.org/download>.

Pre-compiled packages are available for Windows, Mac OS X and Linux.
Windows users can choose between 32 and 64 bit versions to
match their system.

Source
------

The source code is available via GitHub:
<https://github.com/alexrj/Slic3r>. For more details on building from
source see § below.

Installing
==========

Windows
-------

Unzip the downloaded zip file to a folder of your choosing, there is no
installer script. The resulting folder contains three executables:

-   `Slic3r.exe` - starts the GUI version.

-   `Slic3r-console.exe` - can be used from the command line.

-   `Slic3r-debug-console.exe` - starts the GUI version and provides a debugging output console.

The folder also contains a `libexec` directory, which contains the rest of the
important support files for Slic3r. Do not remove this folder or move it away
from the exe files or Slic3r will not work!

The zip file may then be deleted.

Mac OS X
--------

Double-click the downloaded dmg file, an instance of Finder should open
together with an icon of the Slic3r program. Navigate to the
Applications directory and drag and drop the Slic3r icon into it. The
dmg file may then be deleted.

Linux
-----

Extract the archive to a folder of your choosing.  Start Slic3r directly by
running the Slic3r shell script, found in the root directory.
    

The archive file may then be deleted.

Building from source
====================

For those wishing to live on the cutting edge, Slic3r can be compiled
from the latest source files found on GitHub[^1].

Up-to-date instructions for compiling and running from source can be
found on the Slic3r wiki.

-   **GNU Linux**

    <https://github.com/alexrj/Slic3r/wiki/Running-Slic3r-from-git-on-GNU-Linux>

-   **OS X**

    <https://github.com/alexrj/Slic3r/wiki/Running-Slic3r-from-git-on-OS-X>

-   **Windows**

    <https://github.com/alexrj/Slic3r/wiki/Running-Slic3r-from-git-on-Windows>

[^1]: <https://github.com/alexrj/Slic3r>
