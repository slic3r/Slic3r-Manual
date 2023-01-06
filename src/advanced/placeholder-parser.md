% Custom GCode Placeholder Reference

# Overview

Slic3r supports a variety of placeholders from settings and some internal values
for use in Custom G-Code.

# All situations

* Any configuration setting.
    * For easy reference, export your current print configuration to an .ini
      file and open it with a text editor.
* `[input_filename]` &ndash; Input filename
* `[input_filename_base]` &ndash; Input filename with extension stripped
    * object.stl -> object
* `[timestamp]` &ndash; Current date/time
    * Each component from the timestamp is available: [year], [month], [day],
      [hour], [minute], [second]
* `[scale]`
   * `[scale_0]`, `[scale_1]`, … for specific scales
* `[print_preset]` &ndash; name of the current print preset. Only available when
  using plater GUI.
* `[filament_preset]` &ndash; name of the current filament preset. Only available
  when using plater GUI.
* `[printer_preset]` &ndash; name of the current printer preset. Only available
  when using plater GUI.
* `[layer_z]` &ndash; Z height of the active layer.
    * Automatically set by Slic3r.
* `[layer_num]` &ndash; Integer number of the active layer.
    * Automatically set by Slic3r.
* `[current_extruder]` &ndash; Currently selected extruder.
    * Automatically set by Slic3r.

Note: Multi-value options can be called with indices, like `[nozzle_diameter_1]`.

# Filament Start/End G-Code
The following items are available only for Filament Start/End G-Code.

* `[filament_extruder_id]`
    * Value of this setting is the current extruder this filament profile is
      loaded.
    * Automatically set by Slic3r.

# Before/After Layer Change G-Code

* `[current_retraction]` &ndash; Amount retracted for the current extruder.
    * Automatically set by Slic3r.

# Toolchange G-Code

The following items are available only during Toolchange Custom G-Code.

* `[next_extruder]`
    * Automatically set by Slic3r.
* `[prev_extruder]`
    * Automatically set by Slic3r.
* `[next_retraction]`
    * Automatically set by Slic3r.
* `[previous_retraction]`
    * Automatically set by Slic3r.
