Speed
=====



Once the printer is reliably producing good quality prints it may be
desirable to increase the speed. Doing this provides several benefits,
the most obvious of which is that the results are produced quicker, but
also faster print times can be utilised in producing more layers, i.e.
lower layer height, thus improving perceived print quality. An
additional benefit is that a faster travel movement, between extrusions,
can reduce the effects of oozing.

The best approach is to increment the various speed parameters in small
steps and observe the effect each change has on print quality. Travel
speed is a safe starting point, and it is not unrealistic to attain
speeds of up to 250mm/s (if your printer can handle it). Adjusting the
speed of perimeters, infill is available in simple mode, and the general
rule is to have the perimeter go a little slower than the infill in
order to reduce possible blemishes on the surface (infill can be faster
because slight gaps will not matter as much).

Expert mode offers more parameters to fine tune printer speeds.
Differentiation between external, small and other perimeters, infill
locations, and bridges and gaps are available, as well as the ability to
slow down for the first layer.

 ![Expert mode speed
options.](expertmode/speed_advanced_settings.png "fig:")


Where indicated a value can be given in percentage. This is in relation
to the preceding value, e.g. 50% solid infill would be half of the value
defined for infill.

A few general guidelines for each option:

-   `Perimeters` - In expert mode this parameter can be increased
    slightly as the `External perimeters` option can be used to ensure
    blemish free external faces.

-   `Small perimeters` - Meant for holes, islands and fine details, a
    slower speed here is recommended.

-   `External perimeters` - A slightly slower value may ensure cleaner
    surfaces.

-   `Infill` - As fast as you can without compromising the integrity of
    the fill structure. Faster extrusions can break and result in weak
    spots.

-   `Solid infill` - The bottom of the model, and any additional solid
    layers is usually slightly slower than infill but faster than
    perimeters.

-   `Top solid infill` - Allow time for the extrusion to cleanly cover
    the previous top layers and result in a tidy top surface. the last
    few layers should have bridged the infill structure nicely,
    preparing the way for a neat finish.

-   `Support material` - Generally support structures are quick and
    dirty, and so long as the base is adequately supported they can be
    built as quickly as they can.

-   `Bridges` - Having the extrusion span distances depends on the
    material and cooling. Going too slow will result in sagging, too
    fast will result in broken strands. Experimentation is the key here,
    but generally bridging runs slower than perimeters.

-   `Gap fill` - Filling in small gaps results in the extruder quickly
    oscillating and the resulting shaking and resonance could have a
    detrimental affect on the printer. A smaller value here can guard
    against this. A setting of zero disables gap filling completely.

-   `Travel` - As fast as your printer will allow in order to minimise
    ooze.

-   `First layer speed` - As mentioned in section
    , the first layer is important to
    lay down correctly, and a slower pace helps enormously. Setting a
    value of 50%, or even less, can really help.

`Acceleration control` is an advanced setting allowing acceleration
settings for perimeters, infill, bridge, as well as a default setting,
to be made. Deciding which values to set depends on the capabilities of
the machine. Any settings within the firmware may be a good starting
point.

Take into account any restrictions enforced by the firmware as many have
settings for the maximum safe speed of each axis.

Infill Patterns and Density
===========================



There are several considerations when choosing an infill pattern: object
strength, time and material, personal preference. It can be inferred
that a more complex pattern will require more moves, and hence take more
time and material.

 ![Infill pattern
settings.](expertmode/infill_pattern_settings.png "fig:")


Slic3r offers several infill patterns, four regular, and three more
exotic flavours. The numbers given in brackets below each figure are a
rough estimate of material used and time taken for a simple 20mm cube
model[^1]. Note that this is only indicative, as model complexity and
other factors will affect time and material.

 ![Infill pattern: Line (344.51mm /
5m:20s)](expertmode/infill_line.png "fig:") 

 ![Infill pattern: Rectilinear (350.57mm /
5m:23s)](expertmode/infill_rectilinear.png "fig:")


 ![Infill pattern: Concentric (351.80mm /
5m:30s)](expertmode/infill_concentric.png "fig:")


 ![Infill pattern: Honeycomb (362.73mm /
5m:39s)](expertmode/infill_honeycomb.png "fig:") 

 ![Infill pattern: Hilbert Curve (332.82mm /
5m:28s)](expertmode/infill_hilbertcurve.png "fig:")


 ![Infill pattern: Archimedean Chords (333.66mm /
5m:27s)](expertmode/infill_archimedeanchords.png "fig:")


 ![Infill pattern: Octagram Spiral (318.63mm /
5m:15s)](expertmode/infill_octagramspiral.png "fig:")


Certain model types are more suited for a particular pattern, for
example organic versus mechanical types. Figure
 shows how a honeycomb fill may
suit this mechanical part better because each hexagon bonds with the
same underlying pattern each layer, forming a strong vertical structure.

 ![Infill pattern comparison in a complex object. Left to Right:
honeycomb, line](expertmode/complex_object_infill_comparison.png "fig:")


Most models require only a low density infill, as providing more than,
say, 50% will produce a very tightly packed model which uses more
material than required. For this reason a common range of patterns is
between 10% and 30%, however the requirements of the model will
determine which density is best. Figure 
shows how the patterns change as the density increases.

 ![Infill patterns at varying densities. Left to Right:
20%,40%,60%,80%. Top to Bottom: Honeycomb, Concentric, Line,
Rectilinear, Hilbert Curve, Archimedean Chords, Octagram
Spiral](expertmode/infills.png "fig:") 

Infill Optimization
===================



Slic3r contains several advanced infill settings which can help produce
better extrusions.

 ![Infill advanced
settings.](expertmode/infill_advanced_settings.png "fig:")


-   `Infill every n layers` - Will produce sparse vertical infill by
    skipping a set number of layers. This can be used to speed up print
    times where the missing infill is acceptable.

-   `Only infill where needed` - Slic3r will analyse the model and
    choose where infill is required in order to support internal
    ceilings and overhangs. Useful for reducing time and materials.

-   `Solid infill every n layers` - Forces a solid fill pattern on the
    specified layers. Zero will disable this option.

-   `Fill angle` - By default the infill pattern runs at 45° to the
    model to provide the best adhesion to wall structures. Infill
    extrusions that run adjacent to perimeters are liable to de-laminate
    under stress. Some models may benefit from rotating the fill angle
    to ensure the optimal direction of the extrusion.

-   `Solid infill threshold area` - Small areas within the model are
    usually best off being filled completely to provide structural
    integrity. This will however take more time and material, and can
    result in parts being unnecessarily solid. Adjust this option to
    balance these needs.

-   `Only retract when crossing perimeters` - Retracting, to prevent
    ooze, is unnecessary if the extruder remains within the boundaries
    of the model. Care should be taken if the print material oozes
    excessively, as not retracting may result in enough material loss to
    affect the quality of the subsequent extrusion. However, most modern
    printers and materials rarely suffer from such extreme ooze
    problems.

-   `Infill before perimeters` - Reverses the order in which the layer
    is printed. Usually the perimeter is laid down initially, followed
    by the infill, and this is usually the preferable as the perimeter
    acts as a wall containing the infill.

Fighting Ooze
=============



Unless the material being extruded has a very high viscosity it will
ooze from the nozzle in between extrusions. There are several settings
in Slic3r to which can help to remedy this.

The retraction settings, found in the `Printer` tab, tell the printer to
pull back the filament between extrusion moves. This can alleviate the
pressure in the nozzle, thus reducing ooze. After the subsequent travel
move the retraction is reversed to prepare the extruder for the next
extrusion.

 ![Retraction settings.](expertmode/retraction_settings.png "fig:")


-   `Length` - The number of millimeters to retract. Note that the
    measurement is taken from the raw filament entering the extruder. A
    value of between 1 and 2mm is usually recommended. Bowden extruders
    may need up to 4 or 5mm due to the hysteresis introduced by the
    tube.

-   `Lift Z` - Raises the entire extruder on the Z axis by that many
    millimeters during each travel. This can be useful to ensure the
    nozzle will not catch on any already laid filament, however it is
    usually not necessary and will slow the print speed. A value of
    0.1mm is usually sufficient.

-   `Speed` - The speed at which the extruder motor will pull back the
    filament. The value should be set to as quick as the extruder can
    handle without skipping steps, and it is worth experimenting with
    this value to find the quickest retraction possible.

-   `Extra length on restart` - Adds an extra length of filament after
    the retraction is compensated after the travel move. This setting is
    rarely used, however should the print show signs of not having
    enough material after travel moves then it may be useful to add a
    small amount of additional material.

-   `Minimum travel after retraction` - Triggering a retraction after
    very short moves is usually unnecessary as the amount of ooze is
    usually insignificant and it slows down the print times. Set the
    number of millimeters minimum distance the nozzle must move before
    considering a retraction. If the printer handles ooze well this can
    be increased to 5 or 6mm.

-   `Retract on layer change` - Movement along the Z axis must also be
    considered when dealing with oozing, otherwise blobs may occur. It
    is recommended to leave this setting on.

-   `Wipe before retract` - Moves the nozzle whilst retracting so as to
    reduce the chances of a blob forming.

Additionally there are several settings in the `Print` tab which can
help control oozing.

-   `Only retract when crossing perimeters` (Infill) - Tells Slic3r to
    only retract if the nozzle will cross the threshold of the current
    island being extruded. Slight ooze within the walls of a part are
    not seen and can usually be accepted.

-   `Avoid crossing perimeters` (Layers and perimeters - Advanced) -
    Will force the nozzle to follow perimeters as much as possible to
    minimise the number of times it must cross them when moving around,
    and between, islands. This has a negative impact on both G-code
    generation and print times.

-   `Randomize starting points` (Layers and perimeters - Vertical
    shells) - As the extruder moves up to the start of the next layer
    any ooze can result in blobs. If the same start point is used for
    every layer then a seam can form the length of the object. This
    setting will move the start point to a difference location for each
    layer.

See also section : Sequential Printing
for another technique which can minimise strings forming between
objects.

Skirt
=====



The `Skirt` setting adds an extrusion a short distance away from the
perimiter of the object. This can ensure that the material is flowing
smoothly from the extruder before it starts on the model proper.

 ![Skirt settings.](expertmode/skirt_settings.png "fig:")


-   `Loops` - How many circuits should be completed before starting on
    the model. One loop is usually sufficient.

-   `Distance from object` - The millimeters between the object and the
    skirt. The default of 6mm is usually sufficient.

-   `Skirt height` - The number of layers to lay down a skirt for. For
    ensuring the material is flowing smoothly, one layer is sufficient,
    however the skirt function can also be used to build walls around
    the object in case it should be protected from draughts.

-   `Minimum extrusion length` - Dictates a minimum number of
    millimeters that the skirt should be, should the loop around the
    object not be enough.

Cooling
=======



Temperature plays a key part in determining print quality. Too hot and
the material deforms, too cool and layer adhesion may be problematic.
Applying cooling will allow the freshly deposited material to solidify
enough to provide a good base for the next layer, helping with
overhangs, small details and bridges.

There are two main techniques for cooling: adding a fan and slowing down
the print speed. Slic3r may choose to use both techniques, using a fan
first, and then slowing down the print if the layer time is too fast.

 ![Cooling strategy.](expertmode/cooling_chart.png "fig:")


Figure  shows the strategy adopted by Slic3r.
Reading from right to left, when the minimum fan threshold (\#2) is
reached the fan is turned on. This increases in intensity as the layer
time decreases. The print speed remains constant until the estimated
print time drops below a certain threshold (\#1), this is when the print
speed is reduced until it reaches it’s minimum value.

Fans
----

 Most electronics and firmware allow the addition of a fan via
a spare connector. These can then be instructed with G-code, from
Slic3r, to turn on or off as the model requires, and to rotate at
different speeds.

Care should be taken with the positioning of the fan so that it does not
cool any heated bed more than necessary. It should also not cool the
heater block of the hot-end so as not to force it to do more work and
waste energy. The air movement should aim for the nozzle tip, flowing
over the freshly extruded material.

A duct may help in guiding the flow correctly, and there are several
designs available online, for a wide variety of printers.

Slowing Down
------------

 Slic3r can tell the printer to slow down if the
estimated layer time is above a certain threshold.

Care must be taken as the intended effect could be mitigated by the
nozzle not moving far enough away from the fresh extrusion, a problem
with small, detailed layers. For this reason it is usually recommended
to use a fan where possible.

Configuring
-----------



In simple mode Slic3r will attempt to choose the optimal settings for
both fans and speed. Expert mode gives more granular options.

 ![Cooling advanced
settings.](expertmode/cooling_advanced_settings.png "fig:")


-   `Fan speed` - Determines the minimum and maximum speeds - useful for
    fans that run too fast by default.

-   `Bridges fan speed` - As the material stretches over wide gaps, it
    makes sense to try and cool it as much as possible, therefore a full
    fan speed is recommended.

-   `Disable fan for first n layers` - Section
     detailed how important the first
    layer is, and so it makes sense not to apply the fan until sure the
    print is securely attached to the bed. Keeping the fan turned off
    for the first two or three layers is a good idea.

-   `Keep fan always on` - Overrides any other choices and has the fan
    run continuously, at least at the minimum speed setting. This can be
    useful when printing with PLA, but is not recommended for ABS.

-   `Enable fan if print time is below t seconds` - Triggers the fan if
    the layer will be completed within the given number of seconds.

-   `Slow down if layer print time is below t seconds` - Slows down the
    print if the layer will be completed within the given number of
    seconds.

-   `Min print speed` - A lower limit on how slowly a layer can be
    printed.

Support Material
================



Generally, most 3D models will print with overhanging parts by up to a
certain degree. The angle is determined by several factors, most notably
layer height and extrusion width, and is usually around 45°. For models
with larger overhangs a support structure may have to be printed below
it. This incurs the use of more material, longer print times, and post
printing clean-up.

 ![Support structure
options.](expertmode/support/advanced_support.png "fig:")


The first thing to do is activate the support material option by
checking the `Generate support material` box. Providing a value of zero
to the `Overhang threshold` parameter tells Slic3r to detect places to
provide support automatically, otherwise the degrees given will be used.
Support generation is a relatively complex topic, and there are several
aspects which determine the optimal support, it is strongly recommended
to set the threshold to zero and allow Slic3r to determine the support
required.

Small models, and those with small footprints, can sometimes break or
detach from the bed. Therefore the `Enforce support` option will cause
support structures to be printed for the given number of layers,
regardless of the angle threshold value.

To demonstrate the infill patterns the minimug model was tilted by 45°
along the x axis, as shown in figure .

 ![Minimug model, tilted
45°.](expertmode/support/support_minimug_45deg.png "fig:")


As with infill, there are several patterns available for the support
structure.

 ![Support infill pattern:
Rectilinear](expertmode/support/support_pattern_rectlinear.png "fig:")


 ![Support infill pattern: Rectilinear
Grid](expertmode/support/support_pattern_rectlinear_grid.png "fig:")


 ![Support infill pattern:
Honeycomb](expertmode/support/support_pattern_honeycomb.png "fig:")


`Pattern Spacing` determines the distance between support lines, and is
akin to infill density apart from being defined only in mm. If changing
this attribute take into account the width of the support extrusion and
the amount of support material that will adhere to the object.

Care should be taken to choose a support pattern which matches the
model, where the support material attaches perpendicularly to the wall
of the object, rather than in parallel, so it will be easy to remove. If
the support structure does run along the length of a wall then the
`Pattern Angle` option allows the direction of the support lines to be
rotated.

 ![Example of pattern angle rotated
45°.](expertmode/support/support_pattern_rectlinear_rotated.png "fig:")


Multiple Extruders
==================



A printer with more than one extruder can be used in different ways: The
additional extruder could print a different colour or material; or it
could be assigned to print particular features, such as infill, support
or perimeters.

Multi-material printing requires a suitably designed object usually
written in AMF format as this can handle multiple materials (see Model
Formats in §). Details on how to create such a file
are given below.

Configuring Extruders
---------------------



In the `Printer Settings` tab there is an `Extruders` option, under
`Capabilities`, which allows the number of extruders to be defined.
Incrementing this value will dynamically add another extruder definition
to the left-hand pane.

 ![Multiple extruder options - Printer Settings Tab (General). Note
the two extruders defined in the left-hand
pane.](expertmode/multipleextruders/printer_settings_general_multiple_extruder_options.png "fig:")


Each extruder can be configured as usual, however there are additional
settings which must be set which are particular to multi-extruder
setups.

 ![Multiple extruder options - Printer Settings Tab
(Extruder).](expertmode/multipleextruders/printer_settings_extruder_multiple_extruder_options.png "fig:")


The `Extruder offset` is to be used should the firmware not handle the
displacement of each additional nozzle. Your firmware documentation
should tell you if this is the case. Each additional extruder is given
an offset in relation to the first one. If the firmware does handle this
then all offsets can remain at 0,0.

Because the secondary extruder will be dormant whilst the first is
working, and vice-versa, it is important that the material is
sufficiently retracted to stop oozing. As with the regular retraction
settings (see p. ) the `Length` options is measured from the raw
filament entering the extruder.

Assigning Filaments
-------------------

 When a printer profile with multiple
extruders has been selected the `Plater` tab allows the selection of a
different filament for each extruder.

 ![Plater with multiple filament
options.](expertmode/multipleextruders/plater_multi_filament.png "fig:")


Assigning Extruders for Single-material Objects
-----------------------------------------------



For single material prints, where the secondary extruder is to be tasked
with a particular extrusion, the `Multiple Extruders` section of the
`Print Settings` tab gives the ability to assign an extruder to each
extrusion type.

 ![Multiple extruder options - Print Settings
Tab.](expertmode/multipleextruders/print_settings_multiple_extruder_options.png "fig:")


Configuring Tool Changes
------------------------



The `Custom G-code` section of the `Printer Settings` tab has an option
for inserting G-code between tool changes. As with all custom G-code
sections, placeholder variables can be used to reference Slic3r
settings. This includes the [previous\_extruder] and [next\_extruder]
variables.

 ![Multiple extruder options - Tool change
G-code.](expertmode/multipleextruders/printer_settings_custom_gcode.png "fig:")


Printing Multi-material Objects
-------------------------------



If a multi-material AMF file already exists, because the CAD program can
export such a format, then this can be loaded into Slic3r in the usual
way. The mapping between object materials and extruders is sequential,
i.e. the first material is assigned to the first extruder, etc.

Generating multi-material AMF files
-----------------------------------



Slic3r has the feature to combine multiple STL files into a
multi-material AMF file.

-   Split the original design into the separate parts within the CAD
    program, and export each part as STL.

-   Within Slic3r, choose `Combine multi-material STL files...` from the
    `File` menu.

-   When prompted with a file dialog, choose the first STL, which will
    be assigned the first material (and hence the first extruder). Click
    `Open` to be prompted for the next STL, and so on until each STL is
    assigned a material. To signal there are no more STL files, choose
    `Cancel`.

-   The following file dialog prompts for the location and name of the
    AMF file.

Once generated the file can be loaded and printed as described above.

Extrusion Width
===============



 ![Extrusion widths
options.](expertmode/advanced_extrusion_widths_options.png "fig:")


One reason for modifying the extrusion width has already been discussed:
increasing first layer extrusion width in order to improve bed adhesion
(see p.). There are some further cases where it may be beneficial to
modify extrusion widths.

-   `Perimeter` - A lower value will produce thinner extrusions which in
    turn will produce more accurate surfaces.

-   `Infill` and `Solid Infill` - A thicker extrusion for infill will
    produce faster prints and stronger parts.

-   `Top infill` - A thinner extrusion will improve surface finish and
    ensure corners are tightly filled.

-   `Support material` - As with the infill options, a thicker extrusion
    will speed up print time.

It is important to remember that if the extrusion width is expressed as
a percentage then this is computed from the `Layer height` property, and
not the `Default extrusion width` setting.

Variable Layer Height
=====================



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
heights.](expertmode/variable_layer_height/example_model.png "fig:")


 ![Example with normal layer
height.](expertmode/variable_layer_height/example_gcode_normal_layer_heights.png "fig:")


The variable layer height options are available by double clicking on a
part name in the Plater window. This will cause a pop-up window to be
displayed which contains two tabs. The first gives some information
about the model, as shown in fig.
.

 ![Variable layer height options -
Info.](expertmode/variable_layer_height/variable_layer_height_options_tab_1.png "fig:")


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
Layers.](expertmode/variable_layer_height/variable_layer_height_options_tab_2.png "fig:")


The resulting G-Code (fig.
) shows a higher
definition which should result in a higher quality print.

 ![Example with variable layer
height.](expertmode/variable_layer_height/example_gcode_variable_layer_heights.png "fig:")


Fig.  shows the example model printed. The print on
the left has 0.4mm layer height throughout, whereas the print on the
right has the variable layer height.

 ![Example print with variable layer
height.](expertmode/variable_layer_height/example_print.jpg "fig:")


An additional feature of the variable layers height option is that by
entering a zero for a range that part of the model will not be printed.
Fig.  shows the G-Code where layers
between 0 and 4mm are skipped. This is a useful way of dividing a tall
model into multiple, shorter sections which can be printed individually
and assembled afterwards.

 ![Example with skipped
layers.](expertmode/variable_layer_height/example_gcode_skipped_layers.png "fig:")


[^1]: Taken from http://gcode.ws
