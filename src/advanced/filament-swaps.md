% Manual Filament Swaps with Slic3r.

This page explains a useful trick to use Slic3r to use manual filament swaps in lieu of multiple extruders. 

#### Theory & Overview

Slic3r has the ability to insert custom G-Code at the point of every toolchange, and this G-Code is always inserted if a tool change event occurs. 

Normally, with a single extruder you would never generate a toolchange event from Slic3r; but we can override that with modifier meshes. Also, you'll need to tell Slic3r you have more than one extruder temporarily so that you can edit the configuration.

#### Procedure

1. Load your model into the plater.
1. Right-click on the 
1. Add a new modifier mesh. For this, we use the slab modifier. Any modifier will do. 
    * You want to enclose the entire area you want to be the new color/filament.
![image](images/manual-swap/generic-modifier.png)
1. Select the modifier mesh and set the extruder to 2.
1. Move the modifer mesh where you want to to be on the model.
1. Click "ok"
1. Open Printer Settings.
1. Change the number of extruders to 2. 
![image](images/manual-swap/extruders-2.png)
1. Select "Custom G-Code"
1. Scroll down to Tool-Change G-Code. 
1. Add whatever you need to implement the filament swap here.
     * Marlin firmware has M600 available if you have an LCD for the swap.
1. Go back to the Printer settings page.
1. Change the number of extruders to 1. 
![image](images/manual-swap/extruder-1.png)
1. Save this profile as a new profile.
1. Download [this post processing script](https://github.com/alexrj/Slic3r/tree/master/utils/post-processing/strip-toolchange.pl)
1. Open Print Settings.
1. Select "Output Options"
1. Add the path to the post processing script to the Post-Processing scripts.
    * See [Post-Processing Scripts](/advanced/post-processing) for more information.


#### Notes

This technically works with anything that would cause a toolchange event; so selecting different support extruder, etc, would work the same way. More complex usages may cause a lot of swaps, so you have been warned.
