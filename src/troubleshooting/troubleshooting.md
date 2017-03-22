Z Wobble
---------

Undulations in the walls of a print may be due to wobble in the Z axis.
A thorough analysis of the potential causes is given by whosawhatsis[^1]
in his article "Taxonomy of Z axis artifacts in extrusion-based 3d
printing"[^2], however one point of particular interest for users of
Slic3r is the wobble caused by motor steps not matching the pitch of the
Z rods thread. This can be addressed by ensuring the `Layer Height`
setting is a multiple of the full step length.

The relevant part of the above paper is quoted here:

[^1]: <http://goo.gl/iOYoK>

[^2]: <http://goo.gl/ci9Gz>
