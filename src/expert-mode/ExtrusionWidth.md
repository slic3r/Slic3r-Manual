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
