% Configuration Wizard

Slic3r has two features to aid newcomers: the configuration wizard, and
simple mode.

Sometimes it is nice to have a helping hand when starting out with new
software. The configuration wizard asks a series of questions and
creates a configuration for Slic3r to start with.

 ![Configuration Wizard: Welcome
Screen](images/configuration-wizard/configuration_wizard_welcome.png "fig:")


1. Firmware Type
----------------

 The gcode produced by Slic3r is tailored to
particular types of firmware. The first step prompts for the firmware
that the printer uses. This should have been specified when the printer
was built or configured. If unsure then contact the supplier.

 ![Configuration Wizard: Firmware
Type](images/configuration-wizard/configuration_wizard_firmware_type.png "fig:")


2. Bed Size
-----------

 This setting defines the maximum distance the
extruder may travel along the X and Y axis. If the dimensions are not
readily available for the printer then it can be easily measured.

Be sure to measure from the lower left corner where the extruder nozzle
rests when at the home position to the maximum distance the nozzle can
travel in each direction. Take into account that the X carriage may
touch the frame before the nozzle reaches it’s full distance, this will
depend on the printer make and model.

Also remember to check any firmware end-stop settings that may limit
X/Y movement.

 ![Configuration Wizard: Bed
Size](images/configuration-wizard/configuration_wizard_bed_size.png "fig:")


3. Nozzle Diameter
------------------

The diameter of the hot-end nozzle is usually clearly displayed either in
the description of the hot-end, or in the associated documentation, when the
hot-end is purchased. Common values are 0.5mm and 0.35mm.

If the nozzle was home-made, or came from a source without a diameter
given, then carefully measure the aperture as accurately as possible.
One way of determining nozzle size is to very slowly (1mm/s) extrude
some filament into free air and measure the thickness of the resulting
extrusion[^1]. This has the benefit of taking die swell into account,
and consequently may be a useful thing to do even if the diameter is
known.

 ![Configuration Wizard: Nozzle
Diameter](images/configuration-wizard/configuration_wizard_nozzle_diameter.png "fig:")


4. Filament Diameter
--------------------

For Slic3r to produce accurate results it must know as accurately as possible
how much material is pushed through the extruder. Therefore it is vital to give
it as precise a value as possible for the filament diameter.

Although the filament used in FDM printers is sold as being either 3mm
or 1.75mm this is only a general guide. The diameter can vary between
manufacturers and even between batches. Therefore it is highly
recommended to take multiple measurements from along a length of the
filament and use the average. For example, measurements of 2.89, 2.88,
2.90 and 2.91 would yield an average of 2.895, and so this would be
used.

 ![Configuration Wizard: Filament
Diamter](images/configuration-wizard/configuration_wizard_filament_diameter.png "fig:")


5. Extrusion Temperature
------------------------

The extrusion temperature will depend on the material, and most can operate
over a range of temperatures. The supplier should provide guidance as to which
temperatures are suitable. A very general rule of thumb is that PLA lies between
160°C and 230°C, and ABS lies between 215°C and 250°C. More exotic materials
will have a different range.

This is one parameter which you will want to fine tune when you start producing
prints. The optimal temperature can vary even between colours of the same
material from the same manufacturer. Another factor that may affect the chosen
temperature is how fast the extrusion is, where generally faster
extrusion requires a higher temperature.

Note: One may choose to control the extruder temperature manually from
the printer controller. In this case the temperature can be set to zero.

 ![Configuration Wizard: Extrusion
Temperature](images/configuration-wizard/configuration_wizard_extrusion_temperature.png "fig:")


6. Bed Temperature
------------------

If the printer has a heated bed then this parameter may be set. As with the
extruder temperature, the value will depend on the material used. A rule of
thumb is that PLA requires 60°C and ABS requires 110°C.

Note: One may choose to control the bed temperature manually from the
printer controller. In this case the temperature can be set to zero.

 ![Configuration Wizard: Bed
Temperature](images/configuration-wizard/configuration_wizard_bed_temperature.png "fig:")


At this stage the wizard is complete and the basic configuration is defined.

 ![Configuration Wizard:
End](images/configuration-wizard/configuration_wizard_end.png "fig:")


[^1]: <http://forums.reprap.org/read.php?1,113374,113953>
