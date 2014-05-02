Calibration
===========

[calibration]

Before even attempting the first print it is vital that the printer is
correctly calibrated. Skipping or rushing this step will result in
frustration and failed prints later, so it is important to take the time
to make sure the machine is correctly set up.

Each machine may have it’s own calibration procedure and this manual
will not attempt to cover all the variations. Instead here is a list of
key points that should be addressed.

-   Frame is stable and correctly aligned.

-   Belts are taut.

-   Bed is level in relation to the path of the extruder.

-   Filament rolls freely from the spool, without causing too much
    tension on the extruder.

-   Current for stepper motors is set to the correct level.

-   Firmware settings are correct including: axis movement speeds and
    acceleration; temperature control; end-stops; motor directions.

-   Extruder is calibrated in the firmware with the correct steps per mm
    of filament.

The point regarding the extruder step rate is vital. Slic3r expects that
the machine will accurately produce a set amount of filament when told
to do so. Too much will result in blobs and other imperfections in the
print. Too little will result in gaps and poor inter-layer adhesion.

Please refer to the printer documentation and/or resources in the 3D
printing community for details on how best to calibrate a particular
machine.

Configuration Wizard
====================



Slic3r has two features to aid newcomers: the configuration wizard, and
simple mode.

Sometimes it is nice to have a helping hand when starting out with new
software. The configuration wizard asks a series of questions and
creates a configuration for Slic3r to start with.

 ![Configuration Wizard: Welcome
Screen](configuration_wizard/configuration_wizard_welcome.png "fig:")


1. Firmware Type
----------------

 The gcode produced by Slic3r is tailored to
particular types of firmware. The first step prompts for the firmware
that the printer uses. This should have been specified when the printer
was built or configured. If unsure then contact the supplier.

 ![Configuration Wizard: Firmware
Type](configuration_wizard/configuration_wizard_firmware_type.png "fig:")


2. Bed Size
-----------

 This setting defines the maximum distance the
extruder may travel along the X and Y axis. If the dimensions are not
readily available for the printer then it can be easily measured.

Be sure to measure from the lower left corner where the extruder nozzle
rests when are the home position to the maximum distance the nozzle can
travel in each direction. Take into account that the X carriage may
touch the frame before the nozzle reaches it’s full distance, this will
depend on the printer make and model.

Also remember to check any firmware end-stop settings which may limit
X/Y movement.

 ![Configuration Wizard: Bed
Size](configuration_wizard/configuration_wizard_bed_size.png "fig:")


3. Nozzle Diameter
------------------

 The diameter of the hot-end nozzle is usually
clearly displayed either in the description of the hot-end, or in the
associated documentation, when the hot-end is purchased. Common values
are 0.5mm and 0.35mm.

If the nozzle was home-made, or came from a source without a diameter
given, then carefully measure the aperture as accurately as possible.
One way of determining nozzle size is to very slowly (1mm/s) extrude
some filament into free air and measure the thickness of the resulting
extrusion[^1]. This has the benefit of taking die swell into account,
and consequently may be a useful thing to do even if the diameter is
known.

 ![Configuration Wizard: Nozzle
Diameter](configuration_wizard/configuration_wizard_nozzle_diameter.png "fig:")


4. Filament Diameter
--------------------

 For Slic3r to produce accurate results it
must know as accurately as possible how much material is pushed through
the extruder. Therefore it is vital to give it as precise a value as
possible for the filament diameter.

Although the filament used in FDM printers is sold as being either 3mm
or 1.75mm this is only a general guide. The diameter can vary between
manufacturers and even between batches. Therefore it is highly
recommended to take multiple measurements from along a length of the
filament and use the average. For example, measurements of 2.89, 2.88,
2.90 and 2.91 would yield an average of 2.895, and so this would be
used.

 ![Configuration Wizard: Filament
Diamter](configuration_wizard/configuration_wizard_filament_diameter.png "fig:")


5. Extrusion Temperature
------------------------

 The extrusion temperature will depend on
the material, and most can operate over a range of temperatures. The
supplier should provide guidance as to which temperatures are suitable.
A very general rule of thumb is that PLA lies between 160°C and 230°C,
and ABS lies between 215°C and 250°C. More exotic materials will have a
different range.

This is one parameter which you will want to fine tune when you start
producing prints. The optimal temperature can vary even between colours
of the same material. Another factor which may affect the chosen
temperature is how fast the extrusion is, where generally faster
extrusion runs hotter.

Note: One may choose to control the extruder temperature manually from
the printer controller. In this case the temperature can be set to zero.

 ![Configuration Wizard: Extrusion
Temperature](configuration_wizard/configuration_wizard_extrusion_temperature.png "fig:")


6. Bed Temperature
------------------

 If the printer has a heated bed then this
parameter may be set. As with the extruder temperature, the value will
depend on the material used. A rule of thumb is that PLA requires  60°C
and ABS requires  110°C.

Note: One may choose to control the bed temperature manually from the
printer controller. In this case the temperature can be set to zero.

 ![Configuration Wizard: Bed
Temperature](configuration_wizard/configuration_wizard_bed_temperature.png "fig:")


At this stage the wizard is complete and the basic configuration is
defined.

 ![Configuration Wizard:
End](configuration_wizard/configuration_wizard_end.png "fig:")


The Important First Layer
=========================

 Before delving into producing the
first print it is worthwhile taking a little detour to talk about the
importance of getting the first layer right. As many have found through
trial and error, if the first layer is not the best it can be then it
can lead to complete failure, parts detaching, and warping. There are
several techniques and recommendations one can heed in order to minimise
the chance of this happening.

#### Level bed.

 Having a level bed is critical. If the distance between
the nozzle tip and the bed deviates by even a small amount it can result
in either the material not lying down on the bed (because the nozzle is
too close and scrapes the bed instead), or the material lying too high
from the bed and not adhering correctly.

#### Higher temperature.

 The extruder hot-end and bed, if it is heated,
can be made hotter for the first layer, thus decreasing the viscosity of
the material being printed. As a rule of thumb, an additonal 5° is
recommended.

#### Lower speeds.

 Slowing down the extruder for the first layer
reduces the forces applied to the molten material as it emerges,
reducing the chances of it being stretched too much and not adhering
correctly. 30% or 50% of the normal speed is recommended.

#### Correctly calibrated extrusion rates.

 If too much material is laid down
then the nozzle may drag through it on the second pass, causing it to
lift off the bed (particularly if the material has cooled). Too little
material may result in the first layer coming loose later in the print,
leading either to detached objects or warping. For these reasons it is
important to have a well-calibrated extrusion rate as recommended in
§[calibration]).

#### First layer height.

 A thicker layer height will provide more
flow, and consequently more heat, making the extrusion adhere to the bed
more. It also gives the benefit of giving more tolerance for the
levelness of the bed. It is recommended to raise the first layer height
to match the diameter of the nozzle, e.g. a first layer height of 0.35mm
for a 0.35mm nozzle. Note: The first layer height is set this way
automatically in simple mode.

#### Fatter extrusion width.

 The more material touching the bed, the
better the object will adhere to it, and this can be achieved by
increasing the extrusion width of the first layer, either by a
percentage or a fixed amount. Any spaces between the extrusions are
adjusted accordingly.

A value of approximately 200% is usually recommended, but note that the
value is calculated from the layer height and so the value should only
be set if the layer height is the highest possible. For example, if the
layer height is 0.1mm, and the extrusion width is set to 200%, then the
actual extruded width will only be 0.2mm, which is smaller than the
nozzle. This would cause poor flow and lead to a failed print. It is
therefore highly recommended to combine the high first layer height
technique recommended above with this one. Setting the first layer
height to 0.35mm and the first extrusion width to 200% would result in a
nice fat extrusion 0.65mm wide.

#### Bed material.

 Many options exist for the material to use for the
bed, and preparing the right surface can vastly improve first layer
adhesion.

PLA is more forgiving and works well on PET, Kapton, or blue painters
tape.

ABS usually needs more cajoling and, whilst it can print well on PET and
Kapton, there are reports that people have success by applying hairspray
to the bed before printing. Others have reported that an ABS slurry
(made from dissolving some ABS in Acetone) thinly applied can also help
keep the print attached.

#### No cooling.

 Directly related with the above, it makes no sense to
increase the temperature of the first layer and still have a fan or
other cooling mechanism at work. Keeping the fan turned off for the
first few layers is generally recommended.

Working with Models
===================



Yet another step lies between now and the first print - a model has to
found and then sliced.

Model Formats
-------------



Slic3r accepts the following file types.

-   STereoLithography (STL) files can come from a wide variety of
    sources and are now a de facto standard in 3D printing. The files
    simply describe the surface geometry of a 3D object without any
    additional information (such as colour or material), and it is this
    simplicity that has probably made the format ubiquitous.

-   Wavefront OBJ files are an open format originally used in an
    animation application from Wavefront Technologies, but has since
    been adopted by the wider 3D modelling community. It is similar to
    the STL format.

-   Additive Manufacturing File Format (AMF) was developed in response
    to the limited nature of the STL format. In addition to describing
    the geometry of the 3D model it can also describe colours and
    materials, as well as more complex attributes, such as gradient
    mixes and multiple object arrangements (constellations). Whilst the
    format is deemed a standard it has yet to be widely adopted in the
    3D maker community.

Finding Models
--------------



The 3D model files may come from an online repository, such as
Thingiverse[^2] or GrabCAD[^3], or be created from a CAD program, such
as FreeCAD[^4], Sketchup[^5], or OpenSCAD[^6], or an online CAD tool
such as Shapesmith[^7].

You may wish to view the files before slicing and there are many free
applications available, one of which is Meshlab[^8] - a comprehensive
tool for viewing and working with 3D files.

 ![Shapesmith online CAD
tool.](working_with_models/shapesmith.png "fig:") 

Working with Plater
-------------------

 Slic3r has a tool, called Plater, which
allows one or more models to be loaded and arranged before being sliced.

 ![Plater](working_with_models/plater.png "fig:") 

Once you have acquired a model, drag it onto the Plater window (or use
the Add button below the file list) to load it into Slic3r. In the
figure below, the traditional RepRap Minimug[^9] is loaded, and is
viewed from above. The ring around the model is a skirt - a single
perimeter, several millimeters away from the model, which is extruded
first. This is useful in making sure the plastic is flowing smoothly
from the nozzle when the model is starting to be printed.

 ![Minimug model.](working_with_models/minimug_model.png "fig:")


 ![STL file
loaded.](working_with_models/plater_model_loaded.png "fig:")


The model can be repositioned by dragging the representation of it on
the left of the screen around the bed. Note that the dimensions of the
bed should match your printer, as given during the initial configuration
above.

On the right-hand side is the list of currently loaded files. The
buttons along the top of the file list allow you to arrange the models.

-   **More/Less** - Adjust how many copies should be printed.

-   **45°/Rotate** - Rotate the selected model around the Z axis, either
    in 45° increments clockwise or counter-clockwise, or by a given
    amount.

-   **Scale** - Increase or decrease the size of the printed model.

-   **Split** - Divides a model which consists of more than one part
    into it’s constituent parts, allowing each one to be arranged
    individually.

The buttons along the bottom of the file list allow you to add, remove,
auto-arrange, or export the models.

-   **Add** - Opens a file dialog to add a model to the plater, as an
    alternative to dropping a file directly.

-   **Delete/Delete All** - Remove one or all models from the plater.

-   **Autoarrange** - Attempt to arrange the models to give the optimal
    layout.

-   **Export G-code** - Starts slicing the model and produces a G-Code
    file.

-   **Export STL** - Save the current set of models as a single STL
    file.

Cleaning STLs
-------------

 If the 3D mesh described in the model contains
holes, or edges are misaligned (known as being non-manifold), then
Slic3r may have problems working on it. Slic3r will attempt to fix any
problems it can, but some problems are out of its reach. If the
application complains that a model cannot be sliced correctly then there
are several options available: see the chapter about Repairing Models.

Printing
========



At this stage Slic3r has been configured and a model has been acquired,
sliced and made ready for print. Now would be the time to fire up the
printer and try it out.

A variety of host software is available to send the G-code to the
printer. Amongst the open-source solutions are: Printrun[^10],
Repetier[^11] and Repsnapper[^12].

The following sections will cover the options available in expert mode,
and look at advanced printing techniques, including special cases and
troubleshooting.

[^1]: <http://forums.reprap.org/read.php?1,113374,113953>

[^2]: <http://www.thingiverse.com>

[^3]: <http://grabcad.com>

[^4]: <http://sourceforge.net/projects/free-cad>

[^5]: <http://www.sketchup.com>

[^6]: <http://www.openscad.org>

[^7]: <http://shapesmith.net>

[^8]: <http://www.meshlab.org>

[^9]: <http://www.thingiverse.com/thing:18357>

[^10]: https://github.com/kliment/Printrun

[^11]: http://www.repetier.com/

[^12]: https://github.com/timschmidt/repsnapper
