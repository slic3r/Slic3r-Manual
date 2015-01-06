% Command Line Usage

Almost all Slic3r features can be accessed from the command line. You can
thus call Slic3r as part of a script or install it in an embedded system
or headless server.

To get the full listing and reference of available command line switches,
just run:

    slic3r --help

**Note:** you might need to replace `slic3r` with the name and/or path to the
Slic3r executable which might be:

* `slic3r-console.exe` on Windows
* `slic3r` on GNU/Linux
* `Slic3r.app/Contents/MacOS/slic3r` on MacOS X
* `perl slic3r.pl` on all platforms if you're running from git/source code

Generating G-code
-----------------

In order to slice a model into G-code you just need to supply the STL file
along with any config option you'd like to use:

    slic3r my_model.stl --layer-height 0.2

This will generate a file named *my_model.gcode* in the same directory as 
the input STL file. You may want to specify a custom output path:

    slic3r my_model.stl --layer-height 0.2 --output /path/to/output.gcode

The argument for `--output` can also be a directory; in that case the file
will follow the automatic naming scheme (which you can override using the
`--output-filename-format` option; see manual chapter about placeholders).

### Configuration

**Note:** the print/filament/printer presets defined in the graphical interface
are completely ignored when running in command line mode. Slic3r will always
default to its factory default settings.

You'll need to export your desired configuration with the *Export Config...*
command, which is located in the *File* menu. It will prompt you to save a
`.ini` file that you can load from command line this way:

    slic3r my_model.stl --load my_config.ini

You can override single options by appending them as command line switches:

    slic3r my_model.stl --load my_config.ini --fill-pattern concentric

You can also create a config file from command line:

    slic3r --nozzle-diameter 0.35 --filament-diameter 2.85 \
        --temperature 185 --first-layer-temperature 195 --layer-height 0.2 \
        --save my_config.ini

If you're an advanced user you can split your configuration into multiple 
*.ini* files and load them by appending multiple `--load` switches.

One more way to use the print/filament/printer presets on command line is
launching Slic3r with the `--autosave` option:

    slic3r --autosave my_config.ini

The above command will launch the graphical interface of Slic3r but will
automatically export the current configuration to the specified file. Thus,
the last used presets will be remembered whenever you `--load` that file.

### Processing multiple input files

If you supply multiple input files Slic3r will process them separately, 
by generating a distinct G-code file for each one:

    slic3r model1.stl model2.stl model3.stl

The command above will generate *model1.gcode*, *model2.gcode*,
*model3.gcode*.

If you want to process multiple files as a single print job, you can use
the `--merge` (or `-m`) option:
    
    slic3r -m model1.stl model2.stl model3.stl

This will only generate a file named *model1.gcode* (but you can use the 
`--output` option described above to set a custom name) containing all three
objects. Note that auto-arranging currently works best when all objects have
similar sizes.

### Positioning files in the G-code coordinates

Input file(s) will be centered around the G-code point defined by the
`--print-center` option:

    slic3r my_model.stl --print-center 40,40

By default, the center point is set to 100,100.

Repairing models
----------------

Slic3r can be used to repair files from command line:

    slic3r --repair my_model.stl

This will generate a file named *my_model_fixed.obj* in the same directory
as the original one. This output filename is not customizable at the moment,
as well as the OBJ output format which is preferred over STL because it will
keep the model manifold by avoiding numerical issues frequently happening 
with STL. Note that Slic3r and most 3D applications are able to read OBJ files.

The `--info` switch can be used to get information about a file:

    slic3r --info cube.stl
    Info about cube.stl:
      size:              x=20.000 y=20.000 z=20.000
      number of facets:  12
      number of shells:  1
      volume:            8000
      needed repair:     no

Cutting models
--------------

Slic3r can be used to repair models from command line:

    slic3r --cut 10.2 my_model.stl

This will generate two files named *my_model_lower.stl* and *my_model_upper.stl*
in the same directory as the original model.

**Note:** the object will be automatically placed on the *z = 0* plane before cutting, so 
the argument for the `--cut` option is relative to the object's bottom, and
not to the original coordinate system.

Embedding Slic3r
----------------

The following options can be useful for embedding Slic3r into host applications:

* `--no-plater` will launch Slic3r in a configuration-only mode, thus avoiding
  confusion if the host application provides its own model loading dialog;
* `--autosave` will automatically export the last selected config to a specified
   file (see the above paragraph about [Configuration] for its usage);
* `--gui-mode` can take the `simple` or `expert` arguments, and will force Slic3r
  to launch in the specified mode regardless of the Preferences setting.
* `--datadir` followed by the path to a directory will tell Slic3r to use that directory 
  for storing and reading its configuration instead of the default system preferences
  directory. (See the page about [configuration organization](/configuration-organization/configuration-organization) for more details.)

