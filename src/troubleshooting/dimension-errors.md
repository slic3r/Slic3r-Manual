% Dimension Errors

If you're not satisfied by the dimensional accuracy of your prints, first off make sure your **firmware** is correctly configured: the **steps/mm** values for **X, Y, and Z axes** must be calculated according to your belts, pulleys and leadscrews. Please don't calibrate by trial-and-error: those values should be exact. Use Josef Prusa's [Calculator](http://calculator.josefprusa.cz).

### Vertical dimensions

If your vertical dimensions are wrong (i.e. **along the Z axis**) -and your object is usually shorter than expected- it means your nozzle is **too low**, thus the first layer is pressed too much on the print bed. To fix this, you might want to raise your Z endstop or increase the *Z offset* option in Slic3r.

### Horizontal dimensions

The usual issue is about holes being too small. This usually only affects holes on the horizontal plane (XY). There are several reasons for this. Let's see them one by one:

#### Plastic shrinkage

Plastic **shrinks when cooling**. Different kinds of plastic exhibit different shrinkage, which might also depend on temperature. Because of such shrinkage, circular (or polygonal) holes laid by the extruder at the nominal diameter will end up smaller after cooling.

#### More material is deposited in the inside

When you extrude along a curve, more material per distance unit is deposited in the concave side. Such excessive material makes the internal radius shorter.
A [compensation algorithm](http://reprap.org/wiki/ArcCompensation) was proposed by Adrian Bowyer, and it was implemented in Slic3r some time ago but many users complained about holes being too large – it was removed thereafter since smaller holes are better than larger holes since they can be drilled.

#### Curves are approximated by polygons

STL files only contain meshes composed by flat triangles, so its planar sections can only contain polygonal shapes. For example, a circular hole is approximated by a polygon:

![image](images/dimension-errors/polygonal-hole.png)

Increasing the **number of segments** in your CAD before exporting the STL file will help reducing the error. OpenSCAD users might want to use the `polyhole()` function developed by [nophead](http://hydraraptor.blogspot.it/2011/02/polyholes.html) that calculates the optimal number of segments.

#### Filament tends to cut corners

Since curves are approximated by polygons, there are sharp vertices at their vertices. However, **plastic tends to make rounded corners**, thus reducing the internal area of the hole even more.

#### Z wobble

Even if the dimensional accuracy of a single layer was correct, several stacked layers might make the hole smaller if they're not exactly aligned. [Z wobble](troubleshooting#z-wobble) caused by mechanical issues will reduce hole size to the internal envelope of the stacked layers:

![image](images/dimension-errors/z-wobble.png)

#### Non-regular filament section

Low-quality and medium-quality filaments are not very regular in diameter. If you measure their diameter along a single meter of them, you'll often find many different values (and many low-quality filaments are even not perfectly round in section). This continuous **variation in diameter** will produce **irregular flow**  and the resulting hole will still be the internal envelope of all the layers:

![image](images/dimension-errors/irregular-filament.png)

#### Backlash

Backlash is a mechanical defect of one or more axes that basically reduces the amount of actual motion whenever a motor inverts its spinning direction. It's generally caused by loose belts. On printers with a moving bed, its axis (usually Y) is more subject to backlash because of inertia. So, **if you get different dimension errors in X and Y, that's caused by backlash**. You'll need to tighten your belt. No software hack can reasonably compensate for a badly assembled printer.

#### Flow math

Okay, all of the above causes do not depend on Slic3r and, when possible, they need to be fixed **before** attempting any software solution.

That said, the flow math used in Slic3r plays a good role in making correct dimensions, since it tries to guess what the shape of the extruded material will be and how thick the extrusion will result on the horizontal plane given an amount of material. Being an approximation, it carries an error. The usual way to deal with these issues involves tuning the *Extrusion Multiplier* setting in order to increase/reduce the amount of plastic, thus making extrusions more or less thick. But this will also affect solid surfaces, so it's not the ideal solution.

For more exact dimensions you need to check the **External Perimeters First** option. Printing external perimeters first will prevent the shift caused by extrudate overlap. On the other hand, printing internal perimeters first hides seams better, so it's your take.

A new **XY Size Compensation** option was also introduced that allows to grow/shrink object shape in order to compensate for the measured error. Supposing your holes are smaller by 0.1mm, you can just enter -0.05 in this option to get them compensated (negative sign means shrink inwards).
