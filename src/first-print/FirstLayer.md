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
