# Sequential Printing

When printing several objects at once it can be useful to print each one
separately as this will minimise oozing and strings running between the
prints. It will also decrease the risk of a problem ruining the entire
print &mdash; if one part detaches or fails in some way, it will not be
dragged into other parts of the print during each layer.

 ![Sequential printing
options.](images/sequential_printing_options.png "fig:")

### Extruder Clearance

Care has to be taken that the nozzle and extruder does not interfere
with already printed parts. Slic3r should warn if it detects the nozzle
or extruder will collide with a part, but double check that the layout
of the parts will not cause problems. The `Extruder clearance`
parameters help Slic3r detect potential collisions:

-   `Radius` &ndash; The clearance that should be given around the extruder.
    Take care if the extruder is not mounted centrally &mdash; take the
    largest safe value.

-   `Height` &ndash; The vertical distance between the nozzle tip and the X
    axis rods, or lowest part which may interfere with a finished print.

 ![The clearance cylinder around an
extruder.](images/extruder_clearance.jpg "fig:")

### Print Order

By default, sequentially printed objects are printed in order of height (from
shortest to tallest). In the majority of cases, this behavior minimizes issues
with height clearance around the extruder. In specific use cases, one may wish
to manually order sequentially printed objects. This may be achieved by modifying
the optional sequential-print-priority parameter (default: 0) for each object.
This option may be accessed either by double-clicking on the object in the 3D
plater view or by selecting the object and clicking on the "Settings" button in
the toolbar. Objects assigned the same print priority are sorted in order of
height.

 ![Sequential print order
options.](images/sequential_printing_order.png "fig:")
