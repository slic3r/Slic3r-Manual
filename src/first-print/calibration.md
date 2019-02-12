% Calibration

Before even attempting the first print it is vital that the printer is
correctly calibrated. Skipping or rushing this step will result in
frustration and failed prints later, so it is important to take the time
to make sure the machine is correctly set up.

Each machine may have it’s own calibration procedure and this manual
will not attempt to cover all the variations. Instead here is a list of
key points that should be addressed.

Prusa has some neat [Calculators](http://www.prusaprinters.org/calculator/) for setting up a printer. 

-   Frame is stable and correctly aligned.

-   Everything is wired up correctly

-   Belts are taut.

-   Bed is level in relation to the path of the extruder.

-   Filament rolls freely from the spool, without causing too much
    tension on the extruder.

-   Current for stepper motors is set to the correct level.

-   Firmware settings are correct including: axis movement speeds and
    acceleration; temperature control; end-stops; motor directions.

-   steps/mm are set up correctly (a good source: [Triffid hunters calibration guide](http://reprap.org/wiki/Triffid_Hunter%27s_Calibration_Guide))

-   Extruder is calibrated in the firmware with the correct steps per mm
    of filament.
    
-   A Host Software is installed on the Computer and the Printer is sucessfully connected

-   You have the appropriate tools

The point regarding the extruder step rate is vital. Slic3r expects that
the machine will accurately produce a set amount of filament when told
to do so. Too much will result in blobs and other imperfections in the
print. Too little will result in gaps and poor inter-layer adhesion.

Please refer to the printer documentation and/or resources in the 3D
printing community for details on how best to calibrate a particular
machine.

#### Tools:
- Calipher (good manual Caliphers are to be preferred over digital ones)
- Sensor gauge (or credit/business card)
- If possible get an Infrared thermometer and measure hot accurately your hotend will heat up. It should not have much difference

***
### Set up Slic3r initially
At first startup a Setup Wizard will occur and guide you through the basic settings. The most steps will be self explanatory but we will include them for completeness. 

1. Choose your G-code flavour. This should match your firmware. If you have a Smoothieboard for example, choose "Smoothieware"  
1. Set up your bed size (in mm)  
1. Choose your nozzle diameter - Do not measure around. Just put in the value you bought it with  
1. Type in your filament diameter (1.75 or 3mm) again - do not measure around. We will tweak this value later (Finetuning)  
1. Choose the temperature for the filament you are using: 190°(PLA) or 220°(ABS) - If provided use the middle of the Suppliers range
1. If you have a bed, set the bed temperature to 60°(PLA) or 110(ABS)  

Your Printer is now very roughly set up and you should be able to print

***
### Basic tuning
#### Requirements
- You are able to print with your rough setup
- Switch to expert mode
- Download the calibration files:  
[Heattower.stl](http://www.thingiverse.com/download:3237501)  
[20-mm box.stl](http://www.thingiverse.com/download:3246073)  

- Do this finetuning for every manufacturer/material you want to use for best results You will see why on the "temperature" part
 

#### Filamentsettings

##### Filament Diameter
- Get your caliphers and measure the thickness of your filament
- Move roughly ~20 centimeters further and measure again
- Repeat this step 4 times so you have 5 values and 1m of measured filament. The values could for example be: (1.72mm; 1.74mm; 1.73mm; 1.71mm; 1.77mm)
- Take the average by adding the values together and dividing them by 5:
```
1.72
1.74
1.73
1.71
1.77 +
=========
8.67/5 = 1.734 -> 1.73 (2 decimal places)
```
- Take the result with 2 decimal places (in this Example 1.73) and put it into your filament settings.

##### First Layer Height
A good tutorial for the first layer height can be found in the Slic3r manual [here](http://manual.slic3r.org/first-print/first-layer)

##### Temperature
For temperature settings you should first get the recommended temperature range from your supplyer.   

- Get the stl File
- Put it in Slic3r
- Go to Print Settings. Choose the following Settings:
``` cfg
General:
- Layer height: 0.2 mm
- Perimeters: 1
- Solid Layers Top: 0, Bottom: 3

Infill:
- Fill density: 0%

Speed:
- Perimeters: 40 mm/s 
``` 
Start printing the object with the max temperature of the supplyer. Whenever you see a indentation (every 5 mm), lower your temperature by 5°C.  
Stop the print when your nozzle can't print out enough Filament (as whown in the Example below) or the print quality decreases again
Here are two exaples:
![white heat tower](http://thingiverse-production-new.s3.amazonaws.com/renders/96/e3/5c/55/3d/491730c03f3cd431ee343f3425c278dc_display_large.jpg)
![brown heat tower](http://thingiverse-production-new.s3.amazonaws.com/renders/66/5b/99/36/76/cbd49ff4089968bef2847d5542caef73_display_large.jpg)

The area with the best layer adhesion AND best visuals is your perfect temperature for this particular speed and material. Usually the higher the Temparature the better the adhesion so you can take the highest, good looking Temperature.

If you don't reach your perfect temperature with one heatcube you can print another one starting with the last temperature.

You may also print another heattower, start by 5 degrees over your "perfect" temperature and decrease it by 1° steps. then choose a temperatue 2-3 degrees under the "too hot" temperature

In the examples you can also see why its important to do this with every material/Manufacturer: The filaments tend to have different ideal temperatures which ma even vary by colors from the same manufacturer.

##### Extrusion Multiplier
Print out the general purpose 20mm Cube with the following Settings:
``` cfg
- vase mode (single outline, no infill, no top or bottom layers)
- extrusion multiplier: 1
- extrusion width = nozzle width
```
- Measure the thickness of all 4 walls with a calipher and get an average of the 3 smallest values.
- Change your extrusion multiplier:  new multiplier = old multiplier x (extrusion width / average measurement)
- Repeat until you are happy

Tips:
- Make sure you measure from the top as the bottom might be flatted out from the Bed.
- if you have big variations it is a good idea to measure the side that is extruded last as the extrusion will have mostly stabilised by then
- Try to measure the smallest number of layers possible from top as the slightest vertical misalignment of your layers will increase the measured value. Ideally a single layer would be best but very difficult with regular calipers.
- Make sure you dont apply to much pressure with your caliphers (Make sure the measuring device is not biting into the filament during measurement.)


**Do not forget to save Your calibration settings.**

### Advanced tuning
#### Requirements
- You are able to print in reasonable quality after your "Basic Tuning"
- Switch to expert mode
- Download the calibration files:  
[Speedpillar.stl](http://www.thingiverse.com/download:3246074)  
[Retraction_Twins.stl](http://www.thingiverse.com/download:3246195) 
[overhang.stl](http://www.thingiverse.com/download:3247066) 

#### Speed
Once the printer is reliably producing good quality prints it may be desirable to increase the speed. Doing this provides several benefits, the most obvious of which is that the results are produced quicker, but also faster print times can be utilised in producing more layers, i.e. lower layer height, thus improving perceived print quality. An additional benefit is that a faster travel movement, between extrusions, can reduce the effects of oozing.

- For speed it is recommended to first adjust the travelspeed. Increment it slowly up until you can see errors and/or are not comfortable with anymore. Then take a value that is 10-20% lower.
- Always choose a reasonable low homing speed as the printhead will bash into the endstops just slightly and might damage them over time!
- It is also important to know that speed is limited by hardware setup, temperature *and* Data transfer. If the Hardware is capable enough you might switch to printing from *a good and fast high class rating* SD card as you might print up to 60% faster ;)  ( [video here](https://youtu.be/SBZ7MfvAsGc) )

##### Perimeters

1. start printing the speedpillar.stl with the following settings
```
Layers and Perimeters:
Perimeters: 2
Solid Layers Bottom: 2
Solid Layers top: 0
Infill: 0%

Speed:
Perimeters: 30mm/s
External Perimeters: 100%
```
1. Every few layers increase the Printing speed a bit until you see a visible decrease in print quality
1. Choose the speed with the best Visuals
1. Do the Temperature test from the part "Basic tuning"
1. Repeat the speedtest until you can not get a better result anymore.

Tips:
- if you increase Printspeeds, you layeradhesion might suffer. Check that out! A higher temperature could compensate for that.
- To get even more spead out you can try to install a high rated class 10+ SD-card [video comparisation here](https://youtu.be/SBZ7MfvAsGc)

1. After that set your outer perimeters to a lower Value. Personally I use 30mm/s for them no matter what (check if your temperature is not to high for that.) Same counts for first layer speed.
1. You might set your infill speed slightly faster but when tuning speed to max I would set them to 90-110% of Perimeter speed to ensure maximal stability and Layer bond.

#### Retraction
Typical Retraction issue:  
![retraction issue](https://lh3.googleusercontent.com/HmB7cE31oOWIs3adb_CgmxwJ_g0tjoU3mk7Pol3HXPSbvIE6QKc3AlJHVQOi1rrbPQ1_ZvDqyfolBoRO7QK6Cm_OymE)
To understand retraction it is important to understand one of the most common misunderstandings of retraction.

Retraction does *not* (only to a very minimal value) suck the melted filament out of the nozzle. instead it relieves pressure which forces the filament out.

There is a lot of misunderstanding out there on to which retraction values to choose. I've seen values out there between 0.1 and 20mm
The best value is the minimum amount required to stop oozing/leaking/stringing
- in general a value between 1 and 5mm* is good. If you still have issues with 5mm turn down the Temperature. Also increasing Travelspeed (Advanced tuning) might help.

1. Set up your travelspeed before tweaking retraction settings! (Part advanced tuning)
1. Print the retraction Twins with the following Settings:
```
- Layer Height: 0.3mm 
- Infill: 25% 
- Perimeters: 2
- Solid Top Layers: 2
- Solid Bottom Layers: 2

- Retraction: 0.5mm
- Retraction speed: 40-80mm/s based on what your hardware is capable of
```
1. Print the retraction twins with 0.5mm increased retraction until you almost cannot see any "blobs" anymore.
1. If 5mm are not enough try lowering your print temperature.

*Bowden setups might need a little more retraction as the filament will act like a spring in the bowden tube.

#### Max Overhang and Support material generation
It is in general good to know how much overhang you can print with and what the support treshold should be. This varies from materieal to material and also with layerheights

1. Print Overhang.stl with the following Settings:
```
Infill: 20%
Perimeters: 3
Top layers: 3
Bottom Layers: 3
```
2. Afterwards you can look at which overhang your printer starts to fail. set the support treshold in slicer below that treshold.

- It is recommended to have cooling enabled!

#### Bridging

### Final test
A common test for the own Printer is the ["Benchy"](http://www.thingiverse.com/thing:763622) - print it without support!
