Sequential Printing
===================



When printing several objects at once it can be useful to print each one
separately as this will minimise oozing and strings running between the
prints. It will also decrease the risk of a problem ruining the entire
print - if one part detaches or fails in some way, it will not be
dragged into other parts of the print during each layer.

 ![Sequential printing
options.](simple_mode/sequential_printing_options.png "fig:")


Care has to be taken that the nozzle and extruder does not interfere
with already printed parts. Slic3r should warn if it detects the nozzle
or extruder will collide with a part, but double check that the layout
of the parts will not cause problems. The `Extruder clearance`
parameters help Slic3r detect potential collisions:

-   `Radius` - The clearance that should be given around the extruder.
    Take care if the extruder is not mounted centrally - take the
    largest safe value.

-   `Height` - The vertical distance between the nozzle tip and the X
    axis rods, or lowest part which may interfere with a finished print.

 ![The clearance cylinder around an
extruder.](simple_mode/extruder_clearance.jpg "fig:")

