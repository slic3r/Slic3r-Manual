% Infill Patterns and Density

There are several considerations when choosing an infill pattern: object
strength, time and material, personal preference. It can be inferred
that a more complex pattern will require more moves, and hence take more
time and material.

 ![Infill pattern
settings.](images/infill_pattern_settings.png "fig:")


Slic3r offers several infill patterns, four regular, and three more
exotic flavours. The numbers given in brackets below each figure are a
rough estimate of material used and time taken for a simple 20mm cube
model[^1]. Note that this is only indicative, as model complexity and
other factors will affect time and material.

 ![Infill pattern: Line (344.51mm /
5m:20s)](images/infill_line.png "fig:") 

 ![Infill pattern: Rectilinear (350.57mm /
5m:23s)](images/infill_rectilinear.png "fig:")


 ![Infill pattern: Concentric (351.80mm /
5m:30s)](images/infill_concentric.png "fig:")


 ![Infill pattern: Honeycomb (362.73mm /
5m:39s)](images/infill_honeycomb.png "fig:") 

 ![Infill pattern: Hilbert Curve (332.82mm /
5m:28s)](images/infill_hilbertcurve.png "fig:")


 ![Infill pattern: Archimedean Chords (333.66mm /
5m:27s)](images/infill_archimedeanchords.png "fig:")


 ![Infill pattern: Octagram Spiral (318.63mm /
5m:15s)](images/infill_octagramspiral.png "fig:")


Certain model types are more suited for a particular pattern, for
example organic versus mechanical types. Figure
 shows how a honeycomb fill may
suit this mechanical part better because each hexagon bonds with the
same underlying pattern each layer, forming a strong vertical structure.

 ![Infill pattern comparison in a complex object. Left to Right:
honeycomb, line](images/complex_object_infill_comparison.png "fig:")


Most models require only a low density infill, as providing more than,
say, 50% will produce a very tightly packed model which uses more
material than required. For this reason a common range of patterns is
between 10% and 30%, however the requirements of the model will
determine which density is best. Figure 
shows how the patterns change as the density increases.

 ![Infill patterns at varying densities. Left to Right:
20%,40%,60%,80%. Top to Bottom: Honeycomb, Concentric, Line,
Rectilinear, Hilbert Curve, Archimedean Chords, Octagram
Spiral](images/infills.png "fig:") 

[^1]: Taken from http://gcode.ws
