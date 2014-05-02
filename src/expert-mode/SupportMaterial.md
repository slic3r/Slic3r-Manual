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

