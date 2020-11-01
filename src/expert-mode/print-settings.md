% Print Settings

This page will provide an overview of the available configuration settings in
Slic3r. Every configuration option has a tooltip and it is recommended to read
those tooltips. 

Print Settings
--------------

The `Print Settings` tab provides the opportunity to change settings
related to the actual print. Whereas the other tabs are changed rarely,
the settings on this tab will be modified regularly, possibly for each
model printed.

![Print Settings: Layers and Perimeters](images/print_settings_1.png "fig:")


#### Vertical Shells

`Perimeters` defines the minimum number of vertical shells (i.e. walls)
a print will have. Unless the model requires single width walls it is
generally recommended to have a minimum of two perimeters as this gives
some insurance that if a section of the perimeter is not printed
correctly then the second perimeter will help cover it. For structural parts 4 perimeters may be required.

`Spiral Vase` is for producing decorative (but weak objects). There is only a single layer, with the nozzle continuously creeping upwards like a corkscrew.

#### Horizontal Shells
`Solid Layers` is quite simply the number of layers the slicer will stack on top of each other at the top or bottom of the model. Never go below 2 layers unless for test purposes as the top will not be strong. If you are using variable layer height, it is worth setting `Minimum shell thickness` too.

`Minimum shell thickness` defines the top and bottom solid thickness in millimetres instead of layers. This is useful if you are using variable layer height but want to keep a defined physical thickness. Note that if this thickness is greater than the equivalent layers set in `Solid Layers` it will override `Solid Layers`.

`Enforce 100% fill volume` is an experimental option. Refer to the in-slicer tooltip for information as this feature is subject to change.




