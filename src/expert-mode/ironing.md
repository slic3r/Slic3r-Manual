% Ironing

 ![Left: ironing, Right: rectilinear](images/ironing_example.png "fig:")

The ironing is a new top fill pattern. It combines two rectilinear processes: a first coarse one at 90% flow and a second fine one with 10% flow ratio.

But For working well, the last layer must go to the correct height. If the previous layer it a bit below, there may be too much space and  some holes can be present

![Holes on the ironed surface](images/ironing_holes.png "fig:")

So you must have the previous layer at the correct height. When a bridge is made (over nothing or over infill), it can drop a bit, creating a void that propagates to the top layer. A new setting, "over-bridge flow ratio", near the "bridge flow ratio" setting, is here to compensate for this problem. At 1, it changes nothing. At 1.1, the layer over a bridge will push 10% more plastic. If your calibration piece shows some holes, you should up this setting a bit.

Holes can also appear if you are under-extruding, or not be a problem if you over-extrude.

Q: I don't really understand what it means by the right layer height...

A: It means that if you have a bit of under-extrusion at a top layer, it will be very visible as the process can't smooth the top layer if there are not enough plastic. Under-extrusion at the top is often due to the first top solid layer, dropping a bit because the sparse infill can't support it enough. The solution is to increase the over-bridge flow ratio setting.
