% Cooling

Temperature plays a key part in determining print quality. Too hot and
the material deforms, too cool and layer adhesion may be problematic.
Applying cooling will allow the freshly deposited material to solidify
enough to provide a good base for the next layer, helping with
overhangs, small details and bridges.

There are two main techniques for cooling: **adding a fan** and **slowing down
the print speed**. Slic3r may choose to use both techniques, using a fan
first, and then slowing down the print if the layer time is too fast.

 ![Cooling strategy.](images/cooling_chart.png "fig:")

Figure shows the strategy adopted by Slic3r.
Reading from right to left, when the minimum fan threshold (#2) is
reached the fan is turned on. This increases in intensity as the layer
time decreases. The print speed remains constant until the estimated
print time drops below a certain threshold (#1), this is when the print
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

![Cooling settings.](images/cooling_advanced_settings.png)


-   `Keep fan always on` - If this is enabled, fan will never be disabled 
     and will be kept running at least at its minimum speed. Useful for PLA,
     harmful for ABS.

-   `Enable auto cooling` - This enables/disables the cooling logic. A 
    descriptive text below this option describes the effects of the 
    current configuration.

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

-   `Enable fan if print time is below t seconds` - Triggers the fan if
    the layer will be completed within the given number of seconds.

-   `Slow down if layer print time is below t seconds` - Slows down the
    print if the layer will be completed within the given number of
    seconds.

-   `Min print speed` - A lower limit on how slowly a layer can be
    printed.


