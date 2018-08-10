% Filament Settings

Filament Settings
-----------------

The `Filament Settings` will normally be used infrequently, for example
on receipt of a new roll of filament.

 ![Simple Mode: Filament
Settings.](images/filament_settings_1.png "fig:")


#### Filament.

 The `Diameter` setting will already have been filled from
the value given during the wizard (see p.), but can be updated here.

The `Extrusion multiplier` setting allows the fine tuning of the
extrusion flow rate, and is is given as a factor, e.g. 1 means 100%, 1.5
would mean 150%. Whilst the value should ideally be set in the firmware
it can be useful to test slight changes to the rate by altering this
value. It varies the amount of plastic proportionally and should be
changed in very small steps (e.g. +/- 0.05) as the effects are very
visible.

#### Temperature.

 These values are also filled from the wizard, but here
the opportunity exists to set the temperature for the first layer (see
p.).

#### Optional Information

Some optional information for the density and cost of the filament can be added
to aid in projected weight and cost calculations.


#### Custom G-code

Custom G-code can be added on a per-filament basis, exactly as in Printer
Settings.  Filament custom start G-code is always executed after the printer
start gcode and the end gcode is executed before printer end gcode.

#### Overrides

- `Max volumetric speed` overrides the value given in Printer Settings. See that topic for more informaition.
- `Compatible Printers` works the same as the option in Printer Settings. Set that topic for more information.
