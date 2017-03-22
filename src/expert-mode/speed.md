% Speed

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
options.](images/speed_advanced_settings.png "fig:")


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

## Speed Limits

In the Speed settings, there are two additional options for maximum print speed, Volumetric maximum and maximum. 

If you found what the maximum reasonable extrusion rate your printer can do at a given temperature, you can use either one of these to limit the speeds used by Slic3r.

There are 2 experimental methods to derive the max extrusion rate:

1. Print fast and use live tuning via M221 until you see or feel the filament slipping in the extruder (easy on a standard UM, maybe more difficult on others, and it heavily depends on the extruder mechanism how much pressure it can deliver without slipping).
2. Perform the following extruder calibration routine (either manually in pronterface, or with some to-be-done tool): Heat the printe's hotend up a middle of the road temp (i.e. 210C for PLA), and push i.e. 20mm filament through the nozzle at a given speed (steps/sec or mm/sec), starting with i.e. 1mm/s, and observe whether or not the filament was slipping. If not, continue increasing the speed by 20%, and test again. If so, this value indicates a maximum extrusion rate for this temperature has been reached. 
