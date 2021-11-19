# visual-bezier-curve-generator
A visual editor for creating and seeing bezier curves

It turns out creating Bezier curves is extremely simple. I always thought it involved voodoo magic, but a video i encountered on youtube (the previous post to this page) made clear just how easy it was.
Bezier curves are essentially just triangles. If you were to normalize each side of the triangle, and iterate over its length from 0 - 1 , you could stretch a line that moves through it. (It's much clearer in the video). This line, moving through the interior of the triangle, is itself the bezier curve! All you need to do next is normalize that line, and use that to trace its path (the circle).
I created a little widget to show how this works. 

https://www.facebook.com/watch/?v=2822326148013998
