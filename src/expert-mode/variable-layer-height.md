% Variable Layer Height

Slic3r gives the ability to adjust the layer height between arbitrary
positions along the Z axis. That is, parts of the model could be printed
with a coarse layer height, for example vertical sections, and other
parts could be printed with a finer layer height, for example sloping
gradients where layering appears more pronounced.

The model in fig.  gives a rudimentary example of
where variable layer heights could be used to improve print quality. The
walls of the structure need not be rendered in high definition for
acceptable quality, however the sloping roof shows layer artifacts as
the layer height of 0.4mm is too coarse, particularly for the very top,
which is flattened. This is shown in the G-Code rendering in fig
.

 ![Example model highlighting use case for variable layer
heights.](images/variable_layer_height/example_model.png "fig:")


 ![Example with normal layer
height.](images/variable_layer_height/example_gcode_normal_layer_heights.png "fig:")


The variable layer height options are available by double clicking on a
part name in the Plater window. This will cause a pop-up window to be
displayed which contains two tabs. The first gives some information
about the model, as shown in fig.
.

 ![Variable layer height options -
Info.](images/variable_layer_height/variable_layer_height_options_tab_1.png "fig:")


It is worth noting the height of the model, as this will be useful when
calculating the maximum Z height.

The second tab (fig. )
presents a table where each row defines a layer height for a particular
range along the Z axis, given in millimeters. In this example the walls
of the model are printed at 0.4mm, the steeper parts of the roof are
printed at 0.2mm, and the less steep at 0.15mm. Note that each range
divides exactly by the given layer height so there are no "gaps" between
sections.

 ![Variable layer height options -
Layers.](images/variable_layer_height/variable_layer_height_options_tab_2.png "fig:")


The resulting G-Code (fig.
) shows a higher
definition which should result in a higher quality print.

 ![Example with variable layer
height.](images/variable_layer_height/example_gcode_variable_layer_heights.png "fig:")


Fig.  shows the example model printed. The print on
the left has 0.4mm layer height throughout, whereas the print on the
right has the variable layer height.

 ![Example print with variable layer
height.](images/variable_layer_height/example_print.jpg "fig:")


An additional feature of the variable layers height option is that by
entering a zero for a range that part of the model will not be printed.
Fig.  shows the G-Code where layers
between 0 and 4mm are skipped. This is a useful way of dividing a tall
model into multiple, shorter sections which can be printed individually
and assembled afterwards.

 ![Example with skipped
layers.](images/variable_layer_height/example_gcode_skipped_layers.png "fig:")

